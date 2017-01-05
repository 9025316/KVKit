//
//  MYCalendarTool.m
//  HYCalendar
//
//  Created by why on 15/2/10.
//  Copyright (c) 2015年 nathan. All rights reserved.
//

#import "KVCalendarTool.h"

@implementation KVCalendarTool

/** 返回今天日期 **/
+ (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitDay) fromDate:date];
    return [components day];
}

/** 返回这个月的月份 **/
+ (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitMonth) fromDate:date];
    return [components month];
}

/**  返回这个月的月份 **/
+ (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear) fromDate:date];
    return [components year];
}

+ (NSInteger)returnThisMonthCountData:(NSDate *)date{
//    NSDate *today = [NSDate date]; //Get a date object for today's date
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange days = [calendar rangeOfUnit:NSDayCalendarUnit
                           inUnit:NSMonthCalendarUnit
                          forDate:date];
    
    return days.length;
}

#pragma mark -返回日历天数函数
+ (int)getDays:(NSInteger )year and:(NSInteger)day{
    int times [] = {31,28,31,30,31,30,31,31,30,31,30,31};
    if ((year%4==0&&year%100!=0)||year%400==0) {
        times[1] = 29;
    }
    return (times[day-1]);
}

//获取某某年某某月的第一天是星期几
+ (NSInteger)GetTheWeekOfDayByYera:(NSInteger)year
                 andByMonth:(NSInteger)month{
    NSInteger sum = 0;
    for(int i = 1;i<month;i++){
        sum+=[self getDays:year and:i];
    }
    NSInteger nedDay = sum+1;
    
    return ((year-1)+(year-1)/4 -(year/100)+(year/400)+nedDay)%7;
    
}


+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

+ (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInOfMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInOfMonth.length;
}

+ (NSDate *)lastMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

+ (NSDate*)nextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

@end
