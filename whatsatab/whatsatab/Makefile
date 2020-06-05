include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = WhatsATab

WhatsATab_FILES = WATRootListController.m
WhatsATab_INSTALL_PATH = /Library/PreferenceBundles
WhatsATab_FRAMEWORKS = UIKit
WhatsATab_PRIVATE_FRAMEWORKS = Preferences
WhatsATab_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/WhatsATab.plist$(ECHO_END)
