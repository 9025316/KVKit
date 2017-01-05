//
//  NSArray+Category.h
//  WHWY_ONE_PIECE
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category)

/**
 *  判断数据中是否存在某个对象
 *
 *  @param anObject 传入需要判断的对象
 *
 *  @return 返回一个BOOL值
 */
- (BOOL)isHaveContainsObject:(id)anObject;

/**
 *  打印数组中的全部个数
 */
- (void)MGLogInfoArrayAllCount;

/**
 *  数组中最后一个元素
 *
 *  @return 返回数组最后一个元素内容
 */
- (NSString *)anLastObject;

/**
 *  数组中第一个元素
 *
 *  @return 返回数组第一个元素内容
 */
- (NSString *)anFirstObject;

/**
 *  提取字符串中的数组，例如：将"[1,3,45,45]"变成[1,3,45,45]
 */
+ (NSArray *)arrayWithString:(NSString *)string;

/**
 *  @author frank.chan, 15-11-29 15:11:40
 *
 *  将数组转成字符串
 *
 *  @return 字符串
 */
- (NSString *)toString;

/**
 *  @author XMC, 15-12-03 14:12:54
 *
 *  提取字符串中的数组,可选是否需要删除空格
 */
+ (NSArray *)arrayWithString:(NSString *)string deleteSpace:(BOOL)deleteSpace;

@end
