AM_CPPFLAGS = -DWXUSINGDLL -DEXPORT_LIB -I$(top_srcdir)/src/include/scripting/include

noinst_LTLIBRARIES = libsqstdlib.la

noinst_HEADERS = \
	sqstdblobimpl.h \
	sqstdstream.h

libsqstdlib_la_LDFLAGS = -no-undefined

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
