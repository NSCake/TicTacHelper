export TARGET = iphone:latest:13.0
export ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard
include $(THEOS)/makefiles/common.mk

#SOURCES := $(wildcard Folder/*.m)

TWEAK_NAME = TicTacHelper
$(TWEAK_NAME)_GENERATOR = internal
$(TWEAK_NAME)_FILES = SpringBoard.xm
$(TWEAK_NAME)_CFLAGS += -fobjc-arc -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/tweak.mk

before-stage::
	find . -name ".DS_Store" -delete

