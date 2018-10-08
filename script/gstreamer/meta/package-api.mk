
GST_VERSION      = 1.14.4

GST_MASTER_SITES = \
	$(foreach                                                                      \
		dir,                                                                   \
		gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gstreamer, \
	        http://gstreamer.freedesktop.org/src/$(dir)/                           \
	)
