//
//  UIViewController+KVphoto.h

//  KVphotoExample
//
//  Created by Kevin_han on 16/6/6.
//  Copyright © 2016年 Kevin_han. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^photoBlock)(UIImage *photo);

@interface UIViewController (KVphoto)

/**
 *  照片选择->图库/相机
 *
 *  @param edit  照片是否需要裁剪,默认NO
 *  @param block 照片回调
 */
-(void)showCanEdit:(BOOL)edit photo:(photoBlock)block;

@end
