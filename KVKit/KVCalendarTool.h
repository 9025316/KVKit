//
//  MYCalendarTool.h
//  HYCalendar
//
//  Created by why on 15/2/10.
//  Copyright (c) 2015年 nathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCalendarTool : NSObject

/** 返回今天日期 **/
+ (NSInteger)day:(NSDate *)date;
/** 返回这个月的月份 **/
+ (NSInteger)month:(NSDate *)date;
/**  返回这个月的月份 **/
+ (NSInteger)year:(NSDate *)date;
/**  返回这个月份有几天 **/
+ (NSInteger)returnThisMonthCountData:(NSDate *)date;
/** 获取某某年某某月的第一天是星期几 **/
+ (NSInteger)GetTheWeekOfDayByYera:(NSInteger)year
                        andByMonth:(NSInteger)month;
/** 获取月份第一天是星期几 **/
+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;
/**  返回这个月份总天数 **/
+ (NSInteger)totaldaysInMonth:(NSDate *)date;
/**  返回上一个月 **/
+ (NSDate *)lastMonth:(NSDate *)date;
/**  返回下一个月 **/
+ (NSDate*)nextMonth:(NSDate *)date;

@end
