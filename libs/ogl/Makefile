include ../../conanbuildinfo.mak

#----------------------------------------
#     Prepare flags from variables
#----------------------------------------

CFLAGS          += $(CONAN_CFLAGS)
CXXFLAGS        += $(CONAN_CXXFLAGS)
CPPFLAGS        += $(addprefix -I, $(CONAN_INCLUDE_DIRS))
CPPFLAGS        += $(addprefix -D, $(CONAN_DEFINES))
LDFLAGS         += $(addprefix -L, $(CONAN_LIB_DIRS))
LDLIBS          += $(addprefix -l, $(CONAN_LIBS))


MVE_ROOT = ../..
TARGET := libmve_ogl.a
include ${MVE_ROOT}/Makefile.inc

# Position independent code (-fPIC) is required for the UMVE plugin system.
CXXFLAGS += -fPIC -I${MVE_ROOT}/libs

SOURCES := $(wildcard [^_]*.cc)
${TARGET}: ${SOURCES:.cc=.o}
	$(AR) rcs $@ $^

clean:
	${RM} ${TARGET} *.o Makefile.dep

.PHONY: clean
