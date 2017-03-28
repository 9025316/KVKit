//
//  UIView+Tools.m
//  VideoRecord
//
//  Created by Hanwen on 16/7/28.
//  Copyright (c) 2016年 Kevin. All rights reserved.
//

#import "UIView+Tools.h"

@implementation UIView (Tools)

-(void)makeCornerRadius:(float)radius borderColor:(UIColor *)bColor borderWidth:(float)bWidth{
    
    self.layer.borderWidth = bWidth;
    
    if (bColor != nil) self.layer.borderColor = bColor.CGColor;
    
    if (radius > 0) {
        
        self.layer.cornerRadius = radius;
        
        self.layer.masksToBounds = YES;
    }
}

+ (instancetype)viewWithFrame:(CGRect)frame {
    
    UIView *view = nil;
    
    if (!view) view = [[[self class] alloc] initWithFrame:frame];
    
    return view;
}

+ (instancetype)XIBWithFrame:(CGRect)frame {
    
    NSString *className = NSStringFromClass(self);
    
    UIView *xibView = [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil] firstObject];
    
    xibView.frame = frame;
    
    if(xibView == nil){
        
        NSLog(@"CoreXibView：从xib创建视图失败，当前类是：%@",className);
    }
    return xibView;
}

- (void)addSubviewsWithArray:(NSArray *)subViews {
    
    for (UIView *view in subViews) {
        
        [self addSubview:view];
    }
}

+ (void)removeViews:(NSArray *)views {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        for (UIView *view in views) {
            
            [view removeFromSuperview];
        }
    });
}

- (void)removeAllSubviews {
    
    [self.subviews enumerateObjectsUsingBlock:^( UIView *obj, NSUInteger idx, BOOL *stop) {
        
        [obj removeFromSuperview];
    }];
}

- (UIViewController *)viewcontroller{
    
    //---取代下一个响应者
    UIResponder *next  = self.nextResponder;
    do{
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
            break;
        }
        //---去下一个响应者
        next = next.nextResponder;
    }while (next != nil);
    
    return nil;
}

@end
