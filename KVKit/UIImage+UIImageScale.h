//
//  UIImage+UIImageScale.h
//  mangotv
//
//  Created by Hanwen on 16/7/28.
//  Copyright (c) 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageScale)

/**
 *  根据目标图片大小按比例切割，并按照目标尺寸放大或缩小
 *
 *  @param sourceImage 需要切割的图片
 *  @param size        目标尺寸（一般是imageview的尺寸)
 *
 *  @return 返回一个按照新比例切割过的图片
 */
+ (UIImage *)imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;


/**
 * 根据传入的图片,生成一终带有边框的圆形图片.
 * borderW边框宽度
 * borderColor:边框颜色
 * image:要生成的原始图片.
 **/
+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image;

@end
