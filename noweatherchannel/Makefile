INSTALL_TARGET_PROCESSES = Weather

export ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoWeatherChannel

NoWeatherChannel_FILES = Tweak.xm
NoWeatherChannel_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
