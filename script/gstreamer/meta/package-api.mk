
GST_VERSION      = 1.24.13

GST_MASTER_SITES = \
	$(foreach                                                                      \
		dir,                                                                   \
		gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gstreamer, \
	        http://gstreamer.freedesktop.org/src/$(dir)/                           \
	)
