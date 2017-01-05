//
//  NSDictionary+Property.h
//  MyApp1
//
//  Created by MacBook Pro on 2016/26/6.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Property)

/** 根据字典生成model 属性 **/
- (void)createPropertyCode;

@end
