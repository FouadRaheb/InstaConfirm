//
//  UIAlertView+Blocks.m
//  GitLabViewer
//
//  Created by Jon Staff on 2/13/14.
//  Copyright (c) 2014 Indatus. All rights reserved.
//

#import "UIAlertView+Blocks.h"
#import <objc/runtime.h>

@interface INAlertWrapper : NSObject

@property (copy) void(^completionBlock)(UIAlertView *alertView, NSInteger buttonIndex);

@end

@implementation INAlertWrapper

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.completionBlock) {
        self.completionBlock(alertView, buttonIndex);
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    if (self.completionBlock) {
        self.completionBlock(alertView, alertView.cancelButtonIndex);
    }
}

@end


static const char kINAlertWrapper;

@implementation UIAlertView (Blocks)

- (void)showWithCompletion:(void (^)(UIAlertView *, NSInteger))completion
{
    INAlertWrapper *wrapper = [INAlertWrapper new];
    wrapper.completionBlock = completion;
    self.delegate = wrapper;
    
    objc_setAssociatedObject(self, &kINAlertWrapper, wrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self show];
}
@end