//
//  NSDate+TimeCategory.m
//  LZExtension
//
//  Created by 寕小陌 on 2017/3/17.
//  Copyright © 2017年 寜小陌. All rights reserved.
//

#import "NSDate+TimeExtension.h"

static NSDateFormatter *dateFormatter;

@implementation NSDate (TimeExtension)


+(NSDateFormatter *)lz_defaultFormatter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc]init];
    });
    return dateFormatter;
}

/**
 *  字符串转NSDate
 *
 *  @param timeStr 字符串时间
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return return value description
 */
+ (NSDate *)lz_dateFromString:(NSString *)timeStr
                       format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [NSDate lz_defaultFormatter];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:timeStr];
    return date;
}

/**
 *  NSDate转时间戳
 *
 *  @param date 字符串时间
 *
 *  @return 返回时间戳
 */
+ (NSInteger)lz_timestampFromDate:(NSDate *)date
{
    return (long)[date timeIntervalSince1970];
}


/**
 *  字符串转时间戳
 *
 *  @param timeStr 字符串时间
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回时间戳的字符串
 */
+(NSInteger)lz_timestampFromString:(NSString *)timeStr
                            format:(NSString *)format
{
    NSDate *date = [NSDate lz_dateFromString:timeStr format:format];
    return [NSDate lz_timestampFromDate:date];
}

/**
 *  时间戳转字符串
 *
 *  @param timeStamp 时间戳
 *  @param format    转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)lz_dateStrFromCstampTime:(NSInteger)timeStamp
                        withDateFormat:(NSString *)format
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [NSDate lz_datestrFromDate:date withDateFormat:format];
}

/**
 *  NSDate转字符串
 *
 *  @param date   NSDate时间
 *  @param format 转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)lz_datestrFromDate:(NSDate *)date
                  withDateFormat:(NSString *)format
{
    NSDateFormatter* dateFormat = [NSDate lz_defaultFormatter];
    [dateFormat setDateFormat:format];
    return [dateFormat stringFromDate:date];
}

@end

