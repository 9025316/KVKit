//
//  NSMutableArray+Category.m
//  XMC25
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "NSMutableArray+Category.h"
#import "NSArray+Category.h"

@implementation NSMutableArray (Category)

- (void)addArrayFormeArray:(NSArray *)Array {
    //给数组中添加一个对象，会在数组中生成一个新数组，再将对象放进新的数组中
    [self addObject:Array];
}

- (void)addObjectFormObject:(id)objects {
    //给数组添加一个对象
    [self addObjectsFromArray:objects];
}

- (void)removeFormArrayLastObject {
    NSLog(@"被删除的最后一个元素：%@",[self lastObject]);
    [self removeLastObject];
}

- (void)removeFormArrayFirstObject {
    NSLog(@"被删除的第一个元素：%@",[self firstObject]);
    [self removeObjectAtIndex:1];
}

- (void)removeArrayWithObject:(id)anObject {
    if ([self containsObject:anObject]) {
        NSLog(@"被删除的对象：%@",anObject);
        [self removeObject:anObject];
    } else {
        NSLog(@"无法删除，数组中无法找到该对象");
    }
    
}

- (void)exchangeArrayWithObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 {
    [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}

@end
