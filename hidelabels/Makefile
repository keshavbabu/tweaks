INSTALL_TARGET_PROCESSES = SpringBoard

export ARCHS = arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = hidelabels

hidelabels_FILES = Tweak.x
hidelabels_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
