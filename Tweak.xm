#import <UIAlertView+Blocks.h>
static BOOL tapConfirmation = NO;
static NSMutableDictionary *plist;

// Photos DoubleTab Confirmation
%hook IGFeedPhotoView
-(void)onDoubleTap:(id)fp8{
    if (tapConfirmation) {
        UIAlertView *alert = [[UIAlertView alloc] init];
        [alert setMessage:@"Like Image?"];
        [alert setDelegate:self];
        [alert addButtonWithTitle:@"No"];
        [alert addButtonWithTitle:@"Yes"];
        [alert show];
        [alert release];
        [alert showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) %orig;
        }];
    }
    else %orig;
}
%end


// Video DoubleTab Confirmation
%hook IGFeedItemVideoView
-(void)onDoubleTap:(id)fp8{
    if (tapConfirmation) {
        UIAlertView *alert = [[UIAlertView alloc] init];
        [alert setMessage:@"Like Video?"];
        [alert setDelegate:self];
        [alert addButtonWithTitle:@"No"];
        [alert addButtonWithTitle:@"Yes"];
        [alert show];
        [alert release];
        [alert showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) %orig;
        }];
    }
    else %orig;
}
%end


static void reloadPrefs() {
    [plist release];
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.f0u4d.instaconfirm.plist"];
    tapConfirmation = [[plist objectForKey:@"tapConfirmation"] boolValue];   
}

static void PreferencesChanges(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    reloadPrefs();
}

%ctor {
    reloadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)PreferencesChanges, CFSTR("com.f0u4d.instaconfirm.preferences-changed"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}