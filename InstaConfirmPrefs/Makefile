ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = InstaConfirm
InstaConfirm_FILES = InstaConfirm.mm
InstaConfirm_INSTALL_PATH = /Library/PreferenceBundles
InstaConfirm_FRAMEWORKS = UIKit
InstaConfirm_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/InstaConfirm.plist$(ECHO_END)
