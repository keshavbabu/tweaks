INSTALL_TARGET_PROCESSES = Files
GO_EASY_ON_ME = 1
export ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RealFiles

RealFiles_FILES = Tweak.x
RealFiles_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
