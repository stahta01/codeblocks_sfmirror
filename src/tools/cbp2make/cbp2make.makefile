#------------------------------------------------------------------------------#
# This makefile was edited by hand                                             #
#------------------------------------------------------------------------------#

CXX = g++.exe
LD = g++.exe

INC = -Ilib -Ilib/tinyxml -Isrc
CFLAGS = -Wall $(CB_RELEASE_TYPE) -fexceptions -fno-strict-aliasing -Wno-write-strings -std=gnu++11 -m64 -D_WIN64
RESINC = 
LIBDIR = 
LIB = 
LDFLAGS = 

INC_DEFAULT = $(INC)
CFLAGS_DEFAULT = $(CFLAGS)
RESINC_DEFAULT = $(RESINC)
RCFLAGS_DEFAULT = $(RCFLAGS)
LIBDIR_DEFAULT = $(LIBDIR)
LIB_DEFAULT = $(LIB) 
LDFLAGS_DEFAULT = $(LDFLAGS)
OBJDIR_DEFAULT = .objs
DEP_DEFAULT = 
OUT_DEFAULT = bin/cbp2make.exe
OBJ_DEFAULT = $(OBJDIR_DEFAULT)/src/cbp2make.o $(OBJDIR_DEFAULT)/src/cbproject.o $(OBJDIR_DEFAULT)/src/cbptarget.o $(OBJDIR_DEFAULT)/src/cbpunit.o $(OBJDIR_DEFAULT)/src/cbworkspace.o $(OBJDIR_DEFAULT)/src/depsearch.o $(OBJDIR_DEFAULT)/src/cbhelper.o $(OBJDIR_DEFAULT)/src/makefile.o $(OBJDIR_DEFAULT)/src/platforms.o $(OBJDIR_DEFAULT)/src/toolchains.o $(OBJDIR_DEFAULT)/lib/stlconfig.o $(OBJDIR_DEFAULT)/lib/stlconvert.o $(OBJDIR_DEFAULT)/lib/stlfutils.o $(OBJDIR_DEFAULT)/lib/stlgpm.o $(OBJDIR_DEFAULT)/lib/stlstrings.o $(OBJDIR_DEFAULT)/lib/stlvariables.o $(OBJDIR_DEFAULT)/lib/stringhash.o $(OBJDIR_DEFAULT)/lib/tinyxml/tinystr.o $(OBJDIR_DEFAULT)/lib/tinyxml/tinyxml.o $(OBJDIR_DEFAULT)/lib/tinyxml/tinyxmlerror.o $(OBJDIR_DEFAULT)/lib/tinyxml/tinyxmlparser.o $(OBJDIR_DEFAULT)/src/buildtools.o $(OBJDIR_DEFAULT)/src/cbbuildcfg.o $(OBJDIR_DEFAULT)/src/cbbuildmgr.o $(OBJDIR_DEFAULT)/src/cbglobalvar.o

all: default

cleandefault: clean_default

clean: clean_default

before_default: 
	mkdir -p bin
	mkdir -p $(OBJDIR_DEFAULT)/src
	mkdir -p $(OBJDIR_DEFAULT)/lib
	mkdir -p $(OBJDIR_DEFAULT)/lib/tinyxml

after_default: 

default: before_default out_default after_default

out_default: before_default $(OBJ_DEFAULT) $(DEP_DEFAULT)
	$(LD) $(LDFLAGS_DEFAULT) $(LIBDIR_DEFAULT) $(OBJ_DEFAULT) $(LIB_DEFAULT) -o $(OUT_DEFAULT)

$(OBJDIR_DEFAULT)/src/cbp2make.o: src/cbp2make.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/cbp2make.cpp -o $(OBJDIR_DEFAULT)/src/cbp2make.o

$(OBJDIR_DEFAULT)/src/cbproject.o: src/cbproject.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/cbproject.cpp -o $(OBJDIR_DEFAULT)/src/cbproject.o

$(OBJDIR_DEFAULT)/src/cbptarget.o: src/cbptarget.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/cbptarget.cpp -o $(OBJDIR_DEFAULT)/src/cbptarget.o

$(OBJDIR_DEFAULT)/src/cbpunit.o: src/cbpunit.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/cbpunit.cpp -o $(OBJDIR_DEFAULT)/src/cbpunit.o

$(OBJDIR_DEFAULT)/src/cbworkspace.o: src/cbworkspace.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/cbworkspace.cpp -o $(OBJDIR_DEFAULT)/src/cbworkspace.o

$(OBJDIR_DEFAULT)/src/depsearch.o: src/depsearch.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/depsearch.cpp -o $(OBJDIR_DEFAULT)/src/depsearch.o

$(OBJDIR_DEFAULT)/src/cbhelper.o: src/cbhelper.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/cbhelper.cpp -o $(OBJDIR_DEFAULT)/src/cbhelper.o

$(OBJDIR_DEFAULT)/src/makefile.o: src/makefile.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/makefile.cpp -o $(OBJDIR_DEFAULT)/src/makefile.o

$(OBJDIR_DEFAULT)/src/platforms.o: src/platforms.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/platforms.cpp -o $(OBJDIR_DEFAULT)/src/platforms.o

$(OBJDIR_DEFAULT)/src/toolchains.o: src/toolchains.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/toolchains.cpp -o $(OBJDIR_DEFAULT)/src/toolchains.o

$(OBJDIR_DEFAULT)/lib/stlconfig.o: lib/stlconfig.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c lib/stlconfig.cpp -o $(OBJDIR_DEFAULT)/lib/stlconfig.o

$(OBJDIR_DEFAULT)/lib/stlconvert.o: lib/stlconvert.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c lib/stlconvert.cpp -o $(OBJDIR_DEFAULT)/lib/stlconvert.o

$(OBJDIR_DEFAULT)/lib/stlfutils.o: lib/stlfutils.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c lib/stlfutils.cpp -o $(OBJDIR_DEFAULT)/lib/stlfutils.o

$(OBJDIR_DEFAULT)/lib/stlgpm.o: lib/stlgpm.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c lib/stlgpm.cpp -o $(OBJDIR_DEFAULT)/lib/stlgpm.o

$(OBJDIR_DEFAULT)/lib/stlstrings.o: lib/stlstrings.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c lib/stlstrings.cpp -o $(OBJDIR_DEFAULT)/lib/stlstrings.o

$(OBJDIR_DEFAULT)/lib/stlvariables.o: lib/stlvariables.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c lib/stlvariables.cpp -o $(OBJDIR_DEFAULT)/lib/stlvariables.o

$(OBJDIR_DEFAULT)/lib/stringhash.o: lib/stringhash.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c lib/stringhash.cpp -o $(OBJDIR_DEFAULT)/lib/stringhash.o

$(OBJDIR_DEFAULT)/lib/tinyxml/tinystr.o: lib/tinyxml/tinystr.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c lib/tinyxml/tinystr.cpp -o $(OBJDIR_DEFAULT)/lib/tinyxml/tinystr.o

$(OBJDIR_DEFAULT)/lib/tinyxml/tinyxml.o: lib/tinyxml/tinyxml.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c lib/tinyxml/tinyxml.cpp -o $(OBJDIR_DEFAULT)/lib/tinyxml/tinyxml.o

$(OBJDIR_DEFAULT)/lib/tinyxml/tinyxmlerror.o: lib/tinyxml/tinyxmlerror.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c lib/tinyxml/tinyxmlerror.cpp -o $(OBJDIR_DEFAULT)/lib/tinyxml/tinyxmlerror.o

$(OBJDIR_DEFAULT)/lib/tinyxml/tinyxmlparser.o: lib/tinyxml/tinyxmlparser.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c lib/tinyxml/tinyxmlparser.cpp -o $(OBJDIR_DEFAULT)/lib/tinyxml/tinyxmlparser.o

$(OBJDIR_DEFAULT)/src/buildtools.o: src/buildtools.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/buildtools.cpp -o $(OBJDIR_DEFAULT)/src/buildtools.o

$(OBJDIR_DEFAULT)/src/cbbuildcfg.o: src/cbbuildcfg.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/cbbuildcfg.cpp -o $(OBJDIR_DEFAULT)/src/cbbuildcfg.o

$(OBJDIR_DEFAULT)/src/cbbuildmgr.o: src/cbbuildmgr.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/cbbuildmgr.cpp -o $(OBJDIR_DEFAULT)/src/cbbuildmgr.o

$(OBJDIR_DEFAULT)/src/cbglobalvar.o: src/cbglobalvar.cpp
	$(CXX) $(CFLAGS_DEFAULT) $(INC_DEFAULT) -c src/cbglobalvar.cpp -o $(OBJDIR_DEFAULT)/src/cbglobalvar.o

clean_default: 
	rm -f $(OBJ_DEFAULT) $(OUT_DEFAULT)
	rm -fr bin
	rm -fr $(OBJDIR_DEFAULT)/src
	rm -fr $(OBJDIR_DEFAULT)/lib
	rm -fr $(OBJDIR_DEFAULT)/lib/tinyxml

virtual_all: default

.PHONY: before_default after_default clean_default
