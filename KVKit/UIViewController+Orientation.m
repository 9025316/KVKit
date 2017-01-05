//
//  NSObject+Orientation.m
//  mangotv
//
//  Created by Kevin_han on 2016/10/21.
//  Copyright © 2016年 mgtv.com. All rights reserved.
//

#import "UIViewController+Orientation.h"

@implementation UIViewController (Orientation)

- (void)forceRotateToPortrait {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        
        SEL selector = NSSelectorFromString(@"setOrientation:");
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        
        [invocation setSelector:selector];
        
        [invocation setTarget:[UIDevice currentDevice]];
        
        int val = UIDeviceOrientationPortrait;
        
        [invocation setArgument:&val atIndex:2];
        if (selector) {
            [invocation invoke];
        }
    }
}

@end
