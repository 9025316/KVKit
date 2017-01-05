//
//  NSString+Category.m
//  XMC25
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSString+Verification.m"

@implementation NSString (Category)

//GET HASHED STRING
+ (NSString*)digest:(NSString*)input {
    
    const char *cstr = [(NSString*)input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:strlen(cstr)];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (uint32_t)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    NSString * pw = [output substringToIndex:8];
    
    return pw;
}


- (NSString *)stringFromMD5 {
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

- (CGSize)sizeWithFont:(UIFont *)font forWidth:(CGFloat)width {
    NSDictionary *attr = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}
- (CGSize)sizeWithFont:(UIFont *)font forHeight:(CGFloat)height {
    NSDictionary *attr = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}


- (NSString *)getOriginalImageURL
{
    return [self stringByReplacingOccurrencesOfString:@"_thumb" withString:@""];
}

+ (NSString *)encodeToPercentEscapeStaticString:(NSString *)input
{
    if(input == nil)
    {
        return @"";
    }
    NSString *outputStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)input,NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));
    return outputStr;

}

- (NSString *)encodeToPercentEscapeString:(NSString *)input {
    
    // Encode all the reserved characters, per RFC 3986
    NSString *outputStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)input,NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));
    return outputStr;
}

- (BOOL)containsString:(NSString *)str{
    
    if([NSString verificationEmpty:str])
    {
        return NO;
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        return [self rangeOfString: str].location != NSNotFound;
    }
    return YES;
}

@end
