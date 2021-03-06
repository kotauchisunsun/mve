include conanbuildinfo.mak

#----------------------------------------
#     Prepare flags from variables
#----------------------------------------

CFLAGS          += $(CONAN_CFLAGS)
CXXFLAGS        += $(CONAN_CXXFLAGS)
CPPFLAGS        += $(addprefix -I, $(CONAN_INCLUDE_DIRS))
CPPFLAGS        += $(addprefix -D, $(CONAN_DEFINES))
LDFLAGS         += $(addprefix -L, $(CONAN_LIB_DIRS))
LDLIBS          += $(addprefix -l, $(CONAN_LIBS))

# Builds libs and all apps except umve
all:
	$(MAKE) -C libs
	$(MAKE) -C apps

# Builds Doxygen documentation
doc:
	$(MAKE) -C docs

# Builds the tests, execute with ./tests/test
test:
	$(MAKE) -C tests

# Cleans all libs and apps except umve
clean:
	$(MAKE) -C apps $@
	$(MAKE) -C libs $@
	$(MAKE) -C tests $@

# Creates symbolic links to all apps in $HOME/bin/
links:
	$(MAKE) -C apps $@

.PHONY: all doc test clean links
