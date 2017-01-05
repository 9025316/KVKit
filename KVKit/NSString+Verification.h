//
//  NSString+PuDao.h
//  TouristClient
//  验证
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Verification)

/** 去除首尾空格 **/
+ (NSString *)stringByTrimming:(NSString *)string;
/** 去除首尾空格 **/
- (NSString *)stringByTrimming;
/** 判断字符串中是否含有某个字符串 **/
+ (BOOL)isHaveString:(NSString *)string1 InString:(NSString *)string2;
/** 判断字符串中是否含有中文 **/
+ (BOOL)isHaveChineseInString:(NSString *)string;
/** 判断字符串是否全部为数字**/
+ (BOOL)isAllNum:(NSString *)string;
/** 将字典对象转换为 JSON 字符串 **/
+ (NSString *)jsonPrettyStringEncodedWithDic:(NSDictionary *)dictionary;
/** 将数组对象转换为 JSON 字符串 **/
+ (NSString *)jsonPrettyStringEncodedWithArray:(NSArray *)array;
/** 判断字符串中是否含有空格 **/
+ (BOOL)isHaveSpaceInString:(NSString *)string;
/** 验证字符串不为空 **/
+ (BOOL) verificationEmpty:(NSString *)string;
/** 验证字符串是否为数字或点 **/
+ (BOOL) verificationNumberOrPoint:(NSString *)string;
- (BOOL) verificationNumberOrPoint;
/** 验证字符处是否为手机号码 **/
+ (BOOL) verificationPhone:(NSString *)string;
/** 验证字符处是否为手机号码 **/
- (BOOL) verificationPhone;
/** 验证字符处是否为座机号码 **/
+ (BOOL) verificationOfficePhone:(NSString *)string;
/** 验证字符处是否为座机号码 **/
-(BOOL) verificationOfficePhone;
/** 验证字符处是否为导游证号码 **/
+ (BOOL) verificationGuideCardNo:(NSString *)string;
/** 验证字符处是否为导游证号码**/
-(BOOL) verificationGuideCardNo;
/** 验证字符串是否为邮箱 **/
+ (BOOL) verificationEmail:(NSString *)string;
/** 验证字符串是否为邮箱 **/
-(BOOL) verificationEmail;
/**验证字符串是否为身份证**/
+ (BOOL)validateIDCardNumber:(NSString *)value;
/**验证字符串是否为身份证**/
- (BOOL)validateIdentityCard;
/**验证是否为护照**/
+ (BOOL)validatePassportCard:(NSString *)string;
/**验证是否为护照**/
- (BOOL)validatePassportCard;
/** 金额两位小数 **/
+(BOOL)verificationPrice:(NSString *)string;
/** 金额两位小数 **/
-(BOOL)verificationPrice;
/** 验证字符串是否有空格 **/
+ (BOOL) verificationSpacing:(NSString *)string;
/** 验证字符串是否有空格 **/
- (BOOL) verificationSpacing;

/**
 * 验证网址正则
 *
 *  @param string 要验证的字符串
 *
 *  @return 返回值类型为BOOL
 */
+ (BOOL)urlValidation:(NSString *)string;

/** 当字符串为nil或nsnull时 返回"" **/
+ (NSString *) stringNilReturn:(id)string;
/** 当字符串为nil时 返回"" **/
- (NSString *) stringNilReturn;

/** 前后添加字符串，变成[1,2]格式数组 **/
+ (NSString *) stringCentreInclude:(NSString *)string;
/** 前后添加字符串，变成[1,2]格式数组 **/
- (NSString *) stringCentreInclude;

/** 获取文字的宽高 **/
+ (CGSize) stringSize:(NSString *)string size:(CGSize)size font:(UIFont *)font;
/** 获取文字的宽高 **/
- (CGSize) stringSize:(CGSize)size font:(UIFont *)font;

/*去HTML标签*/
+(NSString *)stringByTrimmingHTML:(NSString *)string;
-(NSString *)stringByTrimmingHTML;
@end

@interface UIColor (String)

+ (UIColor *)colorWithHexString:(NSString *)hexStr;
@end
