include $(GNUSTEP_MAKEFILES)/common.make

# GNUSTEP_INSTALLATION_DIR = $(GNUSTEP_SYSTEM_ROOT)

# GNUSTEP_MAKEFILES = $(GNUSTEP_SYSTEM_ROOT)/Makefiles

# include $(GNUSTEP_MAKEFILES)/common.make

# The application to be compiled
APP_NAME = GMines

# The Objective-C source files to be compiled

GMines_OBJC_FILES = main.m  \
  Controller.m \
  Views.m

SHARED_CFLAGS     += -g    -fobjc-runtime=gnustep-2.0

# The Resource files to be copied into the app's resources directory
#// GMines_RESOURCE_FILES = Icons/*

-include GNUmakefile.preamble

-include GNUmakefile.local

include $(GNUSTEP_MAKEFILES)/application.make
# include /usr/local/GNUstep/System/Makefiles/application.make

-include GNUmakefile.postamble

