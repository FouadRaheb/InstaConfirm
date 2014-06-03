#import <UIAlertView+Blocks.h>
 
static NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.f0u4d.instaconfirm.plist"];

// Photos DoubleTab Confirmation

%hook IGFeedItemPhotoView

-(void)onDoubleTap:(id)fp8{
    
    BOOL tapConfirmation = [[plist objectForKey:@"tapConfirmation"]boolValue];
    
    if (tapConfirmation) {
        UIAlertView *alert = [[UIAlertView alloc] init];
        [alert setMessage:@"Like Image?"];
        [alert setDelegate:self];
        [alert addButtonWithTitle:@"Yes"];
        [alert addButtonWithTitle:@"No"];
        [alert show];
        [alert release];
        [alert showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 0)
            {
                %orig;
            }
            else if (buttonIndex == 1)
            {
                // do nothing
            }
        }];
    }
    else {
        %orig;
    }
}

%end


// Video DoubleTab Confirmation

%hook IGFeedItemVideoView

-(void)onDoubleTap:(id)fp8{
    
    BOOL tapConfirmation = [[plist objectForKey:@"tapConfirmation"]boolValue];
    
    if (tapConfirmation) {
        UIAlertView *alert = [[UIAlertView alloc] init];
        [alert setMessage:@"Like Video?"];
        [alert setDelegate:self];
        [alert addButtonWithTitle:@"Yes"];
        [alert addButtonWithTitle:@"No"];
        [alert show];
        [alert release];
        [alert showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 0)
            {
                %orig;
            }
            else if (buttonIndex == 1)
            {
                // do nothing
            }
        }];
    }
    else {
        %orig;
    }
}

%end