//
//  UIImageView+Radius.h
//  Zcsdxc
//
//  Created by MacBook Pro on 17/1/6.
//  Copyright © 2017年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Radius)

/** imageView 画圆 **/
- (UIImageView *)radiusViewWithImageView;
// 使用如下：
//[imageView radiusViewWithImageView]




// 图像切两个圆角
- (UIImageView *)imagebyRoundingCorners:(UIRectCorner)rectHorns CornerRadii:(CGFloat)cornerRadii;

// 使用如下：
// [self.view addSubview:[imageView imagebyRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight  CornerRadii:30]];
@end
