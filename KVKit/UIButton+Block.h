//
//  UIButton+Block.h
//  zcsdxc
//
//  Created by MacBook Pro on 17/1/13.
//  Copyright © 2017年 steven. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)();

@interface UIButton (Block)

@property (readonly) NSMutableDictionary *event;

- (void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end
