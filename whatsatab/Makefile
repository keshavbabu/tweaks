INSTALL_TARGET_PROCESSES = WhatsApp

export ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WhatsATab

WhatsATab_FILES = Tweak.xm
WhatsATab_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += whatsatab
include $(THEOS_MAKE_PATH)/aggregate.mk
