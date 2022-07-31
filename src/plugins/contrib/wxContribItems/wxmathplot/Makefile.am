AM_CPPFLAGS = $(WX_CXXFLAGS)

if CODEBLOCKS_NT
AM_CPPFLAGS += \
			-DWXUSINGDLL \
			${WX_MSW_CXXFLAGS}
endif

wxcontribitemsdir=$(libdir)/codeblocks/wxContribItems

wxcontribitems_LTLIBRARIES = libwxmathplot.la

libwxmathplot_la_LDFLAGS = -version-info 0:1:0

if CODEBLOCKS_NT
libwxmathplot_la_LDFLAGS += -no-undefined
endif

libwxmathplot_la_LIBADD = $(WX_LIBS)

libwxmathplot_la_SOURCES = \
./mathplot.cpp

sdkdir=$(includedir)/codeblocks/wxContribItems/wxMathPlot

sdk_HEADERS = \
./mathplot.h

