//
//  UIImage+Blur.h
//
//  Created by Hanwen on 15/9/3.
//  Copyright (c) 2015年 Kevin_han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
@interface UIImage (Blur)
/**
 * imager 根据传入的图片,生成一张模糊图片
 * Blur 模糊程序
 **/
-(UIImage *)boxblurImageWithBlur:(CGFloat)blur;

/**
 *  使用vImage API进行图像的模糊处理
 *
 *  @param image 原图像
 *  @param blur  模糊度（0.0~1.0）
 *
 *  @return 模糊处理之后的图像
 */
-(UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur

/**
 * imager 根据传入的图片,生成一张模糊图片
 * blurValue 模糊程序
 **/
- (UIImage *)grCIImage:(UIImage *)imager blurValue:(NSInteger)value

@end
