//
//  MyCalendarItem.m
//  HYCalendar
//
//  Created by nathan on 14-9-17.
//  Copyright (c) 2014年 nathan. All rights reserved.
//

#import "KVCalendarView.h"
#import "KVCalendarTool.h"

#define COUNTDATAS 42
@implementation KVCalendarView
{
    UIButton  *_selectButton;
    NSMutableArray *_daysArray;
    
    NSInteger _row;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _row = 8;
        
        [self getSalcClenderRows];
        
        if (frame.size.width == 0 || frame.size.width == 0) {
            
            CGSize size = [UIScreen mainScreen].bounds.size;
            
            CGFloat hight = [[UIDevice currentDevice].model hasSuffix:@"iPad"] ? 60.0 : 40.0;
            self.frame = CGRectMake(0, 64, size.width, hight * _row);
        }
        
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        self.clipsToBounds = YES;
        
        _daysArray = [NSMutableArray arrayWithCapacity:COUNTDATAS];
        
        for (int i = 0; i < COUNTDATAS; i++) {
            
            UIButton *button = [[UIButton alloc] init];
            
            [self addSubview:button];
            
            [_daysArray addObject:button];
        }
    }
    return self;
}

- (void)getSalcClenderRows {
    
    NSInteger count = [KVCalendarTool returnThisMonthCountData:[NSDate date]];
    
    NSInteger we = [KVCalendarTool GetTheWeekOfDayByYera:[KVCalendarTool year:[NSDate date]] andByMonth:[KVCalendarTool month:[NSDate date]]];
    
    if (count == 31 && we <= 4)      _row = 7;
    else if (count == 30 && we <= 5) _row = 7;
    else if (count == 28 && we <= 6) _row = 7;
}

#pragma mark - create View
- (void)setDate:(NSDate *)date{
    
    _date = date;
    
    [self createCalendarViewWith:date];
}

- (void)createCalendarViewWith:(NSDate *)date{

    CGFloat itemW     = self.frame.size.width / 7;
    
    if (_row == 0) _row = 8;
    CGFloat itemH     = self.frame.size.height / _row;
    
    // 1.year month
    UILabel *headlabel = [[UILabel alloc] init];
    headlabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    headlabel.text     = [NSString stringWithFormat:@"%li年-%li月",[KVCalendarTool year:date],[KVCalendarTool month:date]];
    headlabel.font     = [UIFont systemFontOfSize:18];
    headlabel.frame           = CGRectMake(0, 0, self.frame.size.width, itemH);
    headlabel.textAlignment   = NSTextAlignmentCenter;
    [self addSubview:headlabel];
    
    // 2.weekday
    NSArray *array = @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
    UIView *weekBg = [[UIView alloc] init];
    weekBg.backgroundColor = [UIColor orangeColor];
    weekBg.frame = CGRectMake(0, CGRectGetMaxY(headlabel.frame), self.frame.size.width, itemH);
    [self addSubview:weekBg];
    
    for (int i = 0; i < array.count; i++) {
        UILabel *week = [[UILabel alloc] init];
        week.text     = array[i];
        week.font     = [UIFont systemFontOfSize:18];
        week.frame    = CGRectMake(itemW * i, 0, itemW, itemH);
        week.textAlignment   = NSTextAlignmentCenter;
        week.backgroundColor = [UIColor clearColor];
        week.textColor       = [UIColor whiteColor];
        [weekBg addSubview:week];
    }
    
    //  3.days (1-31)
    for (int i = 0; i < COUNTDATAS; i++) {
        
        int x = (i % 7) * itemW ;
        int y = (i / 7) * itemH + CGRectGetMaxY(weekBg.frame);
        
        UIButton *dayButton = _daysArray[i];
        dayButton.frame = CGRectMake(x, y, itemW, itemH);
        dayButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
        dayButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [dayButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [dayButton addTarget:self action:@selector(logDate:) forControlEvents:UIControlEventTouchUpInside];
        
        NSInteger daysInLastMonth = [KVCalendarTool totaldaysInMonth:[KVCalendarTool lastMonth:date]];
        NSInteger daysInThisMonth = [KVCalendarTool totaldaysInMonth:date];
        NSInteger firstWeekday    = [KVCalendarTool firstWeekdayInThisMonth:date];
        
        NSInteger day = 0;
        
        
        if (i < firstWeekday) {
            day = daysInLastMonth - firstWeekday + i + 1;
            [self setStyle_BeyondThisMonth:dayButton];
            
        }else if (i > firstWeekday + daysInThisMonth - 1){
            day = i + 1 - firstWeekday - daysInThisMonth;
            [self setStyle_BeyondThisMonth:dayButton];
            
        }else{
            day = i - firstWeekday + 1;
            [self setStyle_AfterToday:dayButton];
        }
        
        [dayButton setTitle:[NSString stringWithFormat:@"%li", day] forState:UIControlStateNormal];
        
        // this month
        if ([KVCalendarTool month:date] == [KVCalendarTool month:[NSDate date]]) {
            
            NSInteger todayIndex = [KVCalendarTool day:date] + firstWeekday - 1;
            
            if (i < todayIndex && i >= firstWeekday) {
                [self setStyle_BeforeToday:dayButton];
                [self setSign:i andBtn:dayButton];
            }else if(i ==  todayIndex){
                [self setStyle_Today:dayButton];
                _dayButton = dayButton;
            }
        }
    }
}


#pragma mark 设置已经签到
- (void)setSign:(int)i andBtn:(UIButton*)dayButton{
    
    __weak typeof(KVCalendarView) *weakSelf = self;
    
    [_signArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        int now = i-4+1;
        int now2 = [obj intValue];
        if (now2 == now) {
            [weakSelf setStyle_SignEd:dayButton];
        }
    }];
}


#pragma mark - output date
-(void)logDate:(UIButton *)dayBtn
{
    _selectButton.selected = NO;
    dayBtn.selected = YES;
    _selectButton = dayBtn;
    
    NSInteger day = [[dayBtn titleForState:UIControlStateNormal] integerValue];
    
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:self.date];
    
    if (self.calendarBlock) self.calendarBlock(day, [comp month], [comp year]);
}


#pragma mark - date button style
//设置不是本月的日期字体颜色   ---白色  看不到
- (void)setStyle_BeyondThisMonth:(UIButton *)btn
{
    btn.enabled = NO;
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}

//这个月 今日之前的日期style
- (void)setStyle_BeforeToday:(UIButton *)btn
{
    btn.enabled = NO;
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
}


//今日已签到
- (void)setStyle_Today_Signed:(UIButton *)btn
{
    btn.enabled = YES;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [btn setBackgroundColor:[UIColor orangeColor]];
}

//今日没签到
- (void)setStyle_Today:(UIButton *)btn
{
     btn.enabled = YES;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [btn setBackgroundColor:[UIColor redColor]];
}

//这个月 今天之后的日期style
- (void)setStyle_AfterToday:(UIButton *)btn
{
    btn.enabled = YES;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}


//已经签过的 日期style
- (void)setStyle_SignEd:(UIButton *)btn
{
    btn.enabled = YES;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [btn setBackgroundColor:[UIColor grayColor]];
}

@end
