//
//  DateAndString.m
//  CourseSystem
//
//  Created by chenghong on 13-12-4.
//  Copyright (c) 2013年 oraro. All rights reserved.
//

#import "DateAndString.h"

@interface DateAndString()


@end

@implementation DateAndString


// 获取星期
+(int )weekStrFrom:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    
//    return week;
    return [DateAndString week:week];
}

+(int)week:(NSInteger)week
{
    int weekStr;
    if(week==1)
    {
        weekStr=7;
    }
    else if(week==2)
    {
        weekStr = 1;
        
    }
    else if(week==3)
    {
        weekStr=2;
        
    }
    else if(week==4)
    {
        weekStr=3;
        
    }
    else if(week==5)
    {
        weekStr=4;
        
    }
    else if(week==6)
    {
        weekStr=5;
        
    }
    else if(week==7)
    {
        weekStr=6;
        
    }
    
    return weekStr;
}

+(NSArray *)searchTimes
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"searchtime" ofType:@"plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:path];
    return array;
}

//将str格式的日期转换为date格式
+ (NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [dateFormatter setTimeZone:timeZone];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    
    return destDate;
}


//将str格式的日期转换为date格式
+ (NSDate *)dateFromString:(NSString *)dateString andFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [dateFormatter setTimeZone:timeZone];
    
    [dateFormatter setDateFormat:format];
    
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    
    return destDate;
}
//将date格式的日期转化为str
+ (NSString *)strFromeDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

//以想要的格式返回str类型的时间
+ (NSString *)strFromeDate:(NSDate *)date witFormat:(NSString *)formatStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatStr];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

//判断两个是时间差
+(NSInteger)differenceFrom:(NSDate *)dataone and:(NSDate *)datatwo
{
    NSDate *newDate = [dataone initWithTimeInterval:24*60*60 sinceDate:dataone];
    NSTimeInterval time = [newDate timeIntervalSinceDate:datatwo];
    NSInteger day = time / (60*60*24);
    
    day = day + 1;
    
    return day;
}

+(CGFloat)timedifferenceFrom:(NSDate *)dataone and:(NSDate *)datatwo
{
    
    NSDate *newDate = [datatwo initWithTimeInterval:24*60*60 sinceDate:datatwo];
    NSTimeInterval time=[dataone timeIntervalSinceDate:newDate];
   
    return time;
}
@end
