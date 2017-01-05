//
//  NSString+Category.h
//  XMC25
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category)

/**
 *	@author meexun, 16-12-28 10:12:37
 *
 *	传入user_id经过解密后返回前8位的密码
 *
 *	@param input	需要解密的字符串
 *
 *	@return 返回一个解密后的字符串
 *
 *	@since 1.0.0
 */
+ (NSString*)digest:(NSString*)input;

/**
 *  MD5加密
 *
 *  @return 返回一个MD5加密的String
 */
- (NSString *)stringFromMD5;



/*! 根据固定宽,计算Size */
- (CGSize)sizeWithFont:(UIFont *)font forWidth:(CGFloat)width NS_AVAILABLE(10_11, 7_0);
/*! 根据固定高,计算Size */
- (CGSize)sizeWithFont:(UIFont *)font forHeight:(CGFloat)height NS_AVAILABLE(10_11, 7_0);


/**
 *  据报String内容计算出来个新的Size
 *
 *  @param size 需要计算的范围
 *  @param font 用于计算的字号
 *
 *  @return 返回一个Size对象
 */
- (CGSize)sizeWithSize:(CGSize)size andFont:(UIFont *)font;


- (NSString *)getOriginalImageURL;

/**
 *  使用CoreFoundation 将string to UTF-8
 *
 *  @param input 需要转码的string
 *
 *  @return UTF-8编码
 */
+ (NSString *)encodeToPercentEscapeStaticString:(NSString *)input;
- (NSString *)encodeToPercentEscapeString:(NSString *)input;

@end
