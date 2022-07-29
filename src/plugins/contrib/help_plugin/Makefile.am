.rc.lo:
	$(LIBTOOL) --tag=RC --mode=compile $(WX_RESCOMP) $< -o $@

AM_CPPFLAGS = \
			$(WX_CXXFLAGS) \
			$(CB_SQUIRREL_CFLAGS) \
			-I$(top_srcdir)/src/include \
			-I$(top_srcdir)/src/sdk/wxscintilla/include

if CODEBLOCKS_NT
AM_CXXFLAGS = \
			-DBUILDING_PLUGIN \
			-m64 \
			-pipe \
			-fmessage-length=0 \
			-fexceptions \
			-DHAVE_W32API_H \
			-D__WXMSW__ \
			-DWXUSINGDLL \
			-DcbDEBUG \
			-DwxUSE_UNICODE \
			-D_WIN64
endif

pluginlibdir = $(pkglibdir)/plugins

pluginlib_LTLIBRARIES = \
			libhelp_plugin.la

libhelp_plugin_la_LDFLAGS = \
			@MODULE_SHARED_LDFLAGS@ \
			-no-undefined \
			-avoid-version

if CODEBLOCKS_NT
libhelp_plugin_la_LDFLAGS += \
			-enable-auto-image-base \
			-add-stdcall-alias \
			-enable-auto-import \
			-no-undefined
endif

libhelp_plugin_la_LIBADD = \
			$(top_srcdir)/src/sdk/libcodeblocks.la \
			$(WX_LIBS)

libhelp_plugin_la_LIBADD += \
			$(CB_SQUIRREL_LIBS)

libhelp_plugin_la_LIBADD += \
			-lbz2

libhelp_plugin_la_LIBADD += \
			-lz

libhelp_plugin_la_SOURCES = \
			help_common.cpp \
			HelpConfigDialog.cpp \
			help_plugin.cpp \
			man2html.cpp \
			MANFrame.cpp

noinst_HEADERS = \
			help_common.h \
			HelpConfigDialog.h \
			help_plugin.h \
			man2html.h \
			defs.h \
			MANFrame.h

resources_forZIP = \
			help_plugin.xrc \
			manifest.xml \
			images/16x16/zoomin.png \
			images/16x16/zoomout.png \
			images/20x20/zoomin.png \
			images/20x20/zoomout.png \
			images/24x24/zoomin.png \
			images/24x24/zoomout.png \
			images/28x28/zoomin.png \
			images/28x28/zoomout.png \
			images/32x32/zoomin.png \
			images/32x32/zoomout.png \
			images/40x40/zoomin.png \
			images/40x40/zoomout.png \
			images/48x48/zoomin.png \
			images/48x48/zoomout.png \
			images/56x56/zoomin.png \
			images/56x56/zoomout.png \
			images/64x64/zoomin.png \
			images/64x64/zoomout.png

docdatadir = $(datadir)/@PACKAGE@/docs
if CODEBLOCKS_INSTALLERDOCS_FOUND
docdata_DATA = \
			$(top_srcdir)/windows_installer/Documentation/index.ini \
			$(top_srcdir)/windows_installer/Documentation/*.pdf \
			$(top_srcdir)/windows_installer/Documentation/*.chm
else
docdata_DATA = \
			index.ini
endif

EXTRA_DIST = \
			*.cbp \
			Readme.txt \
			$(resources_forZIP)

pkgdata_DATA = \
			help_plugin.zip

CLEANFILES = \
			$(pkgdata_DATA)

help_plugin.zip: $(resources_forZIP)
	PWD=`pwd` cd $(srcdir) && zip $(PWD)/help_plugin.zip $(resources_forZIP) > /dev/null
