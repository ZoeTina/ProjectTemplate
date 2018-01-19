//
//  NSDate+Extension.m
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

#pragma mark - 单例
+ (NSDateFormatter *)lz_sharedDateFormatter {
    static NSDateFormatter *dateFormatter;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    });
    
    return dateFormatter;
}

+ (NSCalendar *)lz_sharedCalendar {
    static NSCalendar *calendar;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendar = [NSCalendar currentCalendar];
    });
    
    return calendar;
}

#pragma mark - 日期方法

- (NSDateComponents *)lz_deltaFrom:(NSDate *)from {
    
    // 比较时间
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [[NSDate lz_sharedCalendar] components:unit fromDate:from toDate:self options:0];
}

- (BOOL)lz_isThisYear {
    NSDate *now = [NSDate date];
    
    NSInteger nowYear = [[NSDate lz_sharedCalendar] component:NSCalendarUnitYear fromDate:now];
    NSInteger selfYear = [[NSDate lz_sharedCalendar] component:NSCalendarUnitYear fromDate:self];
    
    return nowYear == selfYear;
}

- (BOOL)lz_isThisDay {
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *nowCmps = [[NSDate lz_sharedCalendar] components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [[NSDate lz_sharedCalendar] components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year
    && nowCmps.month == selfCmps.month
    && nowCmps.day == selfCmps.day;
}

- (BOOL)lz_isTomorrowDay {
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *nowCmps = [[NSDate lz_sharedCalendar] components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [[NSDate lz_sharedCalendar] components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year
    && nowCmps.month == selfCmps.month
    && nowCmps.day  < selfCmps.day;
}

- (BOOL)lz_isYesterday {
    [NSDate lz_sharedDateFormatter].dateFormat = @"yyyy-MM-dd";
    
    NSDate *nowDate = [[NSDate lz_sharedDateFormatter] dateFromString:[[NSDate lz_sharedDateFormatter] stringFromDate:[NSDate date]]];
    NSDate *selfDate = [[NSDate lz_sharedDateFormatter] dateFromString:[[NSDate lz_sharedDateFormatter] stringFromDate:self]];
    
    NSDateComponents *cmps = [[NSDate lz_sharedCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}

+ (NSString *)lz_dateStringWithDelta:(NSTimeInterval)delta {
    [self lz_sharedDateFormatter].dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:delta];
    
    return [[self lz_sharedDateFormatter] stringFromDate:date];
}

+(NSDate*)lz_dateStringToDate:(NSString*)timeString formatter:(NSString*)formatter{
    if (timeString.length == 0) return nil;
    
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:formatter];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formater setTimeZone:timeZone];
    NSDate* date = [formater dateFromString:timeString];
    return date;
    
}

+(double)lz_dateToTimeStamp:(NSDate*) formatTime format:(NSString*)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss")
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSInteger timeSp = [[NSNumber numberWithDouble:[formatTime timeIntervalSince1970]] integerValue];
    return timeSp;
}
+(NSDate* _Nullable)lz_timeStampToData:(double)timestamp format:(NSString* _Nullable)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    return confromTimesp;
}

+(nonnull NSString*)lz_dateToStringTime:(NSDate* _Nullable) formatTime format:(NSString* _Nullable)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSString *confromTimespStr = [formatter stringFromDate:formatTime];
    return confromTimespStr;
}
+(nonnull NSString*)lz_stringTimeToString:(NSString* _Nullable) formatTime format:(NSString* _Nullable)format{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDate *date = [NSDate lz_dateStringToDate:formatTime formatter:format];
    // 话说在真机上需要设置区域，才能正确获取本地日期，天朝代码:zh_CN
    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    switch (week) {
        case 1:
            return @"周日";
            break;
        case 2:
            return @"周一";
            break;
        case 3:
            return @"周二";
            break;
        case 4:
            return @"周三";
            break;
        case 5:
            return @"周四";
            break;
        case 6:
            return @"周五";
            break;
        case 7:
            return @"周六";
            break;
            
        default:
            break;
    }
    return @"";
}


- (NSDateComponents * _Nonnull)lz_deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

- (NSString *)lz_dateDescription {
    
    // 1. 获取当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 2. 判断是否是今天
    if ([calendar isDateInToday:self]) {
        
        NSInteger interval = ABS((NSInteger)[self timeIntervalSinceNow]);
        
        if (interval < 60) {
            return @"刚刚";
        }
        interval /= 60;
        if (interval < 60) {
            return [NSString stringWithFormat:@"%zd 分钟前", interval];
        }
        
        return [NSString stringWithFormat:@"%zd 小时前", interval / 60];
    }
    
    // 3. 昨天
    NSMutableString *formatString = [NSMutableString stringWithString:@" HH:mm"];
    if ([calendar isDateInYesterday:self]) {
        [formatString insertString:@"昨天" atIndex:0];
    } else {
        [formatString insertString:@"MM-dd" atIndex:0];
        
        // 4. 是否当年
        NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:self toDate:[NSDate date] options:0];
        
        if (components.year != 0) {
            [formatString insertString:@"yyyy-" atIndex:0];
        }
    }
    
    // 5. 转换格式字符串
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    fmt.dateFormat = formatString;
    
    return [fmt stringFromDate:self];
}


//diff  这个就是相差时间秒 。
//NSString *strTime1 = @"00:00:00";
//NSString *strTime2 = @"00:01:16";
//NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//[formatter setDateFormat:@"HH:mm:ss"];
//NSDate *date1 = [formatter dateFromString:strTime1];
//NSDate *date2 = [formatter dateFromString:strTime2];
//NSInteger diff= [date1 timeIntervalSinceDate:date2];

@end
