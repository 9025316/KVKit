//
//  NSArray+Category.m
//  WHWY_ONE_PIECE
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)

//- (NSString *)descriptionWithLocale:(id)locale {
//    NSMutableString *str = [NSMutableString string];
//    
//    [str appendString:@"[\n"];
//    // 遍历数组的所有元素
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        [str appendFormat:@"%@,\n", obj];
//    }];
//    [str appendString:@"]"];
//    // 查出最后一个,的范围
//    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
//    if (range.length) {
//        // 删掉最后一个,
//        [str deleteCharactersInRange:range];
//    }
//    
//    return str;
//}


- (BOOL)isHaveContainsObject:(id)anObject {
    BOOL isHave = [self containsObject:anObject];
    if (isHave) {
        NSLog(@"%@:存在于当前数组中",anObject);
        if (self.count > 1) {
            NSLog(@"该数组还有其他对象：%@",__P(self));
        } else {
            NSLog(@"%@",__P(self));
        }
    } else {
        NSLog(@"不存在");
    }
    
    return isHave;
}

- (void)MGLogInfoArrayAllCount {
    NSLog(@"数据中有：%d个对象，分别为：%@",(int)self.count,__P(self));
}

- (NSString *)anLastObject {
    NSLog(@"数组中最后一个元素：%@",[self lastObject]);
    return [self lastObject];
}

- (NSString *)anFirstObject {
    NSLog(@"数组中第一个元素：%@",[self firstObject]);
    return [self firstObject];
}

+ (NSArray *)arrayWithString:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@"[" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"]" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSArray *array = [NSArray arrayWithArray:[string componentsSeparatedByString:@","]];
//    // 如果前后都存在双引号,就祛除前后的双引号
//    [array enumerateObjectsUsingBlock:^(NSString * _Nonnull str, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSMutableString *tempStr = [[NSMutableString alloc] initWithString:str];
//        if ([str hasPrefix:@"\""] && [str hasSuffix:@"\""]) {
//            [tempStr deleteCharactersInRange:NSMakeRange(0, 1)];
//            [tempStr deleteCharactersInRange:NSMakeRange(tempStr.length - 1, 1)];
//        }
//        str = tempStr;
//    }];
    
    return array;
}

- (NSString *)toString
{
    NSMutableString *arrayStr = [NSMutableString stringWithFormat:@"["];
    [self enumerateObjectsUsingBlock:^(id str, NSUInteger idx, BOOL *stop){
        if (idx == self.count - 1) {
            [arrayStr appendFormat:@"%@", str];
        } else {
            [arrayStr appendFormat:@"%@,", str];
        }
    }];
    [arrayStr appendString:@"]"];
    return arrayStr;
}

+ (NSArray *)arrayWithString:(NSString *)string deleteSpace:(BOOL)deleteSpace
{
    string = [string stringByReplacingOccurrencesOfString:@"[" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"]" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    if (deleteSpace) {
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    NSArray *array = [NSArray arrayWithArray:[string componentsSeparatedByString:@","]];
    return array;
}

@end
