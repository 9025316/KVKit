//
//  KVButton.h
//  MyApp1
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVButton : UIButton

@property (nonatomic,copy) void(^buttonClickBlock)(UIButton *button);

/** 普通初始化方法 **/
+ (instancetype)buttonWithType:(UIButtonType)buttonType
                         frame:(CGRect)frame
                         title:(NSString *)title
                    titleColor:(UIColor *)titleColor
                     titleFont:(CGFloat)font
                 textAlignment:(NSTextAlignment)textAlignment
                  cornerRadius:(CGFloat)radius
                         image:(UIImage *)image
          imageViewContentMode:(UIViewContentMode)imageViewContentMode
                       handler:(void (^)(UIButton *button))clickBlock;

/** 切圆角初始化方法 **/
+ (instancetype)buttonWithType:(UIButtonType)buttonType
                         frame:(CGRect)frame
                         title:(NSString *)title
                    titleColor:(UIColor *)titleColor
                     titleFont:(CGFloat)font
                 textAlignment:(NSTextAlignment)textAlignment
                  cornerRadius:(CGFloat)radius
                   BorderWidth:(CGFloat)borderwidth
                   BorderColor:(UIColor *)borderColor
                         image:(UIImage *)image
          imageViewContentMode:(UIViewContentMode)imageViewContentMode
                       handler:(void (^)(UIButton *button))clickBlock;

/** 切圆角并设置点击时间初始化方法 **/
+ (instancetype)buttonWithType:(UIButtonType)buttonType
                         frame:(CGRect)frame
                         title:(NSString *)title
                    titleColor:(UIColor *)titleColor
                     titleFont:(CGFloat)font
                 textAlignment:(NSTextAlignment)textAlignment
                  cornerRadius:(CGFloat)radius
                   BorderWidth:(CGFloat)borderwidth
                   BorderColor:(UIColor *)borderColor
                         image:(UIImage *)image
          imageViewContentMode:(UIViewContentMode)imageViewContentMode EpaceEnabled:(int)seconde
                       handler:(void (^)(UIButton *button))clickBlock;

@end
