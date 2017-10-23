//
//  DateAndString.h
//  CourseSystem
//
//  Created by chenghong on 13-12-4.
//  Copyright (c) 2013年 oraro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateAndString : NSObject

//将str格式的日期转换为date格式
+ (NSDate *)dateFromString:(NSString *)dateString;

//将date格式的日期转化为str
+ (NSString *)strFromeDate:(NSDate *)date;

//以特定的格式string化Date
+ (NSString *)strFromeDate:(NSDate *)date witFormat:(NSString *)formatStr;

//时间差
+(NSInteger)differenceFrom:(NSDate *)dataone and:(NSDate *)datatwo;

// 获取星期
+(int)weekStrFrom:(NSDate *)date;

+ (NSArray *)searchTimes;

+(CGFloat)timedifferenceFrom:(NSDate *)dataone and:(NSDate *)datatwo;

+ (NSDate *)dateFromString:(NSString *)dateString andFormat:(NSString *)format;
@end
