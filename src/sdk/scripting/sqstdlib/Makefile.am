AM_CPPFLAGS = -I$(top_srcdir)/src/include/scripting/include

if CODEBLOCKS_NT
AM_CPPFLAGS += \
			-DEXPORT_LIB \
			-DWXUSINGDLL \
			${WX_MSW_CXXFLAGS}
endif

noinst_LTLIBRARIES = libsqstdlib.la

noinst_HEADERS = \
	sqstdblobimpl.h \
	sqstdstream.h

if CODEBLOCKS_NT
libsqstdlib_la_LDFLAGS = -no-undefined
endif

libsqstdlib_la_SOURCES = \
	sqstdaux.cpp \
	sqstdblob.cpp \
	sqstdio.cpp \
	sqstdlib.dsp \
	sqstdmath.cpp \
	sqstdrex.cpp \
	sqstdstream.cpp \
	sqstdstring.cpp \
	sqstdsystem.cpp
