INSTALL_TARGET_PROCESSES = SpringBoard

export TARGET = iphone:clang:13.4:13.0
export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LowPowerTap

LowPowerTap_FILES = Tweak.x
LowPowerTap_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
