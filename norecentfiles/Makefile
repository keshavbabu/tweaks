INSTALL_TARGET_PROCESSES = Files

export ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoRecentFiles

NoRecentFiles_FILES = Tweak.xm
NoRecentFiles_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
