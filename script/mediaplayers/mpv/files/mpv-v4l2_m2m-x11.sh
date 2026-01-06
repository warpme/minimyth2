
# --gpu-hwdec-interop=drmprime-overlay directly presents the frames using an hardware overlay.
# --gpu-hwdec-interop=drmprime instead uses the linux facilities (dmabuf) to transfer the
#   decoded frames from the hardware decoder buffer to the EGL/OpenGL (or whatever) presentation layer

# echo "0xFF" > /sys/module/drm/parameters/debug

mpv --hwdec=v4l2m2m --vo=gpu --gpu-context=x11egl --msg-level=vd=v,vo=v $1
