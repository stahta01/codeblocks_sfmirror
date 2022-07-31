AM_CPPFLAGS = $(WX_CXXFLAGS) \
		-I$(srcdir)/include

if CODEBLOCKS_NT
AM_CPPFLAGS += \
			-DWXUSINGDLL \
			${WX_MSW_CXXFLAGS}
endif

wxcontribitemsdir=$(libdir)/codeblocks/wxContribItems

wxcontribitems_LTLIBRARIES = libwxspeedbutton.la

libwxspeedbutton_la_LDFLAGS = -version-info 0:1:0

if CODEBLOCKS_NT
libwxspeedbutton_la_LDFLAGS += -no-undefined
endif

libwxspeedbutton_la_LIBADD = $(WX_LIBS)

libwxspeedbutton_la_SOURCES = \
./wxSpeedButton.cpp

sdkdir=$(includedir)/codeblocks/wxContribItems/wxSpeedButton

sdk_HEADERS = \
./wxSpeedButton.h

