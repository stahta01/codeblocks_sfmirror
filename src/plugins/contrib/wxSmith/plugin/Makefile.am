AM_CPPFLAGS = $(WX_CXXFLAGS) \
		-I$(top_srcdir)/src/include \
		-I$(top_srcdir)/src/sdk/wxscintilla/include

if CODEBLOCKS_NT
AM_CPPFLAGS += \
			-DBUILDING_PLUGIN \
			-DWXUSINGDLL \
			${WX_MSW_CXXFLAGS}
endif

pluginlib_LTLIBRARIES = libwxsmith.la

pluginlibdir = $(pkglibdir)/plugins

libwxsmith_la_LDFLAGS = @MODULE_SHARED_LDFLAGS@ -version-info 0:1:0 -no-undefined -avoid-version

libwxsmith_la_LIBADD = ../../../../sdk/libcodeblocks.la ../libwxsmithlib.la $(WX_LIBS)

libwxsmith_la_SOURCES = wxsmithpluginregistrants.cpp

