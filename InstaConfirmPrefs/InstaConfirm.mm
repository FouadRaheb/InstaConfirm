#import <Preferences/Preferences.h>
#define plistFile @"/var/mobile/Library/Preferences/com.f0u4d.instaconfirm.plist"
 

@interface InstaConfirmListController: PSListController {
}
@end

@implementation InstaConfirmListController

-(void)twitter{
	if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:@"iF0u4d"]]];
    
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:@"iF0u4d"]]];
    
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:@"iF0u4d"]]];
    
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:@"iF0u4d"]]];
    
	else
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:@"iF0u4d"]]];
} // twitter

-(void)donate{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=TJ6PBN5WD73CG"]];
} // donate link

// iOS 8 pref saving solution
-(id)readPreferenceValue:(PSSpecifier*)specifier {
	NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistFile];
	if (!dict[specifier.properties[@"key"]]) {
		return specifier.properties[@"default"];
	}
	return dict[specifier.properties[@"key"]];
}
-(void) setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
	[defaults addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:plistFile]];
	[defaults setObject:value forKey:specifier.properties[@"key"]];
	[defaults writeToFile:plistFile atomically:YES];
	CFStringRef mikotoPost = (CFStringRef)specifier.properties[@"PostNotification"];
	CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), mikotoPost, NULL, NULL, YES);
}

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"InstaConfirm" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
