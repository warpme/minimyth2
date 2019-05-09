/*
 * FFMPEG DRM/KMS example application
 * Jorge Ramirez-Ortiz <jramirez@baylibre.com>
 *
 * Main file of the application
 *      Based on code from:
 *      	2001 Fabrice Bellard (FFMPEG/doc/examples/decode_video.c
 *      	2018 Stanimir Varbanov (v4l2-decode/src/drm.c)
 *
 * This code has been tested on Linaro's Dragonboard 820c
 *      kernel v4.14.15, venus decoder
 *      ffmpeg 4.0 + lrusacks ffmpeg/DRM support + review
 *      	https://github.com/ldts/ffmpeg  branch lrusak/v4l2-drmprime
 *
 * Copyright (c) 2018 Baylibre
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <xf86drm.h>
#include <xf86drmMode.h>
#include <drm_fourcc.h>
#include <sys/time.h>
#include <getopt.h>

#include <libavcodec/avcodec.h>
#include <libavutil/hwcontext_drm.h>

#define ALIGN(x, a)		((x) + (a - 1)) & (~(a - 1))
#define DRM_ALIGN(val, align)	((val + (align - 1)) & ~(align - 1))

#define INBUF_SIZE 4096

struct drm_buffer {
	unsigned int fourcc;
	unsigned int bo_handle;
	unsigned int fb_handle;
	int dbuf_fd;
	void *mmap_buf;
	uint32_t pitches[4];
	uint32_t offsets[4];
	uint32_t bo_handles[4];
};

struct drm_dev {
	int fd;
	uint32_t conn_id, enc_id, crtc_id, fb_id, plane_id, crtc_idx;
	uint32_t width, height;
	uint32_t pitch, size, handle;
	drmModeModeInfo mode;
	drmModeCrtc *saved_crtc;
	struct drm_dev *next;
};

static struct drm_dev *pdev;
static unsigned int drm_format;

#define DBG_TAG "  ffmpeg-drm"

#define print(msg, ...)							\
	do {								\
			struct timeval tv;				\
			gettimeofday(&tv, NULL);			\
			fprintf(stderr, "%08u:%08u :" msg,		\
				(uint32_t)tv.tv_sec,			\
				(uint32_t)tv.tv_usec, ##__VA_ARGS__);	\
	} while (0)

#define err(msg, ...)  print("error: " msg "\n", ##__VA_ARGS__)
#define info(msg, ...) print(msg "\n", ##__VA_ARGS__)
#define dbg(msg, ...)  print(DBG_TAG ": " msg "\n", ##__VA_ARGS__)

int drm_dmabuf_set_plane(struct drm_buffer *buf, uint32_t width,
			 uint32_t height, int fullscreen)
{
	uint32_t crtc_w, crtc_h;

	crtc_w = width;
	crtc_h = height;

	if (fullscreen) {
		crtc_w = pdev->width;
		crtc_h = pdev->height;
	}

	return drmModeSetPlane(pdev->fd, pdev->plane_id, pdev->crtc_id,
		      buf->fb_handle, 0,
		      0, 0, crtc_w, crtc_h,
		      0, 0, width << 16, height << 16);
}

static int drm_dmabuf_import(struct drm_buffer *buf, unsigned int width,
		      unsigned int height)
{
	return drmPrimeFDToHandle(pdev->fd, buf->dbuf_fd, &buf->bo_handle);
}

static int drm_dmabuf_addfb(struct drm_buffer *buf, uint32_t width, uint32_t height)
{
	int ret;

	if (width > pdev->width)
		width = pdev->width;
	if (height > pdev->height)
		height = pdev->height;

	width = ALIGN(width, 8);

	uint32_t stride = DRM_ALIGN(width, 128);
	uint32_t y_scanlines = DRM_ALIGN(height, 32);

	ret = drmModeAddFB2(pdev->fd, width, height, buf->fourcc, buf->bo_handles,
			    buf->pitches, buf->offsets, &buf->fb_handle, 0);
	if (ret) {
		err("drmModeAddFB2 failed: %d (%s)\n", ret, strerror(errno));
		return ret;
	}

	return 0;
}

static int find_plane(int fd, unsigned int fourcc, uint32_t *plane_id,
			uint32_t crtc_id, uint32_t crtc_idx)
{
	drmModePlaneResPtr planes;
	drmModePlanePtr plane;
	unsigned int i;
	unsigned int j;
	int ret = 0;
	unsigned int format = fourcc;
	unsigned int aval_fourcc = fourcc;

	planes = drmModeGetPlaneResources(fd);
	if (!planes) {
		err("drmModeGetPlaneResources failed\n");
		return -1;
	}

	info("drm: found planes %u", planes->count_planes);

	for (i = 0; i < planes->count_planes; ++i) {
		plane = drmModeGetPlane(fd, planes->planes[i]);
		if (!plane) {
			err("drmModeGetPlane failed: %s\n", strerror(errno));
			break;
		}

		if (!(plane->possible_crtcs & (1 << crtc_idx))) {
			drmModeFreePlane(plane);
			continue;
		}

		for (j = 0; j < plane->count_formats; ++j) {
		
			if (plane->formats[j] == format) {
				info("Finding Plane: found plane with required FOURCC %x in plane ID: %x",
					format,
					plane->plane_id);
				break;
			}
		}

		if (j == plane->count_formats) {
			drmModeFreePlane(plane);
			info("Finding Plane: not found plane with required FOURCC %x",
				format);
			continue;
		}

		*plane_id = plane->plane_id;
		drmModeFreePlane(plane);
		break;
	}

	if (i == planes->count_planes)
		ret = -1;

	drmModeFreePlaneResources(planes);

	return ret;
}

static struct drm_dev *drm_find_dev(int fd)
{
	int i;
	struct drm_dev *dev = NULL, *dev_head = NULL;
	drmModeRes *res;
	drmModeConnector *conn;
	drmModeEncoder *enc;
	drmModeCrtc *crtc = NULL;

	if ((res = drmModeGetResources(fd)) == NULL) {
		err("drmModeGetResources() failed");
		return NULL;
	}

	if (res->count_crtcs <= 0) {
		err("no Crtcs");
		goto free_res;
	}

	/* find all available connectors */
	for (i = 0; i < res->count_connectors; i++) {
		conn = drmModeGetConnector(fd, res->connectors[i]);

		if (conn) {
			if (conn->connection == DRM_MODE_CONNECTED) {
				dbg("drm: connector: connected");
			} else if (conn->connection == DRM_MODE_DISCONNECTED) {
				dbg("drm: connector: disconnected");
			} else if (conn->connection == DRM_MODE_UNKNOWNCONNECTION) {
				dbg("drm: connector: unknownconnection");
			} else {
				dbg("drm: connector: unknown");
			}
		}

		if (conn != NULL && conn->connection == DRM_MODE_CONNECTED
		    && conn->count_modes > 0) {
			dev = (struct drm_dev *) malloc(sizeof(struct drm_dev));
			memset(dev, 0, sizeof(struct drm_dev));

			dev->conn_id = conn->connector_id;
			dev->enc_id = conn->encoder_id;
			dev->next = NULL;

			memcpy(&dev->mode, &conn->modes[0], sizeof(drmModeModeInfo));
			dev->width = conn->modes[0].hdisplay;
			dev->height = conn->modes[0].vdisplay;

			if (conn->encoder_id) {
				enc = drmModeGetEncoder(fd, conn->encoder_id);
				if (!enc) {
					err("drmModeGetEncoder() faild");
					goto free_res;
				}
				if (enc->crtc_id) {
					crtc = drmModeGetCrtc(fd, enc->crtc_id);
					if (crtc)
						dev->crtc_id = enc->crtc_id;
				}
			}

			drmModeFreeEncoder(enc);

			dev->saved_crtc = NULL;

			/* create dev list */
			dev->next = dev_head;
			dev_head = dev;
		}
		drmModeFreeConnector(conn);
	}

	dev->crtc_idx = -1;

	for (i = 0; i < res->count_crtcs; ++i) {
		if (dev->crtc_id == res->crtcs[i]) {
			dev->crtc_idx = i;
			break;
		}
	}

	if (dev->crtc_idx == -1)
		err( "drm: CRTC %u not found\n");

free_res:
	drmModeFreeResources(res);

	return dev_head;
}

static int drm_open(const char *path)
{
	int fd, flags;
	uint64_t has_dumb;
	int ret;

	fd = open(path, O_RDWR);
	if (fd < 0) {
		err("cannot open \"%s\"\n", path);
		return -1;
	}

	/* set FD_CLOEXEC flag */
	if ((flags = fcntl(fd, F_GETFD)) < 0 ||
	     fcntl(fd, F_SETFD, flags | FD_CLOEXEC) < 0) {
		err("fcntl FD_CLOEXEC failed\n");
		goto err;
	}

	/* check capability */
	ret = drmGetCap(fd, DRM_CAP_DUMB_BUFFER, &has_dumb);
	if (ret < 0 || has_dumb == 0) {
		err("drmGetCap DRM_CAP_DUMB_BUFFER failed or doesn't have dumb "
		    "buffer\n");
		goto err;
	}

	return fd;
err:
	close(fd);
	return -1;
}

static int drm_init(unsigned int fourcc, const char *device)
{
	struct drm_dev *dev_head, *dev;
	int fd;
	int ret;

	fd = drm_open(device);
	if (fd < 0)
		return -1;

	dev_head = drm_find_dev(fd);
	if (dev_head == NULL) {
		err("available drm devices not found\n");
		goto err;
	}

	dbg("available connector(s)");

	for (dev = dev_head; dev != NULL; dev = dev->next) {
		dbg("connector id:%d", dev->conn_id);
		dbg("\tencoder id:%d crtc id:%d fb id:%d", dev->enc_id,
		    dev->crtc_id, dev->fb_id);
		dbg("\twidth:%d height:%d", dev->width, dev->height);
	}

	/* FIXME: use first drm_dev */
	dev = dev_head;
	dev->fd = fd;
	pdev = dev;

	ret = find_plane(fd, fourcc, &dev->plane_id, dev->crtc_id, dev->crtc_idx);
	if (ret) {
		err("Cannot find plane\n");
		goto err;
	}

	info("drm: Found %c%c%c%c plane_id: %x",
		(fourcc>>0)&0xff, (fourcc>>8)&0xff, (fourcc>>16)&0xff, (fourcc>>24)&0xff,
		dev->plane_id);

	return 0;

err:
	close(fd);
	pdev = NULL;
	return -1;
}

static int display(struct drm_buffer *drm_buf, int width, int height)
{
        struct drm_gem_close gem_close;
        int ret;

	ret = drm_dmabuf_import(drm_buf, width, height);
	if (ret) {
		err("cannot import dmabuf %d, fd=%d\n", ret, drm_buf->dbuf_fd);
		return -EFAULT;
	}
	drm_buf->bo_handles[0] = drm_buf->bo_handle;
	drm_buf->bo_handles[1] = drm_buf->bo_handle;
	drm_buf->bo_handles[2] = drm_buf->bo_handle;
	drm_buf->bo_handles[3] = drm_buf->bo_handle;

	ret = drm_dmabuf_addfb(drm_buf, width, height);
	if (ret) {
		err("cannot add framebuffer %d\n", ret);
		return -EFAULT;
	}

	drm_dmabuf_set_plane(drm_buf, width, height, 1);

        /* WARNING: this will _obviously_ cause the screen to flicker!!
         *
         *   Instead of using some simple stuff to postpone the release actions
         *   (a list or a ping/ping buffer or whatever) we will just keep it
         *   this way for clarity.
         *
         *   1. the client MUST remove the fb_handle
         *   2. the client MUST close the bo_handle (GEM object)
         *
         *   Not doing so will cause FFMPEG to _fail_ when releasing the capture
         *   mmap'ed buffers since the dmabufs are exported to DRM and therefore
         *   DRM keeps a reference to those buffers.
         *
         *   REQBUFS --> MMAP --> EXPBUF --> fb_handle / bo_handle
         *
         *   ==> releasing the buffers requires the handles to be released
         */
        if (drmModeRmFB(pdev->fd, drm_buf->fb_handle))
            err("cant remove fb %d\n", drm_buf->fb_handle);

        memset(&gem_close, 0, sizeof gem_close);
        gem_close.handle = drm_buf->bo_handle;
        if (drmIoctl(pdev->fd, DRM_IOCTL_GEM_CLOSE, &gem_close) < 0)
            err("cant close gem: %s\n", strerror(errno));

	return 0;
}

static void decode_and_display(AVCodecContext *dec_ctx, AVFrame *frame,
			AVPacket *pkt, const char *device)
{
	AVDRMFrameDescriptor *desc = NULL;
	struct drm_buffer drm_buf;
	int ret;

	ret = avcodec_send_packet(dec_ctx, pkt);
	if (ret < 0) {
		err("Error sending a packet for decoding\n");
		exit(1);
	}

	while (ret >= 0) {
		ret = avcodec_receive_frame(dec_ctx, frame);
		if (ret == AVERROR(EAGAIN) || ret == AVERROR_EOF)
			return;
		else if (ret < 0) {
			err("Error during decoding\n");
			exit(1);
		}

		desc = (AVDRMFrameDescriptor *) frame->data[0];
		drm_buf.dbuf_fd = desc->objects[0].fd;
		for (int i = 0; i < desc->layers->nb_planes && i < 4; i++ ) {
			drm_buf.pitches[i] = desc->layers->planes[i].pitch;
			drm_buf.offsets[i] = desc->layers->planes[i].offset;
		}

                if (!pdev) {
                    /* initialize DRM with the format returned in the frame */
                    ret = drm_init(desc->layers[0].format, device);
                    if (ret) {
                        err("Error initializing drm\n");
                        exit(1);
                    }

                    /* remember the format */
                    drm_format = desc->layers[0].format;
                }

                /* pass the format in the buffer */
                drm_buf.fourcc = drm_format;
		ret = display(&drm_buf, frame->width, frame->height);
		if (ret < 0)
			return;
    }
}

static const struct option options[] = {
	{
#define help_opt	0
		.name = "help",
		.has_arg = 0,
		.flag = NULL,
	},
	{
#define video_opt	1
		.name = "video",
		.has_arg = 1,
		.flag = NULL,
	},
	{
#define codec_opt	2
		.name = "codec",
		.has_arg = 1,
		.flag = NULL,
	},
	{
#define height_opt	3
		.name = "height",
		.has_arg = 1,
		.flag = NULL,
	},
	{
#define width_opt	4
		.name = "width",
		.has_arg = 1,
		.flag = NULL,
	},
	{
#define device_opt	5
		.name = "device",
		.has_arg = 1,
		.flag = NULL,
	},
	{
		.name = NULL,
	},
};

static void usage(void)
{
	fprintf(stderr, "usage: ffmpeg-drm <options>, with:\n");
	fprintf(stderr, "--help            display this menu\n");
	fprintf(stderr, "--video=<name>    video to display\n");
	fprintf(stderr, "--codec=<name>    ffmpeg codec: ie h264_v4l2m2m\n");
	fprintf(stderr, "--width=<value>   frame width\n");
	fprintf(stderr, "--height=<value>  frame height\n");
    fprintf(stderr, "--device=<value>  dri device to use\n");
	fprintf(stderr, "\n");
}

int main(int argc, char *argv[])
{
	uint8_t inbuf[INBUF_SIZE + AV_INPUT_BUFFER_PADDING_SIZE];
	AVCodecParserContext *parser;
	AVCodecContext *c = NULL;
	const AVCodec *codec;
	AVFrame *frame;
	AVPacket *pkt;
	size_t data_size;
	uint8_t *data;
	FILE *f;
	int ret;
	int lindex, opt;
	unsigned int frame_width = 0, frame_height = 0;
	char *codec_name = NULL, *video_name = NULL;
    char *device_name = "/dev/dri/card0";

	for (;;) {
		lindex = -1;

		opt = getopt_long_only(argc, argv, "", options, &lindex);
		if (opt == EOF)
			break;

		switch (lindex) {
		case help_opt:
			usage();
			exit(0);
		case video_opt:
			video_name = optarg;
			break;
		case codec_opt:
			codec_name = optarg;
			break;
		case width_opt:
			frame_width = atoi(optarg);
			break;
		case height_opt:
			frame_height = atoi(optarg);
			break;
        case device_opt:
			device_name = optarg;
			break;
		default:
			usage();
			exit(1);
		}
	}

	if (!frame_width || !frame_height || !codec_name || !video_name) {
		usage();
		exit(0);
	}

	pkt = av_packet_alloc();
	if (!pkt) {
		err("Error allocating packet\n");
		exit(1);
	}

	/* set end of buffer to 0 (this ensures that no overreading happens for
	   damaged MPEG streams) */
	memset(inbuf + INBUF_SIZE, 0, AV_INPUT_BUFFER_PADDING_SIZE);

	/* find the video decoder: ie: h264_v4l2m2m */
	codec = avcodec_find_decoder_by_name(codec_name);
	if (!codec) {
		err("Codec not found\n");
		exit(1);
	}

	parser = av_parser_init(codec->id);
	if (!parser) {
		err("parser not found\n");
		exit(1);
	}

	c = avcodec_alloc_context3(codec);
	if (!c) {
		err("Could not allocate video codec context\n");
		exit(1);
	}

	/* For some codecs, such as msmpeg4 and mpeg4, width and height
	   MUST be initialized before opening the ffmpeg codec (ie, before
	   calling avcodec_open2) because this information is not available in
	   the bitstream). */
	c->pix_fmt = AV_PIX_FMT_DRM_PRIME;   /* request a DRM frame */
        c->coded_height = frame_height;
	c->coded_width = frame_width;

	/* open it */
	if (avcodec_open2(c, codec, NULL) < 0) {
		err("Could not open codec\n");
		exit(1);
	}

	f = fopen(video_name, "rb");
	if (!f) {
		err("Could not open %s\n", video_name);
		exit(1);
	}

	frame = av_frame_alloc();
	if (!frame) {
		err("Could not allocate video frame\n");
		exit(1);
	}

	while (!feof(f)) {
		/* read raw data from the input file */
		data_size = fread(inbuf, 1, INBUF_SIZE, f);
		if (!data_size)
			break;

		/* use the parser to split the data into frames */
		data = inbuf;
		while (data_size > 0) {
			ret = av_parser_parse2(parser, c, &pkt->data, &pkt->size,
				data, data_size, AV_NOPTS_VALUE, AV_NOPTS_VALUE, 0);
			if (ret < 0) {
				err("Error while parsing\n");
				exit(1);
			}

			data += ret;
			data_size -= ret;

			if (pkt->size)
				decode_and_display(c, frame, pkt, device_name);
		}
	}
	fclose(f);

        decode_and_display(c, frame, NULL, device_name);

        av_parser_close(parser);
	avcodec_free_context(&c);
	av_frame_free(&frame);
	av_packet_free(&pkt);

	return 0;
}
