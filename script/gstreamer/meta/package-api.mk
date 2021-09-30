
GST_VERSION      = 1.19.2

GST_MASTER_SITES = \
	$(foreach                                                                      \
		dir,                                                                   \
		gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gstreamer, \
	        http://gstreamer.freedesktop.org/src/$(dir)/                           \
	)
