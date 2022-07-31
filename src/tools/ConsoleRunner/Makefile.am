.rc.lo:
	$(LIBTOOL) --tag=RC --mode=compile $(WX_RESCOMP) $< -o $@

if CODEBLOCKS_NT
AM_CPPFLAGS = -D__WXMSW__
endif

bin_PROGRAMS = cb_console_runner

cb_console_runner_SOURCES = main.cpp

man_MANS = cb_console_runner.1
EXTRA_DIST = $(man_MANS)
