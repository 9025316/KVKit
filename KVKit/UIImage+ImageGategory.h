//
//  UIImage+ImageGategory.h
//  MyApp1
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageGategory)

// 怀旧 --> CIPhotoEffectInstant                         单色 --> CIPhotoEffectMono
// 黑白 --> CIPhotoEffectNoir                            褪色 --> CIPhotoEffectFade
// 色调 --> CIPhotoEffectTonal                           冲印 --> CIPhotoEffectProcess
// 岁月 --> CIPhotoEffectTransfer                        铬黄 --> CIPhotoEffectChrome
// CILinearToSRGBToneCurve, CISRGBToneCurveToLinear, CIGaussianBlur, CIBoxBlur, CIDiscBlur, CISepiaTone, CIDepthOfField
/** 对图片进行滤镜处理 **/
+ (UIImage *)filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name;

// CIGaussianBlur ---> 高斯模糊
// CIBoxBlur      ---> 均值模糊(Available in iOS 9.0 and later)
// CIDiscBlur     ---> 环形卷积模糊(Available in iOS 9.0 and later)
// CIMedianFilter ---> 中值模糊, 用于消除图像噪点, 无需设置radius(Available in iOS 9.0 and later)
// CIMotionBlur   ---> 运动模糊, 用于模拟相机移动拍摄时的扫尾效果(Available in iOS 9.0 and later)
/** 对图片进行模糊处理 **/
+ (UIImage *)blurWithOriginalImage:(UIImage *)image blurName:(NSString *)name radius:(NSInteger)radius;

/**
 *  调整图片饱和度, 亮度, 对比度
 *
 *  @param image      目标图片
 *  @param saturation 饱和度
 *  @param brightness 亮度: -1.0 ~ 1.0
 *  @param contrast   对比度
 *
 */
+ (UIImage *)colorControlsWithOriginalImage:(UIImage *)image
                                 saturation:(CGFloat)saturation
                                 brightness:(CGFloat)brightness
                                   contrast:(CGFloat)contrast;

/*
 * 创建一张实时模糊效果 View (毛玻璃效果)
 * Avilable in iOS 8.0 and later
 */
+ (UIVisualEffectView *)effectViewWithFrame:(CGRect)frame;

/** 全屏截图 **/
+ (UIImage *)shotScreen;

/** 截取view生成一张图片 **/
+ (UIImage *)shotWithView:(UIView *)view;

/** 截取view中某个区域生成一张图片 **/
+ (UIImage *)shotWithView:(UIView *)view scope:(CGRect)scope;

/** 压缩图片到指定尺寸大小 **/
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;

/** 压缩图片到指定文件大小 **/
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;

@end
