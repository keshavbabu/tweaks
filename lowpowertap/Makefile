INSTALL_TARGET_PROCESSES = SpringBoard

export ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LowPowerTap

LowPowerTap_FILES = Tweak.x
LowPowerTap_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
