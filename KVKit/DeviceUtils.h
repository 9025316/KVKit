
//
//  DeviceUtils.h
//  mangotv
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//  设备信息

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DeviceUtils : NSObject


/** 是否是竖屏 **/
+ (BOOL)isOrientationVertical;
/** 强制竖屏 **/
+ (void)orientationVertical;

/** 获取发布版本号 **/
+ (NSString *)getBigVersion;

/** 生成一个uuid **/
+ (NSString *) insertUuid;

/** 获取唯一标识符uuid **/
+ (NSString *) getUuidAdv;

/** 获取系统版本号 **/
+ (NSString *) getSystemVersion;

/** 获取内部App版本 **/
+ (NSString *) getAppVersion;

/** 获取型号：iphone、ipad等 **/
+ (NSString *)getDevice;

/** 获取型号：iphone_5、ipad_2等 **/
+ (NSString *) getDeviceModel;

/** 获取cpu占用率 **/
+ (CGFloat) getCpuUsage;

//+(BOOL) laterfor6s;

/** 获取设备mac地址 **/
+ (NSString *)getMacAddress;

///** 检查连接是否可用 url:为空时默认使用http://www.baidu.com **/
//+ (BOOL)isConnectionAvailable:(NSString *)url;

/** 获取当前设置的guid **/
//+ (NSString *)getGuid;

/** 未使用内存 **/
+(double)freeMemory;

/** 占用内存 **/
+ (double)usedMemory;

+ (float)cpu_usage;

/** 获取当前设置网络的公网ip地址(cip)/省份(cname)/邮政编码(cid) **/
//+ (NSString *)deviceWANIPAdress;

@end
