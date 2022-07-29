bin_PROGRAMS = cb_console_runner

if CODEBLOCKS_NT
.rc.lo:
	$(LIBTOOL) --tag=RC --mode=compile $(WX_RESCOMP) $< -o $@

AM_CPPFLAGS = -D__WXMSW__
endif

cb_console_runner_SOURCES = main.cpp

man_MANS = cb_console_runner.1

EXTRA_DIST = $(man_MANS)
