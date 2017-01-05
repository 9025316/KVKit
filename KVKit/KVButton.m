//
//  KVButton.m
//  MyApp1
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVButton.h"

//延迟处理
#define GCDAfter(seconds, block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( seconds * NSEC_PER_SEC)),dispatch_get_main_queue(), block)
@interface KVButton ()
@property (nonatomic, assign) int seconds;

@end

@implementation KVButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType
                         frame:(CGRect)frame
                         title:(NSString *)title
                    titleColor:(UIColor *)titleColor
                     titleFont:(CGFloat)font
                 textAlignment:(NSTextAlignment)textAlignment
                  cornerRadius:(CGFloat)radius
                         image:(UIImage *)image
          imageViewContentMode:(UIViewContentMode)imageViewContentMode
                       handler:(void (^)(UIButton *button))clickBlock{
    //button的类型
    KVButton *button = [super buttonWithType:buttonType];
    //button的frame
    button.frame = frame;
    // button 设置圆角
    button.layer.cornerRadius = radius;
    button.layer.masksToBounds = YES;
    //文字居中
    button.titleLabel.textAlignment = textAlignment;
    //文字大小
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    //文字颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    //图片填充的内容模式
    button.imageView.contentMode = imageViewContentMode;
    //button的title
    [button setTitle:title forState:UIControlStateNormal];
    //button的image
    [button setImage:image forState:UIControlStateNormal];
    //button的点击事件
    button.buttonClickBlock = clickBlock;
    [button addTarget:button action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

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
                       handler:(void (^)(UIButton *button))clickBlock{
    //button的类型
    KVButton *button = [super buttonWithType:buttonType];
    //button的frame
    button.frame = frame;
    // button 设置圆角
    if (radius > 0) {
        button.layer.cornerRadius = radius;
        button.layer.masksToBounds = YES;
    }
    //边框宽度
    if (borderColor > 0) button.layer.borderWidth = borderwidth;
    //边框颜色
    if (borderColor != nil) button.layer.borderColor = borderColor.CGColor;
    //文字居中
    button.titleLabel.textAlignment = textAlignment;
    //文字大小
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    //文字颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    //图片填充的内容模式
    button.imageView.contentMode = imageViewContentMode;
    //button的title
    [button setTitle:title forState:UIControlStateNormal];
    //button的image
    [button setImage:image forState:UIControlStateNormal];
    //button的点击事件
    button.buttonClickBlock = clickBlock;
    [button addTarget:button action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

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
                       handler:(void (^)(UIButton *button))clickBlock{
    //button的类型
    KVButton *button = [super buttonWithType:buttonType];
    //button的frame
    button.frame = frame;
    // button 设置圆角
    if (radius > 0) {
        button.layer.cornerRadius = radius;
        button.layer.masksToBounds = YES;
    }
    //边框宽度
    if (borderColor > 0) button.layer.borderWidth = borderwidth;
    //边框颜色
    if (borderColor != nil) button.layer.borderColor = borderColor.CGColor;
    //文字居中
    button.titleLabel.textAlignment = textAlignment;
    //文字大小
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    //文字颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    //点击时间
    button.seconds = seconde;
    //图片填充的内容模式
    button.imageView.contentMode = imageViewContentMode;
    //button的title
    [button setTitle:title forState:UIControlStateNormal];
    //button的image
    [button setImage:image forState:UIControlStateNormal];
    //button的点击事件
    button.buttonClickBlock = clickBlock;
    [button addTarget:button action:@selector(epaceButtonEnabled:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark - epaceButtonEnabled Click Action
- (void)epaceButtonEnabled:(UIButton *)sender{
    
    sender.enabled = NO;
    
    if ([self buttonClickBlock]) self.buttonClickBlock(sender);
    
    GCDAfter(self.seconds, ^{sender.enabled = YES;});
}

#pragma mark - handleButton Action
- (void)handleButton:(UIButton *)sender{
    
    if ([self buttonClickBlock]) self.buttonClickBlock(sender);
}


@end
