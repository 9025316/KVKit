//
//  UIImageView+Radius.m
//  Zcsdxc
//
//  Created by MacBook Pro on 17/1/6.
//  Copyright © 2017年 Kevin. All rights reserved.
//

#import "UIImageView+Radius.h"

@implementation UIImageView (Radius)

// 图像画圆
- (UIImageView *)radiusViewWithImageView {
    
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    CGFloat radius = MIN(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:radius
                                                    startAngle:0
                                                      endAngle:2*M_PI
                                                     clockwise:YES];
    CAShapeLayer *shape = [CAShapeLayer layer];
    
    shape.path = path.CGPath;
    
    self.layer.mask = shape;
    
    return self;
}

// 图像切两个圆角
- (UIImageView *)imagebyRoundingCorners:(UIRectCorner)rectHorns CornerRadii:(CGFloat)cornerRadii{
    
    self.layer.masksToBounds = YES;
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectHorns cornerRadii: (CGSize){cornerRadii, cornerRadii}].CGPath;
    
    self.layer.mask = maskLayer;
    
    return self;
}

@end
