//
//  UIView+Tools.m
//  VideoRecord
//
//  Created by Hanwen on 16/7/28.
//  Copyright (c) 2016年 Kevin. All rights reserved.
//

#import "UIView+Tools.h"

@implementation UIView (Tools)

-(void)makeCornerRadius:(float)radius borderColor:(UIColor *)bColor borderWidth:(float)bWidth{
    
    self.layer.borderWidth = bWidth;
    
    if (bColor != nil) {
        self.layer.borderColor = bColor.CGColor;
    }
    
    if (radius > 0) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    }
}


@end
