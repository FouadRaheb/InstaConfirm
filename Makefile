ARCHS = armv7 arm64

SUBPROJECTS += InstaConfirmPrefs

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

TWEAK_NAME = InstaConfirm
InstaConfirm_FILES = Tweak.xm UIAlertView+Blocks.m
InstaConfirm_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
