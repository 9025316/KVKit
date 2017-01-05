//
//  NSMutableArray+Category.h
//  XMC25
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (Category)

/**
 *  在数组中末尾添加一个数组对象
 */
- (void)addArrayFormeArray:(NSArray *)Array;


/**
 *  在数组中末尾添加任意对象
 */
- (void)addObjectFormObject:(id)objects;

/**
 *  删除数组中最后一个元素
 */
- (void)removeFormArrayLastObject;

/**
 *  删除数组中第一个元素
 */
- (void)removeFormArrayFirstObject;

/**
 *  删除数组中指定元素对象
 *
 *  @param anObject 指定元素对象
 */
- (void)removeArrayWithObject:(id)anObject;

/**
 *  交换数组中两个元素的位置
 *
 *  @param idx1 指定下标
 *  @param idx2 指定下标
 */
- (void)exchangeArrayWithObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;

@end
