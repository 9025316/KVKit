//
//  NSObject+Category.m
//  Runtime
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>

@implementation NSNull (Catefory)
id dynamicMethodIMP(id self, SEL _cmd)
{
    printf("%s的%s方法没有找到，已返回空字符串 \n",class_getName([self class]), sel_getName(_cmd)); 
    return @"";
}
+ (BOOL) resolveInstanceMethod:(SEL)aSEL
{
    if (aSEL == @selector(objectForKey:))
    {
        // 为NSNull动态添加objectForKey:方法
        class_addMethod([NSNull class], aSEL, (IMP) dynamicMethodIMP, "v@:");
        return YES;
    }
    else if(aSEL == @selector(objectForKeyedSubscript:))
    {
        // 为NSNull动态添加objectForKeyedSubscript:方法
        class_addMethod([NSNull class], aSEL, (IMP) dynamicMethodIMP, "v@:");
        return YES;
    }
    else if(aSEL == @selector(count))
    {
        // 为NSNull动态添加count方法
        class_addMethod([NSNull class], aSEL, (IMP) dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}
@end

@implementation NSString (Catefory)
id dynamicMethodIMP2(id self, SEL _cmd)
{
    printf("%s的%s方法没有找到，已返回空字符串 \n",class_getName([self class]), sel_getName(_cmd));
    return @"";
}
+ (BOOL) resolveInstanceMethod:(SEL)aSEL
{
    if (aSEL == @selector(objectForKey:))
    {
        // 为NSString动态添加objectForKey:方法
        class_addMethod([NSString class], aSEL, (IMP) dynamicMethodIMP2, "v@:");
        return YES;
    }
    else if(aSEL == @selector(objectForKeyedSubscript:))
    {
        // 为NSString动态添加objectForKeyedSubscript:方法
        class_addMethod([NSString class], aSEL, (IMP) dynamicMethodIMP2, "v@:");
        return YES;
    }
    else if(aSEL == @selector(count))
    {
        // 为NSString动态添加count方法
        class_addMethod([NSString class], aSEL, (IMP) dynamicMethodIMP2, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}
+ (void)load
{
    Method otherMethod = class_getInstanceMethod(NSClassFromString(@"__NSCFConstantString"), @selector(substringFromIndex:));
    Method originMethod = class_getInstanceMethod(NSClassFromString(@"__NSCFConstantString"), @selector(cfl_substringFromIndex:));
    method_exchangeImplementations(otherMethod, originMethod);
}
- (void)cfl_substringFromIndex:(int)index
{
    if(index > self.length)
    {
        NSLog(@"字符串(substringFromIndex)下标越界");
        return [self cfl_substringFromIndex:(int)self.length];
    }
    return [self cfl_substringFromIndex:index];
}
@end

@implementation UIFont (Catefory)
id dynamicMethodIMP3(id self, SEL _cmd)
{
    printf("%s的%s方法没有找到，已返回空字符串 \n",class_getName([self class]), sel_getName(_cmd));
    return @"";
}
+ (BOOL) resolveInstanceMethod:(SEL)aSEL
{
    if (aSEL == @selector(setTag:))
    {
        // 为NSNull动态添加objectForKey:方法
        class_addMethod([UIFont class], aSEL, (IMP) dynamicMethodIMP3, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}
@end

@implementation NSMutableDictionary (Catefory)
+ (void)load
{
    Method ofkMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKey:));
    Method newOfkMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(cfl_setObject:forKey:));
    method_exchangeImplementations(ofkMethod, newOfkMethod);
}

- (void)cfl_setObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if(aKey == nil)
    {
        NSLog(@"----NSMutableDictionary的Key为nil");
        return;
    }
    if(anObject == nil)
    {
        NSString *str = [NSString stringWithFormat:@"----NSMutableDictionary(%@)的Value为nil",aKey];
        NSLog(@"%@",str);
        return;
    }
    [self cfl_setObject:anObject forKey:aKey];
}
@end

@implementation NSObject (Category)

+(void)swizzleInstanceMethod:(Class)class otherSelector:(SEL)otherSelector originSelector:(SEL)originSelector
{
    Method otherMethod = class_getInstanceMethod(class, otherSelector);
    Method originMethod  = class_getInstanceMethod(class, originSelector);
    method_exchangeImplementations(otherMethod, originMethod);
}

+(void)swizzleClassMethod:(Class)class otherSelector:(SEL)otherSelector originSelector:(SEL)originSelector
{
    Method otherMethod = class_getClassMethod(class, otherSelector);
    Method originMethod  = class_getClassMethod(class, originSelector);
    method_exchangeImplementations(otherMethod, originMethod);
}
@end

@implementation NSArray (Category)

/**
 * 第一次初始化这个累加载到内存中调用
 */
+(void)load
{
    // NSArray真实的对象是__NSArrayI,属于NSArray的子类
    // 获取NSArray的objectAtIndex:方法
    Method otherMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    // 获取自定义的方法
    Method originMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(cfl_objectAtIndex:));
    // 交换
    method_exchangeImplementations(otherMethod, originMethod);
    
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArray0") otherSelector:@selector(objectAtIndex:) originSelector:@selector(cfl_objectAtIndex2:)];
}

/**
 * 下标越界
 */
-(id) cfl_objectAtIndex:(NSUInteger) index
{
    if(index < self.count)
    {
        // 方法已交互，所以cfl_objectAtIndex相当于原始的objectAtIndex
        return [self cfl_objectAtIndex:index];
    }
    else
    {
        NSString *str = [NSString stringWithFormat:@"NSArray(objectAtIndex)下标越界:count(%ld) index(%ld)", (long)self.count, (long)index];
        NSLog(@"%@",str);
        return nil;
    }
}
-(id) cfl_objectAtIndex2:(NSUInteger) index
{
    if(index < self.count)
    {
        // 方法已交互，所以cfl_objectAtIndex相当于原始的objectAtIndex
        return [self cfl_objectAtIndex:index];
    }
    else
    {
        NSString *str = [NSString stringWithFormat:@"NSArray(objectAtIndex)下标越界:count(%ld) index(%ld)", (long)self.count, (long)index];
        NSLog(@"%@",str);
        return nil;
    }
}
@end

@implementation NSMutableArray (Category)

+(void)load
{
    
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") otherSelector:@selector(objectAtIndex:) originSelector:@selector(cfl_objectAtIndex:)];
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") otherSelector:@selector(addObject:) originSelector:@selector(cfl_addObject:)];
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") otherSelector:@selector(removeObjectAtIndex:) originSelector:@selector(cfl_removeObjectAtIndex:)];
//    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") otherSelector:@selector(insertObject:atIndex:) originSelector:@selector(cfl_insertObject:atIndex:)];
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") otherSelector:@selector(removeObjectsInRange:) originSelector:@selector(cfl_removeObjectsInRange:)];
}
/**
 * 下标越界
 */
-(id) cfl_objectAtIndex:(NSUInteger) index
{
    if(index < self.count)
    {
        return [self cfl_objectAtIndex:index];
    }
    else
    {
        NSString *str = [NSString stringWithFormat:@"NSMutableArray(objectAtIndex)下标越界:count(%i) index(%i)",self.count, index];
        NSLog(@"%@",str);
        return nil;
    }
}
/**
 * 添加为空
 */
-(void) cfl_addObject:(id)object
{
    if(object != nil)
    {
        [self cfl_addObject:object];
    }
    else
    {
        NSLog(@"NSMutableArray添加了一个nil");
    }
}
/**
 * 通过下标删除时，越界
 */
-(void)cfl_removeObjectAtIndex:(int)index
{
    if(index < self.count)
    {
        [self cfl_removeObjectAtIndex:index];
    }
    else
    {
        NSString *str = [NSString stringWithFormat:@"NSMutableArray(removeObjectAtIndex)下标越界:count(%ld) index(%d)", self.count, index];
        NSLog(@"%@",str);
    }
}
-(void)cfl_removeObjectsInRange:(NSRange)range
{
    if(self.count < range.location + range.length)
    {
        NSString *info = [NSString stringWithFormat:@"NSMutableArray(removeObjectsInRange:)数组越界 count(%ld) location(%ld) length(%ld)", self.count, range.location, range.length];
        NSLog(@"%@",info);
    }
    else
    {
        [self cfl_removeObjectsInRange:range];
    }
}
/**
 * 插入一个空对象
 */
- (void)cfl_insertObject:(id)object atIndex:(NSUInteger)index
{
    if(object == nil)
    {
        NSLog(@"NSMutableArray(insertObject:atIndex:)插入空对象");
        return;
    }
    [self cfl_insertObject:object atIndex:index];
}
@end
