GARNAME = mythtv
GARVERSION = $(MYTHTV_VERSION)
CATEGORIES = $(CATEGORY)
MASTER_SITES = svn://svn.mythtv.org/svn/trunk/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES  =

# Backend needed patches
PATCHFILES += 0001-ticket2416_copy_eit_2_other_source.patch
PATCHFILES += 0002-ticket9480_pl_eit_encodings.patch
PATCHFILES += 0003-delay_4_no_concurent_start_rec.patch
PATCHFILES += 0004-eit_verbosity.patch
PATCHFILES += 0005-tid_debug_verbosity.patch
PATCHFILES += 0007-cardutil_show_displayname.patch
PATCHFILES += 0009-allow_no_tuners.patch
PATCHFILES += 0010-ticket10136_DBerrors_on_overlaping_EIT.patch
PATCHFILES += 0011-ticket9726-Unicable_SCR_DIN_EN_50494-v6.patch
PATCHFILES += 0012-dont_send_diseq_if_tuning_to_the_same_transponder.patch
PATCHFILES += 0013-reset_diseqc_bus_only_once_v4.patch
PATCHFILES += 0014-SCR_keep_disecq_always_18V.patch
PATCHFILES += 0015-resend_disecq_cmds.patch
PATCHFILES += 0019-add_verbose_dvb_lock_info.patch
PATCHFILES += 0021-make_EIT_start_at_time.patch
PATCHFILES += 0022-mythutil-add-an-option-to-check-recordings.patch
PATCHFILES += 0023-delay-concurent-tunings.patch
PATCHFILES += 0024-disable_break_when_no_PES_PUSI_set.patch
PATCHFILES += 0025-backport-f8614bb-BE-Fix-MythSocket-Programmer-error-QEventLoop-isn-t-.patch
PATCHFILES += 0026-backport-c1915c7-MpegRecorder-check-the-return-value-from-read-for-er.patch
PATCHFILES += 0027-backport-738114f-libmythtv-Add-a-mutex-to-the-ChannelScanSM-class.patch

# Minimyth needed patches
PATCHFILES += 0100-minimyth.patch
PATCHFILES += 0101-programid.patch
PATCHFILES += 0102-maintain_menu.patch
PATCHFILES += 0103-minimyth-defaults.patch 

# Frontend patches
PATCHFILES += 0200-ticket9633_progressbar_on_osd.patch
PATCHFILES += 0202-_LMSC_osd.patch
PATCHFILES += 0203-udisks_timeout.patch
PATCHFILES += 0204-netvision_build.patch
PATCHFILES += 0205-mythmusic_quick_browsing.patch
PATCHFILES += 0206-python_bindings_tztime_error.patch
PATCHFILES += 0207-ticket10999_fix_white_screen_mythgallery.patch
PATCHFILES += 0208-add-mythnotification-custom-styles-support-via-UDP.patch
PATCHFILES += 0218-backport-c0c5299-Allow-Live-TV-to-be-entered-from-the-top-level-Progr.patch
PATCHFILES += 0219-backport-e3ee97c-Be-more-flexible-about-starting-the-Guide-at-a-parti.patch
PATCHFILES += 0220-backport-eb13dd5-Allow-the-Guide-start-channel-to-be-the-natural-Live.patch
PATCHFILES += 0221-backport-7fd5ad1-Update-cardinput.startchan-upon-successful-Live-TV-t.patch
PATCHFILES += 0222-backport-77ddcc1-Prefer-the-DefaultChanid-setting-when-picking-EPG-ch.patch
PATCHFILES += 0223-backport-98c9088-Add-tunability-tests-to-the-Watch-This-Channel-menu-.patch
PATCHFILES += 0224-add-osd-status-notify-to-mythmediacenter.patch
PATCHFILES += 0225-ticket11983.patch
PATCHFILES += 0229-add-disable-optical-disc-by-mm-config.patch
PATCHFILES += 0230-backport-93fdda5-MythMusic-re-factor-Playlist-to-avoid-storing-MusicM.patch
PATCHFILES += 0231-fix-zoneminder-1.26.5.patch
PATCHFILES += 0232-mythmusic_ticket10710_play_tracks_from_edit_trebors.patch
PATCHFILES += 0233-backport-70143d3-Allow-bookmarks-when-reading-DVDs-from-directories-i.patch
PATCHFILES += 0248-backport-2874f0d-Sync-libdvdread-up-to-R1290.patch
PATCHFILES += 0249-backport-2a6038b-Sync-libdvdnav-up-to-R1294.patch
PATCHFILES += 0251-backport-cd452cf-Minor-re-work-of-DVD-serialization-code-to-match-cod.patch
PATCHFILES += 0252-backport-b57cf4b-RemoteFile-add-a-static-FindFile-function-to-find-a-.patch
PATCHFILES += 0253-mythlink-pretty-with-recgroup-subdir.patch
PATCHFILES += 0254-backport-1f3fb4a-Removed-custom-dvdnav_first_play-function-from-libdv.patch
PATCHFILES += 0255-backport-137b8d7-Additional-files-missing-from-1f3fb4a61e.patch
PATCHFILES += 0258-backport-1e97539-Ensure-programflags-is-initialised.-ProgramInfo-Load.patch
PATCHFILES += 0259-ticket12055-hls-add-preset-tune.patch
PATCHFILES += 0260-ticket12047-mythplayer-picks-the-wrong-fps-for-1080i-matroska.patch
PATCHFILES += 0261-ticket12049-the-year-of-a-video-can-not-be-displayed-in-the-OSD-program-info.patch
PATCHFILES += 0263-backport-588c95d-HLS-Don-t-allow-duplicate-streams-to-be-created.patch
PATCHFILES += 0264-backport-a9b8a86-HLS-Add-the-EXT-X-MEDIA-tags-to-the-Master-Playlist.patch
PATCHFILES += 0266-speedup-playback-start.patch
PATCHFILES += 0274-backport-7c7d800-HLS-Don-t-scale-video-beyond-it-s-original-resolutio.patch
PATCHFILES += 0275-backport-847dce4-Transcoder-Remove-assumption-that-all-1080-video-is-.patch
PATCHFILES += 0276-backport-7133fc4-HLS-Enable-deinterlacing-for-HLS.-Web-videos-must-be.patch
PATCHFILES += 0277-backport-1012ad3-HLS-Fix-audio-only-bitrate-to-64k-per-Apple-recommen.patch
PATCHFILES += 0278-backport-2c71895-HLS-Decrease-segment-size-from-10-to-4-seconds-which.patch
PATCHFILES += 0279-backport-103d573-Fixes-null-dereference.patch
PATCHFILES += 0295-backport-b0aa4e5-Allow-capture-of-the-unprocessed-raw-MPTS-from-appro.patch
PATCHFILES += 0307-backport-95652b6-EIT-improvements-for-DVB.patch
PATCHFILES += 0308-backport-619b008-simplify-handling-of-missing-endtime-at-end-of-file-.patch
PATCHFILES += 0309-backport-7fd0a20-Fix-some-confusion-over-the-behaviour-purpose-of-IsS.patch
PATCHFILES += 0310-backport-0db22a0-Use-QEventLoop-for-modal-windows.patch
PATCHFILES += 0311-backport-cd80b1c-protect-metadata-loads-from-multiple-threads.patch
PATCHFILES += 0312-backport-3771b88-Fix-random-SBE-PlaybackSock-timeout-in-MBE.patch
PATCHFILES += 0313-backport-636ca29-Reduce-CPU-usage-while-waiting-for-seek-to-complete.patch

# first set of patches for LiveTV
PATCHFILES += 0581-backport-ed52e84-Small-optimisation-of-FileRingBuffer-GetRealFileSize.patch
PATCHFILES += 0582-backport-c24e2e7-Fix-seek-when-close-to-end-of-program.patch

# second set of patches for LiveTV
PATCHFILES += 0583-backport-cad3f0a-Do-not-abort-early-if-not-all-data-is-received-withi.patch
PATCHFILES += 0584-backport-5f47d69-Add-QUERY_FILETRANSFER-REQUEST_SIZE-command.patch
PATCHFILES += 0585-backport-6290fd9-Add-RemoteFile-GetRealFileSize.patch
PATCHFILES += 0586-backport-5d82ba6-Fix-seek-when-close-to-end-of-program-2.patch
PATCHFILES += 0587-backport-c64141b-Fix-calculation-of-read-block-size.patch
PATCHFILES += 0588-backport-2980b3d-Return-the-actual-file-size-rather-than-the-one-when.patch
PATCHFILES += 0589-backport-9883b43-Only-expire-LiveTV-programs-that-are-less-than-30s-a.patch

# third patches for LiveTV
PATCHFILES += 0590-backport-dddf14c-Partial-revert-of-c64141b0c0b7118ee28be2441374727a1a.patch
PATCHFILES += 0591-backport-8c17413-Cache-the-size-of-the-remote-file-for-500ms.patch
PATCHFILES += 0592-backport-1da2a0e-Set-initial-FileRingBuffer-rawbitrate-to-800.patch
PATCHFILES += 0593-backport-1ff446a-RingBuffer-Play-encrypted-dvd-s-and-iso-images-from-.patch

# backports from master when jya backport devel/ringbuffer to master
PATCHFILES += 0608-backport-c519bba-Add-ReadInternalMode-to-RingBuffer-class.patch
PATCHFILES += 0609-backport-e469043-Try-to-open-the-media-for-1.5s-using-only-the-intern.patch

PATCHFILES += 0314-backport-ad1361a-Allows-RemoteFile-to-recover-from-connection-drop-or.patch
PATCHFILES += 0315-backport-305b409-Reset-failures-count-once-a-read-succeed.patch
PATCHFILES += 0316-backport-b87d476-Have-RemoteFile-attempt-to-fully-reconnect-in-case-o.patch
PATCHFILES += 0317-backport-4bb7059-Prevent-crash-should-playback-fail-after-ringbuffer-.patch
PATCHFILES += 0318-backport-904b65b-Don-t-prevent-read-should-we-reached-EOF-or-an-error.patch
PATCHFILES += 0319-backport-e8fa11c-Pause-playback-rather-than-exiting-should-backend-st.patch
PATCHFILES += 0320-backport-07eff1b-MythFrontend-Make-Xlib-calls-thread-safe-on-Linux.patch
PATCHFILES += 0321-backport-8877719-Fix-probable-cut-n-paste-error.-VB_PLAYBACK-should-b.patch
PATCHFILES += 0322-backport-fa75762-change-default-duplicate-detection-method-to-subtitl.patch
PATCHFILES += 0323-backport-dbb3874-Fix-stuttery-playback-for-FFmpeg-s-directly-rendered.patch
PATCHFILES += 0324-backport-2f1b223-ffmpeg-backport-register-vdpau-hwaccel-for-mpeg12.patch
PATCHFILES += 0325-backport-013ac54-Fixes-12128.patch
PATCHFILES += 0326-backport-a5b996c-Migrate-vdpau-decoding-to-FFmpeg-s-new-hwaccel-API.patch
PATCHFILES += 0327-backport-8f0437c-Fix-playback-of-9-10bit-h264-videos.patch
PATCHFILES += 0328-backport-7d6471d-vdpau-Fix-VC-1-interlaced-mode.patch
PATCHFILES += 0329-backport-900e366-Update-to-FFmpeg-1.2.6-release.patch
PATCHFILES += 0330-backport-eb17a56-Honor-the-disabled-state-in-buttonlist-items.patch
PATCHFILES += 0331-backport-73037c4-Don-t-segfault-if-the-screen-has-a-disabled-buttonli.patch
PATCHFILES += 0332-backport-7eaeaa3-change-IPTV-Url-test-to-consider-RTSP-without-explic.patch
PATCHFILES += 0333-backport-d870d54-strip-whitespace-when-splitting-RTSP-OPTIONS.patch
PATCHFILES += 0334-backport-361b792-RTSP-session-id-is-NOT-a-number-but-a-random-string-.patch
PATCHFILES += 0335-backport-4668d05-remove-duplicate-initialization-of-m_use_rtp_streami.patch
PATCHFILES += 0336-backport-1ae6a1f-Rework-IPTV-and-RTSP-recorders.patch
PATCHFILES += 0337-backport-3ed8cef-Fix-compilation-error.patch
PATCHFILES += 0339-backport-1761bd9-Prevent-spurious-packets-from-corrupting-the-time-st.patch
PATCHFILES += 0340-backport-6a75882-Fix-5.1-audio-being-configured-as-7.1.patch
PATCHFILES += 0341-ticket12015-configure-not-passing-cppxx-flags.patch
PATCHFILES += 0342-backport-6812fe3-Fix-RemoteFile-GetRealFileSize-caching.patch
PATCHFILES += 0343-backport-def30e6-Cache-for-500ms-the-result-of-RemoteEncoder-GetFrame.patch
PATCHFILES += 0344-backoprt-632cf60-Reset-frames-duration-maps-when-changing-file-or-whe.patch
PATCHFILES += 0345-backoprt-244ce4f-Improve-FastForward-and-Rewind.patch
PATCHFILES += 0346-backport-dcb7fbb-Re-enable-old-FFmpeg-s-VDPAU-API-for-non-nvidia-driv.patch
PATCHFILES += 0347-backport-d3803e9-Don-t-attempt-to-test-for-GPU-decoding-methods-once-.patch
PATCHFILES += 0348-backport-b747742-Add-method-to-check-if-VPDAU-is-supported.patch
PATCHFILES += 0349-backport-eefc369-Fix-VDPAU-being-always-used-when-present-even-if-not.patch
PATCHFILES += 0350-backport-da2ed23-Fix-memory-leak.patch
PATCHFILES += 0350-backport-9df1610-OSD-use-short-timeout-for-seeking-type-event-notific.patch
PATCHFILES += 0352-add-option-to-not-remember-last-livetv-chan.patch
PATCHFILES += 0353-backport-b4be8e2-Speed-up-ProgramInfo-SavePositionMap-database-writes.patch
PATCHFILES += 0354-backport-850843d-Speed-up-writing-EIT-cache-to-database.patch
PATCHFILES += 0355-backport-e2a5a96-Don-t-unecessarily-query-the-backend-if-we-don-t-nee.patch
PATCHFILES += 0356-backport-a9f4cef-avoid-NULL-pointer-dereference-coverity-1091332.patch
PATCHFILES += 0357-backport-a450a1b-Do-not-immediately-save-volume-to-DB-when-changing-v.patch
PATCHFILES += 0358-backport-85baf66-Save-volume-only-on-TV-Player-exit.patch
PATCHFILES += 0359-backport-b8d5f11-Force-refresh-of-xf86VidMode-current-modeline.patch
PATCHFILES += 0360-backport-71ad707-HTTP-Server-Meet-HTTP-1.1-requirement-that-a-400-sta.patch
PATCHFILES += 0361-backport-a152d99-Fix-logic-error-in-HttpWorker-run-spotted-by-Jonatan.patch
PATCHFILES += 0362-backport-315b354-Change-VideoFrame-default-value.patch
PATCHFILES += 0363-backport-046ad2c-Add-natural-string-comparison-utility.patch
PATCHFILES += 0364-backport-cb2561c-Use-natural-sort-for-presenting-content.patch
PATCHFILES += 0365-ticket12157-List-all-recordings-with-this-title-display-group.patch
PATCHFILES += 0367-backport-343cacb-Fix-memory-leak.patch
PATCHFILES += 0368-backport-893639d-Re-sync-FFmpeg-copy-to-release-2.2-branch.patch
PATCHFILES += 0369-backport-ef4cf25-Fix-crashes-when-playing-nuv-files.patch
PATCHFILES += 0370-backport-4a6d584-No-point-de-interleaving-mono.patch
PATCHFILES += 0371-backport-b4bce95-Update-DecodeAudio-to-use-new-FFmpeg-s-audio-API.patch
PATCHFILES += 0372-backport-e9a342e-Update-for-new-FFMPEG-audio-API.patch
PATCHFILES += 0373-backport-df503b6-We-don-t-need-to-build-FFMpeg-with-old-audio-API-any.patch
PATCHFILES += 0374-backport-d252af5-Update-AudioOutputDigitalEncoder-for-new-FFmpeg-APIs.patch
PATCHFILES += 0375-backport-df9cf7e-Update-MPEG2fixup-for-new-FFmpeg-APIs.patch
PATCHFILES += 0376-backport-4ad7dfa-Rename-libmythtv-frame.h-into-libmythtv-mythframe.h.patch
PATCHFILES += 0377-backport-4902eda-More-FFmpeg-API-updates.patch
PATCHFILES += 0378-backport-89ede6d-Update-AVFormatWriter-for-new-FFMpeg-APIs.patch
# v6.5.38
PATCHFILES += 0380-backport-fee00c3-Remove-hack-forcing-MPEG1-video-to-be-treated-as-MPE.patch
PATCHFILES += 0381-backport-d90af2d-Don-t-attempt-to-issue-DB-query-if-there-s-nothing-t.patch
PATCHFILES += 0382-backport-a6b3cfb-Fix-search-of-image-artwork-in-folder.patch
PATCHFILES += 0383-backport-2d73bf8-Add-search-for-jpeg-type-and-make-search-for-image-c.patch
PATCHFILES += 0384-backport-ec08df5-Fix-crash-when-exiting-LiveTV.patch
PATCHFILES += 0385-backport-6d43fed-Use-new-render2-hwaccel-VDPAU-api.patch
PATCHFILES += 0386-backport-e678871-Update-to-FFmpeg-new-AVFrame-get_buffer2-API.patch
PATCHFILES += 0387-backport-bce987c-Fix-compilation-without-VAAPI.patch
PATCHFILES += 0388-backport-01caefe-Update-VDA-and-CrystalHD-decoder-to-get_buffer2-API.patch
PATCHFILES += 0389-backport-ba8c958-Fix-ATSC-subtitles.patch
PATCHFILES += 0390-backport-ef770bb..5cb5968-update-ffmpeg-to-2.2.3-and-2.2-fixes.patch
# v6.6.00
PATCHFILES += 0392-backport-5c782b8-Add-MythAVFrame-and-mythavutil.h.patch
PATCHFILES += 0393-backport-3cb5273-Fix-major-leak-during-video-playback.patch
PATCHFILES += 0394-backport-e5d6d75-Fix-header.patch
PATCHFILES += 0395-backport-5a5aa7c-Fix-various-leaks-related-to-misuse-of-AVFrame-objec.patch
PATCHFILES += 0396-backport-1b7bdcf-Simplify-some-code-using-new-MythAVFrame-class.patch
PATCHFILES += 0397-backport-5ef7b1c-Retry-to-fix-corner-cases-when-stopping-in-progress-.patch
PATCHFILES += 0398-backport-f48a011-Fix-leak-in-display-subtitle-code.patch
PATCHFILES += 0399-backport-b150097-Fix-leak-in-logger.patch
PATCHFILES += 0400-backport-0b64f62-Tidy-up-code.patch
PATCHFILES += 0402-backport-5027151-Internet-Content-Fix-warnings-about-null-strings-dur.patch
PATCHFILES += 0403-backport-b5ca595-Internet-Content-Fix-manual-update-of-RSS-subscripti.patch
PATCHFILES += 0405-backport-07183b9-Fix-VAAPI-playback-when-OpenGL2-painter-is-used.patch
PATCHFILES += 0406-backport-520b8bc-Implement-copying-one-VideoFrame-into-another-where-.patch
PATCHFILES += 0407-backport-ef54e66-Fix-VAAPI-accelerated-PiP.patch
# v6.6.01
PATCHFILES += 0408-xinitthreads.patch
PATCHFILES += 0409-backport-1582de6-Channel-scanning-unbreak-the-cli.-Teardown-frees-and.patch
PATCHFILES += 0410-backport-849b291-Add-ability-to-create-video-frames-where-all-lines-w.patch
PATCHFILES += 0411-backport-b617f40-Add-NV12-format-support-to-VideoFrame-class-and-fast.patch
PATCHFILES += 0412-backport-c65695c-Add-VAAPI-vaDerive-support-and-re-add-NV12-image-for.patch
PATCHFILES += 0413-backport-b52b58a-Fix-strides-size-calculation-for-YV12-NV12-frames-wh.patch
PATCHFILES += 0414-backport-18511f8-Enable-forward-only-cursors-with-all-prepared-databa.patch
PATCHFILES += 0415-backport-3518f1b-re-add-extra-cxxflags-that-got-lost-during-a-FFmpeg-.patch
PATCHFILES += 0416-backport-40451cc-Add-nsecsElapsed-method-to-MythTimer-class.patch
PATCHFILES += 0417-backport-b966dd5-Add-MythUSWCCopy-YV12-SV12-conversion-utility-class.patch
PATCHFILES += 0418-backport-bf1cf05-Make-VAAPI-use-new-MythUSWCCopy-class.patch
# v 6.7.00
PATCHFILES += 0419-backport-5433b76-Allow-partial-reads.patch
PATCHFILES += 0420-backport-aa822f5-Fix-a-thinko-in-the-This-time-and-This-day-and-time-.patch
PATCHFILES += 0421-backport-330ae8a-Increase-myth-filetransfer-timeout-values.patch
PATCHFILES += 0422-backport-6be8c81-Prevent-crash-opening-audio-settings-page-when-inval.patch
PATCHFILES += 0423-backport-1532ac0-Abort-early-when-trying-to-open-a-0-bytes-file-size-.patch
PATCHFILES += 0424-backport-338c49a-Stop-readahead-thread-if-the-file-isn-t-opened-try-2.patch
PATCHFILES += 0425-backport-784758a-Fix-small-leak-should-a-ringbuffer-not-be-created-su.patch
PATCHFILES += 0426-backport-6e5d8cf-Fix-dummy-recording-file-sometimes-not-being-deleted.patch
PATCHFILES += 0427-backport-2b9231b-Return-an-error-when-the-file-couldn-t-be-successful.patch
# v 6.7.01
PATCHFILES += 0428-backport-e3ab9ec-Make-sure-some-recording-rule-failures-get-reported-.patch
PATCHFILES += 0429-backport-bbcecc4-Fix-PiP-when-using-OpenGL-output.patch
PATCHFILES += 0430-backport-cc689fd-Fix-incorrect-deletion-of-allocated-buffers.patch
PATCHFILES += 0431-backport-e2b7d6c-Allocate-VideoFrame-buffer-using-av_malloc-and-mythf.patch
PATCHFILES += 0432-backport-04e0a17-Uses-16-bytes-aligned-memory-buffer.patch
PATCHFILES += 0433-backport-1ef850f-Add-support-for-frames-where-pitch-width.patch
PATCHFILES += 0434-backport-db5c40c-Create-pitch-strides-that-are-a-multiple-of-32-bytes.patch
PATCHFILES += 0435-backport-d1f044c-Fix-PiP-with-VDPAU-on-mesa-s-drivers.patch
PATCHFILES += 0436-backport-fe61ca2-Properly-handle-when-libmythbluray-is-unable-to-open.patch
PATCHFILES += 0437-backport-6976233-Fix-mytharchive-compliation.patch
PATCHFILES += 0438-backport-d2c8307-remove-fourcc.h-from-mythframe.h-so-it-doesn-t-need-.patch
PATCHFILES += 0439-backport-b22277e-Fix-compilation-of-mythplugins.patch
# v 6.7.02
PATCHFILES += 0440-backport-bc382fc-fix-compilation-due-to-missing-header.patch
PATCHFILES += 0440-backport-6a7481b-Use-MythAVFrame-convenience-class.patch
PATCHFILES += 0441-backport-a4176ca-OSX-Allow-PiP-with-VDA-decoder.patch
PATCHFILES += 0442-backport-983c8bd-MythUSWCCopy-Change-const-ness-of-argument.patch
PATCHFILES += 0443-backport-75b438c-Add-MythAVCopy-class.patch
PATCHFILES += 0444-backport-36d12c8-Remove-any-use-of-myth_sws_img_convert-and-use-new-M.patch
PATCHFILES += 0445-backport-d6663a5-Audio-Abort-Drain-if-audio-device-is-in-pause.patch
PATCHFILES += 0446-backport-b645d9c-Don-t-use-reference-to-initially-allocated-avio-buff.patch
PATCHFILES += 0447-backport-fd14327-Increase-size-of-streaming-buffer.patch
PATCHFILES += 0448-backport-b7b1606-Let-FFmpeg-determine-how-to-probe-for-format-when-us.patch
PATCHFILES += 0449-backport-89f2588-Remove-unused-header.patch
PATCHFILES += 0450-backport-bdba161-Remove-unused-header.patch
PATCHFILES += 0451-backport-98bec5c-Fix-backend-crash-should-opening-file-failed-and-cli.patch
PATCHFILES += 0452-backport-dfd7f64-Remove-now-unused-API-use-MythAVCopy-instead.patch
# v 6.7.03
PATCHFILES += 0453-backport-10d5820-OpenGL-Optimize-writing-packed-images-to-pixel-buffe.patch
PATCHFILES += 0456-backport-8e79b0a-Fix-crashes-when-changing-files.patch
PATCHFILES += 0457-commit-192e818-Make-Frontend-Backend-connection-works-when-BE-is-se.patch
PATCHFILES += 0458-commit-700e5be-Fix-connection-to-Master-Backend-where-the-master-IP.patch
PATCHFILES += 0459-commit-81b5739-Don-t-add-port-number-to-myth-URL-if-it-s-the-defaul.patch
PATCHFILES += 0460-commit-9516b81-Fix-GetBackendServerIP6-from-returning-IPv4-address.patch
PATCHFILES += 0461-commit-2bbaf31-Allow-MasterServerIP-BackendServerIP-and-BackendServ.patch
PATCHFILES += 0462-commit-815978b-Allow-IPv6-use-in-backend-service.patch
PATCHFILES += 0463-commit-280146e-Have-server-pool-and-mythbackend-use-new-MythCoreCon.patch
PATCHFILES += 0464-commit-a5e27e9-Make-MythCoreContext-GetMasterServerIP-returns-local.patch
PATCHFILES += 0465-commit-f737a78-MythCoreContext-Fix-bad-copy-paste.patch
PATCHFILES += 0466-commit-979ea9b-Fix-GetBackendStatusPort.patch
PATCHFILES += 0467-commit-418deb6-Ignore-IPv6-settings-value-if-it-s-invalid.patch
PATCHFILES += 0468-sync-upnp-to-master.patch
PATCHFILES += 0470-backport-9df8bb3-Don-t-attempt-to-play-the-video-streams-for-mp3-flac.patch
PATCHFILES += 0471-backport-548aaf7-Properly-allocate-VDPAU-PiP-video-buffers-and-fix-me.patch
PATCHFILES += 0472-backport-64d94c0-Allocate-DeAllocate-video-buffers-using-av_malloc.patch
PATCHFILES += 0474-backport-f3c40c8-Coverity-CID-1224483.patch
# v 6.7.04
PATCHFILES += 0475-backport-d7c236d-UPnP-add-different-groupings-for-content-in-video.patch
# v 6.7.05
PATCHFILES += 0477-backport-05124c3-VO-Fail-VAAPI-reinit-from-decoder-thread-to-avoid-Qt.patch
PATCHFILES += 0479-backport-faad748-TV-Quit-the-TV-playback-loop-when-the-primary-player.patch
PATCHFILES += 0480-backport-67b7ebb-AO-SetStretchFactor-sets-pause-until-buffered-to-smo.patch
PATCHFILES += 0480-backport-9e56b98-Player-DecoderLoop-sleeps-until-audio-buffers-availa.patch
PATCHFILES += 0481-backport-d038af7-AO-Pause-resets-PauseUntilBuffered.patch
PATCHFILES += 0482-backport-bfc6b9e-TV-UnpauseLiveTV-calls-tvchain-SwitchTo-opposed-to-J.patch
PATCHFILES += 0483-backport-1ab6204-AO-Don-t-disable-Pulse-if-no-valid-output.patch
PATCHFILES += 0484-backport-2019bb8-OpenGL-Reduce-video-playback-overhead.patch
PATCHFILES += 0485-backport-2c22c5d-libmyth-Prevent-SEGV-in-avcodec_decode_video2-when-p.patch
PATCHFILES += 0486-backport-0e0e04c-Player-Improve-low-bit-rate-high-latency-stream-play.patch
PATCHFILES += 0487-backport-49df62f-Player-Don-t-call-DoneDisplayingFrame-for-PiP-until-.patch
PATCHFILES += 0489-backport-d3bb512-ringbuffer-Prevent-a-divide-by-0.patch
PATCHFILES += 0491-backport-9dbbd09-AO-Cache-the-result-of-IsPulseAudioRunning.patch
PATCHFILES += 0492-backport-604a9d8-Player-Clear-EOF-when-resuming-play.patch
PATCHFILES += 0493-backport-195eb07-Player-Enable-AVSync-to-recover-quicker-after-a-seek.patch
PATCHFILES += 0494-backport-f8d7228-Player-Finer-a-v-sync-adjustments.patch
PATCHFILES += 0495-backport-cc927f6-Player-Amalgamate-and-simplify-SwitchTo-and-JumpToPr.patch
PATCHFILES += 0496-backport-d2a785b-TV-Avoid-a-SEGV-when-switching-from-PiP-to-PbP.patch
PATCHFILES += 0497-backport-c63a09c-Player-Allow-seeking-upto-last-frame-when-paused.patch
PATCHFILES += 0499-backport-a2b7a45-Decoder-Limit-buffered-audio-data-to-2000mS-for-visu.patch
PATCHFILES += 0500-backport-0937dac-Transcode-Fix-a-race-condition-in-VideoDecodeBuffer-.patch
PATCHFILES += 0501-backport-af6f826-Flush-buffers-prior-to-closing-the-codec.patch
PATCHFILES += 0502-backport-25dd494-MythUIWebBrowser-silence-a-warning-when-we-can-t-fin.patch

# v 6.7.06
PATCHFILES += 0503-backport-90730e5-Do-not-wait-too-quickly-when-reaching-EOF.patch
PATCHFILES += 0504-83050ac-Limit-bitrate-to-100Mbit-s-and-fill_min-to-half-the-.patch
PATCHFILES += 0505-e24b793-Player-Increase-OpenFile-timeout-to-allow-playing-is.patch
# v 6.8.01
PATCHFILES += 0506-commit-2d2530c-Mythmedatalookup-set-PYTHONPATH-so-mythmedatalookup-.patch
PATCHFILES += 0507-commit-1489019-Store-grabber-used-along-with-inetref-to-ensure-corr.patch
PATCHFILES += 0508-commit-f883275-Make-sure-to-pass-season-and-episode-to-tv-grabber.patch
PATCHFILES += 0509-commit-6151169-Use-myth-coding-style.patch
PATCHFILES += 0510-commit-7e8330f-Mythmetadatalookup-Make-sure-we-follow-the-exact-sam.patch
PATCHFILES += 0511-commit-7292b98-Mythmetadata-Simplify-code-with-a-GetGrabber-utility.patch
PATCHFILES += 0512-commit-9ddb3d4-metadata-fix-crash-should-grabber-not-be-defined.patch
PATCHFILES += 0513-commit-e93274a-metadata-get-around-grabber-incorrectly-set-to-an-em.patch
PATCHFILES += 0514-commit-7e8ca1c-metadata-do-not-use-grabber-cache-if-not-initialised.patch
PATCHFILES += 0515-backport-d8c0ad9-UPnP-Add-the-fraction-of-a-second-component-to-the-D.patch
PATCHFILES += 0516-backport-8470591-UPnP-Ensure-resource-URIs-are-properly-encoded-and-f.patch
PATCHFILES += 0517-backport-e72b1ca-UPnP-Ensure-that-all-the-values-in-the-CDS-Object-XM.patch
# v 6.8.02
PATCHFILES += 0518-commit-9a6d2d6-metadata-Properly-clean-inetref-when-searching-for-c.patch
PATCHFILES += 0519-commit-b1cd6fb-metadata-Properly-separate-TV-title-subtitle-search-.patch
PATCHFILES += 0520-commit-5b10d38-metadata-if-video-type-not-known-try-both-movie-and-.patch
PATCHFILES += 0521-commit-819f423-CoreContext-Fix-IsThisHost.patch
PATCHFILES += 0521.1-commit-7e83d93-CoreContext-Fix-IsThisHost.patch
PATCHFILES += 0522-commit-aaae611-metadata-do-not-use-script-name-for-artwork-file-nam.patch
PATCHFILES += 0523-backport-438d29a-Subtitles-Avoid-changing-subtitle-state-in-the-decod.patch
PATCHFILES += 0524-backport-33acfaf-Make-seeks-faster-for-slow-decoders-large-keyframe-d.patch
PATCHFILES += 0525-commit-3fec986-metadata-uses-_-as-separator-in-inetref-in-place-of.patch
PATCHFILES += 0526-backport-e7b163f-UPnP-Expose-more-metadata-to-UPnP-clients.patch
# v 6.9.00
PATCHFILES += 0528-backport-4c5585a-UPnP-Try-to-use-more-specific-containers-where-possi.patch
PATCHFILES += 0529-backport-b510080..cf2f728-update-FFMPEG-to-2.2.4.patch
PATCHFILES += 0532-backport-15a6f6d-UPnP-Correctly-sort-tracks-in-the-album-container-by.patch
PATCHFILES += 0533-backport-27b8c68-UPnP-Properly-sort-the-video-genre-list-alphabetical.patch
PATCHFILES += 0534-backport-1a66fbb-Fix-indentation-in-devicemaster.xml.patch
PATCHFILES += 0535-backport-59bc1cd-UPnP-Add-icons-for-the-UPnP-device.patch
PATCHFILES += 0536-disable-querying-episodenum-total-season-in-upnp.patch
# v 6.9.01
PATCHFILES += 0537-commit-ae611ec-metadata-Fix-broken-retrieval-for-screenshots.patch
PATCHFILES += 0538-commit-71c28ce-metadata-fix-stray-declaration.patch
PATCHFILES += 0539-commit-8e6341b-metadata-Fix-GetGrabber.patch
PATCHFILES += 0540-commit-c20107d-metadata-also-set-collectionref-to-new-format.patch
PATCHFILES += 0541-commit-76aae88-metadata-no-need-to-re-run-the-search-when-a-match-h.patch
PATCHFILES += 0542-commit-c930a9c-metadata-properly-handle-media-search-type-if-we-alr.patch
PATCHFILES += 0543-backport-f1cfac4-UPnP-Set-sane-defaults-for-the-required-properties-o.patch
PATCHFILES += 0544-backport-f285853-UPnP-Make-sure-that-if-no-extensions-handle-sub-clas.patch
PATCHFILES += 0545-backport-bc5a02d-UPnP-Have-the-video-extension-create-movieGenre-cont.patch
PATCHFILES += 0546-backport-d9d6873-UPnP-Fix-the-service-IDs-for-CDS-and-CMGR-which-were.patch
# v 6.9.02
PATCHFILES += 0547-backport-5d3d319-metadata-fix-incorrect-tests.patch
PATCHFILES += 0548-backport-1abcb6f-Revert-metadata-properly-handle-media-search-type-if.patch
PATCHFILES += 0549-backport-085c65e-metadata-clear-error-state-once-an-error-has-been-pr.patch
PATCHFILES += 0551-backport-6954cff-metadata-add-getStorageGroupName.patch
PATCHFILES += 0552-backport-1e84484-metadata-fix-storage-group-access-when-downloading-a.patch
PATCHFILES += 0553-backport-823e851-metadata-properly-update-artwork-images-paths.patch
PATCHFILES += 0554-backport-1f21438-metadata-create-objects-on-stack.patch
PATCHFILES += 0555-backport-eef41b9-metadata-do-not-attempt-to-download-remaining-artwor.patch
PATCHFILES += 0556-backport-80c5e45-add-GuessLookupType-for-VideoMetadata-to-match-other.patch
PATCHFILES += 0557-backport-2d4be81-metadata-use-extended-inetref-if-available-to-determ.patch
PATCHFILES += 0558-backport-7407adf-metadata-create-Set-GetIsCollection.patch
PATCHFILES += 0559-backport-2c1e405-metadata-never-overrides-current-video-season-episod.patch
PATCHFILES += 0560-backport-c2c27e5-frontend-simplify-metadata-search-creation.patch
PATCHFILES += 0561-backport-f9fef96-frontend-fix-automatic-mode-introduced-in-previous-c.patch
PATCHFILES += 0562-backport-05f63f5-metadata-complete-refactor-of-search.patch
PATCHFILES += 0563-backport-e0155b9-metadatalookup-fix-logic-error-introduced-in-5d3d319.patch
PATCHFILES += 0564-backport-1c89d56-metadata-fix-wrong-test-leading-to-incorrect-hash-ca.patch
PATCHFILES += 0565-backport-7fa5c4f-mythbackend-fixes-QUERY_FILE_HASH-hanging.patch
PATCHFILES += 0566-backport-87822fe-protoserver-fixes-QUERY_FILE_HASH-hanging.patch
# v 6.9.03
PATCHFILES += 0568-backport-2f9424c-metadata-return-both-movie-and-TV-results-when-in-no.patch
PATCHFILES += 0569-backport-4e50609-metadata-also-look-for-artwork-when-scanning-a-singl.patch
PATCHFILES += 0570-backport-41b9be6-frontend-add-search-abilities-to-change-recording-me.patch
# v 6.9.05
PATCHFILES += 0573-commit-5769905-Subtitles-Fix-cc608-indents.patch
PATCHFILES += 0574-commit-0dd5ab3-Subtitles-Avoid-trying-to-draw-empty-text-or-backgro.patch
PATCHFILES += 0575-backport-4f19c08-UPnP-Fix-repeated-error-in-mime-dlna-profile-strings.patch
# v 6.9.11
PATCHFILES += 0576-backport-dcb7006-Videos-are-in-storage-groups-now-lets-just-try-to-fi.patch
PATCHFILES += 0577-backport-d90fd4e-UPnP-Fix-copy-paste-error-spotted-by-Coverity-122878.patch
PATCHFILES += 0578-backport-e018bbe-Fix-potential-null-pointer-derefence-in-PBB-metadata.patch
PATCHFILES += 0579-add-phone-entry-in-themes.patch
PATCHFILES += 0580-commit-5e37f9c-Captions-Delete-all-cc708-windows-in-CC708Reader-Res.patch

ifeq ($(patsubst %private,private,$(shell cat ~/.minimyth/minimyth.conf.mk | grep "^mm_VERSION_MINIMYTH\s*?=" | sed -e "s/\s*//g")),private)
    PATCHFILES += 1000-1138-mythmusic-backport-from-master-20140505.patch
    PATCHFILES += 1139-backport-03d2e69-MusicCommon-Only-connect-the-Exiting-signal-if-the-n.patch
    PATCHFILES += 1140-backport-b3c52ec-MytghMusic-check-a-dynamic_cast-in-PlaylistEditorVie.patch
    PATCHFILES += 1141-backport-050358a-MusicCommon-remove-some-dead-code-from-switchView.patch
    # v 6.7.05
    PATCHFILES += 1142-backport-6ddc2e5-MythMusic-Avoid-a-floating-point-domain-error-in-the.patch
    PATCHFILES += 1143-backport-0022b23-MythMusic-Read-Set-an-annonymous-POPM-tag-in-ID3-tag.patch
    PATCHFILES += 1144-backport-491fd8f-MythMusic-Save-the-last-play-date-time-in-the-ID3-ta.patch
    PATCHFILES += 1145-backport-b639056-MythMusic-If-the-global-POPM-tag-playcount-was-zero-.patch
    # 6.9.01
    PATCHFILES += 1146-backport-31614bf-MusicPlayer-On-stop-clear-any-temporary-one-shot-met.patch

    PATCHFILES += 2038-2284-mythimage-backport-from-master-20140505.patch
    PATCHFILES += 2285-backport-812bdb6-cppcheck-Invalid-usleep-argument.-The-value-is-10000.patch

    PATCHFILES += 3000-backport-ec5a9d3-MythNetvision-pass-const-QStrings-by-reference-cppch.patch
    PATCHFILES += 3002-backport-85b2d6d-Reorganize-cache-and-temporary-directories-under-com.patch
    PATCHFILES += 3004-backport-72bb682-MythNetvision-Move-common-stuff-to-base-classes.patch
    PATCHFILES += 3005-backport-7caf30a-MythNetvision-Fix-some-cppcheck-warnings.patch
    PATCHFILES += 3006-backport-103a135-MythNetvision-Fix-some-issues-found-by-Coverity.patch
    PATCHFILES += 3007-backport-c91e763-MythNetvision-Rename-various-methods.patch
    PATCHFILES += 3008-backport-998efae-MythNetvision-Remove-one-member-in-NetTree.patch
    PATCHFILES += 3009-backport-81ac340-MythNetvision-Whitespace-cleanup.patch
    PATCHFILES += 3010-backport-fabc464-MythNetvision-Fix-thumbnail-loading-in-the-list-view.patch
    PATCHFILES += 3011-backport-c7cb70b-MythNetvision-Simplify-busy-dialog-handling.patch
    PATCHFILES += 3012-backport-67407b3-MythNetvision-Set-progress-dialog-to-NULL-after-clos.patch
    PATCHFILES += 3013-backport-717b39c-MythNetvision-Split-NetTree-SlotItemChanged-into-sep.patch
    PATCHFILES += 3014-backport-8eb969e-MythNetvision-Set-childcount-and-other-text-fields-i.patch
    PATCHFILES += 3015-backport-64e589e-MythNetvision-Focus-the-search-results-after-a-searc.patch
    PATCHFILES += 3016-backport-220ee25-MythNetvision-Update-thumbnail-and-text-when-switchi.patch
    PATCHFILES += 3017-backport-aa9066f-MythNetVision-NULL-check-item-in-NetSearch-customEve.patch

    # 6.9.04
    PATCHFILES += 0571-backport-1b22056-SendReceiveStringList-handle-the-UNKNOWN_COMMAND-res.patch 
    PATCHFILES += 0572-backport-124a55d-MainServer-send-an-ERROR-response-back-for-malformed.patch
    # 6.9.05
    PATCHFILES += 1147-backport-654a4b2-remotefile-Use-more-accurate-MythCoreContext-IsThisH.patch
    PATCHFILES += 1148-backport-be87ab8-corecontext-Add-IsThisBackend-API.patch
    PATCHFILES += 1149-backport-ef8694a-remotefile-use-IsThisBackend-API.patch
    PATCHFILES += 1150-backport-411272f-RemoteFile-add-some-additional-logging-to-CopyFile.patch
    PATCHFILES += 1151-backport-1dab190-MainServer-add-a-QUERY_FINDFILE-command-to-the-proto.patch
    PATCHFILES += 1152-backport-7856014-RemoteFile-add-FindFileList-which-uses-the-new-QUERY.patch
    PATCHFILES += 1153-backport-9c18ef0-MythMusic-update-findIcon-to-use-a-regexp-to-find-th.patch
    PATCHFILES += 1154-backport-3902c31-MainServer-use-gCoreContext-IsThisHost-hostname-to-c.patch
    PATCHFILES += 1155-backport-b4dfae9-MythMusic-fix-playback-of-tracks-with-an-in-the-file.patch

endif

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	lang/cxx \
	db/mysql \
	lib/alsa-lib \
	lib/avahi \
	lib/fftw3 \
	lib/freetype \
	lib/lame \
	lib/libass \
	lib/libavc1394 \
	lib/libcdio \
	lib/libiec61883 \
	lib/libxml2 \
	lib/openssl \
	lib/taglib \
	lib/zlib \
	python/python \
	python/python-MySQL-python \
	python/python-lxml \
	python/python-urlgrabber \
	qt/qt4 \
	system/lirc \
	system/udev \
	X11/libvdpau \
	xorg/xorg
BUILDDEPS = \
	devel/yasm \
	python/python-distutilscross \
	python/python-MySQL-python \
	python/python-lxml \
	python/python-urlgrabber

DISTNAME_SHORT = $(GARNAME)-$(MYTHTV_GARVERSION_SHORT)

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

PWD := $(shell pwd)

CONFIGURE_SCRIPTS = $(WORKSRC)/mythtv/configure
BUILD_SCRIPTS     = $(WORKSRC)/mythtv/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/mythtv/Makefile source

CONFIGURE_ARGS = \
	--compile-type=$(if $(filter yes,$(mm_DEBUG)),"debug","release") \
	--prefix="$(DESTDIR)$(prefix)" \
	--runprefix="$(prefix)" \
	--libdir-name="$(patsubst $(prefix)/%,%,$(libdir))" \
	--disable-ccache \
	--disable-distcc \
	--bindir="$(DESTDIR)$(bindir)" \
	--datadir="$(DESTDIR)$(datadir)/mythtv" \
	--libdir="$(DESTDIR)$(libdir)" \
	--shlibdir="$(DESTDIR)$(libdir)" \
	--incdir="$(DESTDIR)$(includedir)/mythtv" \
	--mandir="$(DESTDIR)$(mandir)" \
	$(if $(filter -Os,$(CFLAGS)),--enable-small) \
	--cross-prefix="$(compiler_prefix)" \
	--enable-cross-compile \
	--sysroot="$(DESTDIR)$(rootdir)" \
	--sysinclude="$(DESTDIR)$(includedir)" \
	--target-os="linux" \
	--nm="$(NM)" \
	--as="$(CC)" \
	--cc="$(CC)" \
	--cxx="$(CXX)" \
	--ld="$(CC)" \
	--qmake="$(DESTDIR)$(qt4bindir)/qmake" \
	--host-cc="$(build_CC)" \
	--host-cflags="$(build_CFLAGS)" \
	--host-ldflags="$(build_LDFLAGS)" \
	--host-libs="" \
	--extra-cflags="$(CFLAGS)" \
	--extra-cxxflags="$(CXXFLAGS)" \
	--extra-ldflags="$(LDFLAGS)" \
	--enable-symbol-visibility \
	--arch=$(GARCH_FAMILY) \
	--tune=$(GARCH) \
	--cpu=$(GARCH) \
	--disable-altivec \
	--enable-amd3dnow \
	--enable-amd3dnowext \
	--enable-mmx \
	--enable-sse \
	--enable-ssse3 \
	--enable-yasm \
	--disable-proc-opt \
	--enable-audio-oss \
	--enable-audio-alsa \
	--disable-audio-jack \
	--disable-audio-pulseoutput \
	--disable-valgrind \
	--enable-lirc \
	--disable-joystick-menu \
	--enable-firewire \
	--disable-hdhomerun \
	--disable-ceton \
	--enable-v4l2 \
	--enable-ivtv \
	--enable-hdpvr \
	--enable-dvb \
	--dvb-path="$(DESTDIR)$(includedir)" \
	--disable-asi \
	--enable-x11 \
	--x11-path="$(DESTDIR)$(includedir)" \
	--enable-xrandr \
	--disable-xv \
	--enable-vdpau \
	--disable-crystalhd \
	--enable-vaapi \
	--disable-dxva2 \
	--enable-opengl-video \
	--disable-quartz-video \
	--disable-mac-bundle \
	--enable-libxml2 \
	--libxml2-path="$(DESTDIR)$(includedir)/libxml2" \
	--enable-libdns_sd \
	--enable-libcrypto \
	--without-bindings="perl" \
	--without-bindings="php" \
	--with-bindings="python" \
	--disable-mythlogserver

CONFIGURE_ENV  = $(MYTHTV_CONFIGURE_ENV)
BUILD_ENV      = $(MYTHTV_BUILD_ENV)
INSTALL_ENV    = $(MYTHTV_INSTALL_ENV)

BUILD_ENV     += PYTHONXCPREFIX=$(DESTDIR)$(prefix)
INSTALL_ENV   += PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

GAR_EXTRA_CONF += python/python/package-api.mk
include ../../gar.mk

CPPFLAGS += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd
CFLAGS   += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd
CXXFLAGS += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd

CPPFLAGS += -fPIC
CFLAGS   += -fPIC

CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

svn//%/$(DISTNAME).tar.bz2:
	@$(call FETCH_SVN, http://$*, $(MYTHTV_SVN_VERSION), $(DISTNAME))
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

install-source:
	@rm -rf $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@mkdir -p $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@rm -rf $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@ln -sf $(PWD)/$(WORKSRC)/mythtv $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@$(MAKECOOKIE)

post-install: post-install-mythtv-version
	@rm -f $(DESTDIR)$(bindir)/mythtv
	@mv $(DESTDIR)$(bindir)/mythavtest $(DESTDIR)$(bindir)/mythtv
	@$(MAKECOOKIE)

post-configure:
	@sed -i -e "s/MYTH_SOURCE_VERSION.*/MYTH_SOURCE_VERSION \"$(MYTHTV_GIT_VERSION)-v`grep "^mm_VERSION_MINIMYTH" ~/.minimyth/minimyth.conf.mk | sed -e 's/.*\?=\s*\([0-9]*\.[0-9]*\.[0-9]*\).*/\1/'`\"/" $(WORKSRC)/mythtv/version.sh
	@sed -i -e "s/MYTH_SOURCE_PATH.*/MYTH_SOURCE_PATH \"$(mm_MYTH_VERSION)\"/" $(WORKSRC)/mythtv/version.sh
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(bindir)/mtd
	@rm -rf $(DESTDIR)$(bindir)/myth*
	@rm -rf $(DESTDIR)$(datadir)/myth*
	@rm -rf $(DESTDIR)$(includedir)/myth*
	@rm -rf $(DESTDIR)$(libdir)/libmyth*
	@rm -rf $(DESTDIR)$(libdir)/myth*
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV-*
	@$(foreach dir,$(filter-out %/Makefile,$(wildcard ../../myth/* ../../myth-*/*)),$(MAKE) -C $(dir) clean ; )

source-update:
	@$(MAKE) source-update-source
	@$(MAKE) source-update-patches

source-update-source:
	@$(MAKE) clean
	@$(MAKE) fetch
	@$(MAKE) $(GARCHIVEDIR)/$(DISTNAME).tar.bz2
	@$(MAKE) clean

source-update-patches:
	@$(MAKE) clean
	@$(MAKE) extract
	@$(foreach PATCHFILE, $(PATCHFILES), \
		cd $(WORKDIR) || exit 1 ; \
		mv $(DISTNAME) $(DISTNAME)-old || exit 1 ; \
		cp -r $(DISTNAME)-old $(DISTNAME)-new || exit 1 ; \
		cd $(DISTNAME)-new || exit 1 ; \
		SIMPLE_BACKUP_SUFFIX=.gar-source-update-patches patch -p1 < ../../../files/$(PATCHFILE) || exit 1 ; \
		cd ../ || exit 1 ; \
		find $(DISTNAME)-new -name *.gar-source-update-patches -exec rm {} \; || exit 1 ; \
		( diff -Naur $(DISTNAME)-old $(DISTNAME)-new > ../../files/$(PATCHFILE) ; test $$? -lt 2 ) || exit 1 ; \
		rm -fr $(DISTNAME)-old || exit 1 ; \
		mv $(DISTNAME)-new $(DISTNAME) || exit 1 ; \
		cd ../../ || exit 1 ; \
		rm -f checksums~ || exit 1 ; \
		cat checksums | grep -v $(DOWNLOADDIR)/$(PATCHFILE) > checksums~ || true ; \
		md5sum $(DOWNLOADDIR)/$(PATCHFILE) >> checksums~ || exit 1 ; \
		rm -f checksums || exit 1 ; \
		mv -f checksums~ checksums || exit 1 ; )
	@$(MAKE) clean
