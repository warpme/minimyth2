
GST_VERSION      = 1.16.0

GST_MASTER_SITES = \
	$(foreach                                                                      \
		dir,                                                                   \
		gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gstreamer, \
	        http://gstreamer.freedesktop.org/src/$(dir)/                           \
	)
