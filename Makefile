THEOS_DEVICE_IP = 192.168.1.100
THEOS_DEVICE_PORT = 22

THEOS_BUILD_DIR = packages

ARCHS = armv7 arm64
include theos/makefiles/common.mk

SUBPROJECTS += InstaConfirmPrefs

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

TWEAK_NAME = InstaConfirm
InstaConfirm_FILES = Tweak.xm UIAlertView+Blocks.m
InstaConfirm_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
