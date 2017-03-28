//
//  UIView+Tools.h
//  VideoRecord
//
//  Created by Hanwen on 16/7/28.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Tools)
-(void)makeCornerRadius:(float)radius borderColor:(UIColor*)bColor borderWidth:(float)bWidth;

+ (instancetype)viewWithFrame:(CGRect)frame;
/** 返回一个从xib创建的视图 */
+ (instancetype)XIBWithFrame:(CGRect)frame;
/** 添加一组子view： */
- (void)addSubviewsWithArray:(NSArray *)subViews;
/** 批量移除视图 */
+ (void)removeViews:(NSArray *)views;
/** 移除所有子视图 */
- (void)removeAllSubviews;
/** 获取view的controller */
- (UIViewController *)viewcontroller
@end
