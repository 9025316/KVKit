//
//  MyCalendarItem.h
//  HYCalendar
//
//  Created by nathan on 14-9-17.
//  Copyright (c) 2014年 nathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVCalendarView : UIView

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, copy) void(^calendarBlock)(NSInteger day, NSInteger month, NSInteger year);

@property (nonatomic,strong)  NSMutableArray *signArray;

//今天
@property (nonatomic,strong)  UIButton *dayButton;


- (void)setStyle_Today_Signed:(UIButton *)btn;
- (void)setStyle_Today:(UIButton *)btn;

/* 
 
 CGSize size = [UIScreen mainScreen].bounds.size;
 
 // demo1
 KVCalendarView *calendarView = [[KVCalendarView alloc] init];
 calendarView.frame = CGRectMake(0, 30, size.width, 300);
 [self.view addSubview:calendarView];
 
 //设置已经签到的天数日期
 NSMutableArray* _signArray = [[NSMutableArray alloc] init];
 [_signArray addObject:@1];
 [_signArray addObject:@5];
 [_signArray addObject:@10];
 [_signArray addObject:@22];
 [_signArray addObject:@20];
 
 calendarView.signArray = _signArray;
 
 calendarView.date = [NSDate date];
 
 NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour) fromDate:[NSDate date]];
 //日期点击事件
 __weak typeof(KVCalendarView) *weakSelf = calendarView;
 calendarView.calendarBlock =  ^(NSInteger day, NSInteger month, NSInteger year){
 if ([comp day] == day) {
 NSLog(@"%li-%li-%li", year,month,day);
 //根据自己逻辑条件 设置今日已经签到的style 没有签到不需要写
 [weakSelf setStyle_Today_Signed:weakSelf.dayButton];
 }
 };
 
 // demo2
 //    KVCalendarView *calendarView2 = [[KVCalendarView alloc] init];
 //    calendarView2.frame = CGRectMake(10, 230, size.width-20, 200);
 //    [self.view addSubview:calendarView2];
 //
 //    calendarView2.date = [KVCalendarTool lastMonth:[NSDate date]]
 */
@end
