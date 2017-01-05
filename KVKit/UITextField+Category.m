//
//  UITextField+Category.m
//  mangotv
//
//  Created by Hanwen on 16/7/28.
//  Copyright (c) 2016年 Kevin. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)

- (void)textFieldLength:(int)length
{
    int kMaxLength = length;
    NSString *toBeString = self.text;
    NSString *lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage;// 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > kMaxLength) {
                self.text = [toBeString substringToIndex:kMaxLength];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (toBeString.length > kMaxLength) {
            self.text = [toBeString substringToIndex:kMaxLength];
        }
    }
}

@end
