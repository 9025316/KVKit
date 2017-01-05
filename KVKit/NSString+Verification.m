//
//  NSString+PuDao.m
//  TouristClient
////  验证
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "NSString+Verification.h"

@implementation NSString (Verification)

//判断字符串中是否含有空格
+ (BOOL)isHaveSpaceInString:(NSString *)string{
    NSRange _range = [string rangeOfString:@" "];
    if (_range.location != NSNotFound) {
        return YES;
    }else {
        return NO;
    }
}

// 判断字符串中是否含有某个字符串
+ (BOOL)isHaveString:(NSString *)string1 InString:(NSString *)string2{
    NSRange _range = [string2 rangeOfString:string1];
    if (_range.location != NSNotFound) {
        return YES;
    }else {
        return NO;
    }
}

+ (BOOL)isHaveChineseInString:(NSString *)string{
    for(NSInteger i = 0; i < [string length]; i++){
        int a = [string characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}
// 判断字符串是否全部为数字
+ (BOOL)isAllNum:(NSString *)string{
    unichar c;
    for (int i=0; i<string.length; i++) {
        c=[string characterAtIndex:i];
        if (!isdigit(c)) {
            return NO;
        }
    }
    return YES;
}

#pragma mark 去除首尾空格
+ (NSString *)stringByTrimming:(NSString *)string {
    
    NSString *stringByTrimming = @"";
    if(self != nil)
    {
        stringByTrimming = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    else
    {
        stringByTrimming = @"";
    }
    return stringByTrimming;
}
- (NSString *)stringByTrimming
{
    return [NSString stringByTrimming:self];
}

//将字典对象转换为 JSON 字符串
+ (NSString *)jsonPrettyStringEncodedWithDic:(NSDictionary *)dictionary{
    if ([NSJSONSerialization isValidJSONObject:dictionary ]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
        if (!error) {
            NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            return json;
        }
    }
    return nil;
}

//将数组对象转换为 JSON 字符串
+ (NSString *)jsonPrettyStringEncodedWithArray:(NSArray *)array{
    if ([NSJSONSerialization isValidJSONObject:array]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
        if (!error) {
            NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            return json;
        }
    }
    return nil;
}

#pragma mark 验证字符串不为空
+ (BOOL)verificationEmpty:(NSString *)string
{
    if([string isEqual:[NSNull null]] || string == nil)
    {
        return YES;
    }
    NSString *str  = [string stringByTrimming];
    if([str isEqualToString:@""])
    {
        return YES;
    }
    return NO;
}
- (BOOL)verificationEmpty
{
    return [NSString verificationEmpty:self];
}

#pragma mark 验证字符串是否为数字或点
+ (BOOL)verificationNumberOrPoint:(NSString *)string
{
    NSString *regex = @"^[0-9]d*|\\.$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:string];
    if(isMatch)
    {
        return YES;
    }
    return NO;
}
- (BOOL)verificationNumberOrPoint
{
    return [NSString verificationNumberOrPoint:self];
}

#pragma mark 验证字符处是否为手机号码
+ (BOOL)verificationPhone:(NSString *)string
{
    NSString *regex = @"^((13[0-9])|(145)|(147)|(15[^4,\\D])|(170)|17[6-8]|(18[0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:string];
    if(isMatch)
    {
        return YES;
    }
    return NO;
}
- (BOOL)verificationPhone
{
    return [NSString verificationPhone:self];
}

/** 验证字符处是否为座机号码 **/
+ (BOOL) verificationOfficePhone:(NSString *)string{
    NSString *regex = @"\\d{3}-\\d{8}|\\d{4}-\\d{7}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:string];
    if(isMatch)
    {
        return YES;
    }
    return NO;
}
/** 验证字符处是否为座机号码 **/
-(BOOL) verificationOfficePhone{
    return [NSString verificationOfficePhone:self];
}


/** 验证字符处是否为导游证号码**/
+ (BOOL) verificationGuideCardNo:(NSString *)string{
    NSString *regex = @"[D][-]\\d{4}[-]\\d{6}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:string];
    if(isMatch)
    {
        return YES;
    }
    return NO;
}
/** 验证字符处是否为导游证号码**/
-(BOOL) verificationGuideCardNo{
    return [NSString verificationGuideCardNo:self];
}

/** 验证字符串是否为邮箱 **/
+ (BOOL) verificationEmail:(NSString *)string
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:string];
    if(isMatch)
    {
        return YES;
    }
    return NO;
}
- (BOOL)verificationEmail
{
    return [NSString verificationEmail:self];
}

/** 金额两位小数 **/
+(BOOL)verificationPrice:(NSString *)string
{
    NSString *regex = @"^(([0-9]+)|([0-9]+\\.[0-9]{0,1}))$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:string];
    if(isMatch)
    {
        return YES;
    }
    return NO;
}

- (BOOL)verificationPrice
{
    return [NSString verificationPrice:self];
}
/**验证字符串是否为身份证**/
+ (BOOL)validateIDCardNumber:(NSString *)value {

    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    int length = 0;
    if (!value) {
        return NO;
    }else {
        length = value.length;
        
        if (length !=15 && length != 18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray = @[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag = NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag = YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year = 0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                              options:NSMatchingReportProgress
                                                                range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch > 0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                              options:NSMatchingReportProgress
                                                                range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch > 0) {
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M = @"F";
                NSString *JYM = @"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                }else {
                    return NO;
                }
                
            }else {
                return NO;
            }
        default:
            return false;
    }
}

- (BOOL)validateIdentityCard
{
    return [NSString validateIDCardNumber:self];
}
/**验证字符串是否为护照**/
+ (BOOL)validatePassportCard:(NSString *)string
{
    NSString *regex;
    if ([string rangeOfString:@"."].location!=NSNotFound) {
        regex =@"^P.[0-9]{7}|S.[0-9]{7}+$";
    }else{
        regex =@"^1[45][0-9]{7}|G[0-9]{8}|P[0-9]{7}|S[0-9]{7,8}|D[0-9]+$.";  
    }
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:string];
    if(isMatch)
    {
        return YES;
    }
    return NO;
    
}
- (BOOL)validatePassportCard
{
    return[NSString validatePassportCard:self];
}

#pragma mark 验证字符串是否有空格
+ (BOOL)verificationSpacing:(NSString *)string
{
    NSRange range = [string rangeOfString:@" "];
    if(range.length > 0)
    {
        return YES;
    }
    return NO;
}

- (BOOL)verificationSpacing
{
    return [NSString verificationSpacing:self];
}

#pragma mark 当字符串为nil或nsnull时 返回
+ (NSString *)stringNilReturn:(id)string
{
    if(string == nil)
    {
        return @"";
    }
    else if([string isEqual:[NSNull null]])
    {
        return @"";
    }
    return string;
}
- (NSString *)stringNilReturn
{
    return [NSString stringNilReturn:self];
}

#pragma mark - 判断url正则
+ (BOOL)urlValidation:(NSString *)string {
    NSError *error;
    // 正则1
//    NSString *regulaStr =@"\\bhttps?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    // 正则2
    NSString *regulaStr =@"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches){
//        NSString *substringForMatch = [string substringWithRange:match.range];
        return YES;
    }
    return NO;
}

#pragma mark 前后添加字符串，变成[1,2]格式数组
+ (NSString *)stringCentreInclude:(NSString *)string
{
    
    return [NSString stringWithFormat:@"[%@]", string];
}
- (NSString *)stringCentreInclude
{
    return [NSString stringCentreInclude:self];
}

#pragma mark 获取文字的宽高
+ (CGSize)stringSize:(NSString *)string size:(CGSize)size font:(UIFont *)font
{
    if(string == nil || font == nil)
    {
        if(string == nil)
        {
            NSLog(@"#----#:字符串为nil");
        }
        else if(font == nil)
        {
            NSLog(@"#----#:字体为nil");
        }
        return CGSizeMake(0, 0);
    }
    CGSize newSize = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : font} context:nil].size;
    return newSize;
}
- (CGSize)stringSize:(CGSize)size font:(UIFont *)font
{
    return [NSString stringSize:self size:size font:font];
}

#pragma mark 去HTML标签
+(NSString *)stringByTrimmingHTML:(NSString *)string{
    //去除所有的标签
    //    NSString *regex = @"<[^>]*>";
    NSString *regex=@"<([^>]*)>";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    [predicate evaluateWithObject:string];
    
    return string;
}
-(NSString *)stringByTrimmingHTML{
    
    return [NSString stringByTrimmingHTML:[[self stringByTrimming] stringByReplacingOccurrencesOfString:@" " withString:@""]];
}

@end

@implementation UIColor (String)

+ (UIColor *)colorWithHexString:(NSString *)hexStr
{
    @autoreleasepool
    {
        NSString *cleanString_1 = [hexStr stringByReplacingOccurrencesOfString:@"#" withString:@""];
        NSString *cleanString = [cleanString_1 stringByReplacingOccurrencesOfString:@"0x" withString:@""];
        if ([cleanString length] == 3) {
            cleanString =
            [NSString stringWithFormat:@"%@%@%@%@%@%@", [cleanString substringWithRange:NSMakeRange(0, 1)],
             [cleanString substringWithRange:NSMakeRange(0, 1)],
             [cleanString substringWithRange:NSMakeRange(1, 1)],
             [cleanString substringWithRange:NSMakeRange(1, 1)],
             [cleanString substringWithRange:NSMakeRange(2, 1)],
             [cleanString substringWithRange:NSMakeRange(2, 1)]];
        }
        if ([cleanString length] == 6) {
            cleanString = [cleanString stringByAppendingString:@"ff"];
        }
        
        unsigned int baseValue;
        [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
        
        float red = ((baseValue >> 24) & 0xFF) / 255.0f;
        float green = ((baseValue >> 16) & 0xFF) / 255.0f;
        float blue = ((baseValue >> 8) & 0xFF) / 255.0f;
        float alpha = ((baseValue >> 0) & 0xFF) / 255.0f;
        
        return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
}

@end
