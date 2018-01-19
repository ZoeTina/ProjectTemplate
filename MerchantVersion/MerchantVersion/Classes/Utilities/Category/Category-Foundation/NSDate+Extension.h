//
//  NSDate+Extension.h
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  此分类增加了一些关于NSDate的有用方法
 *  注：(内部处理时间格式yyyy-MM-dd HH:mm:ss，若时间格式不一致，请到.m文件中自行修改)
 */
@interface NSDate (Extension)

#pragma mark - 单例
+ (nonnull NSDateFormatter *)lz_sharedDateFormatter;
+ (nonnull NSCalendar *)lz_sharedCalendar;

#pragma mark - 日期方法


/** 将字符串转成NSDate */
+(NSDate* _Nullable)lz_dateStringToDate:(nonnull NSString*)timeString
                              formatter:(nonnull NSString*)formatter;
/** 将NSDate转成时间戳 */
+(double)lz_dateToTimeStamp:(NSDate* _Nullable) formatTime
                     format:(NSString* _Nullable)format;
/** 将时间戳转成NSDate */
+(NSDate* _Nullable)lz_timeStampToData:(double) timestamp
                                format:(NSString* _Nullable)format;
/** 将NSDate转成标准字符串 */
+(nonnull NSString*)lz_dateToStringTime:(NSDate* _Nullable) formatTime
                                 format:(NSString* _Nullable)format;
/** 将字符串时间转成周末制 */
+(nonnull NSString*)lz_stringTimeToString:(NSString* _Nullable) formatTime
                                   format:(NSString* _Nullable)format;

/** 比较from和self的时间差值 */
- (NSDateComponents *_Nonnull)lz_deltaFrom:(NSDate *_Nullable)from;

/** 是否为今年 */
- (BOOL)lz_isThisYear;

/** 是否为昨天 */
- (BOOL)lz_isYesterday;

/** 是否为今天 */
- (BOOL)lz_isThisDay;

/** 是否为明天 */
- (BOOL)lz_isTomorrowDay;

/** 获得与当前时间的差距 */
- (NSDateComponents * _Nonnull)lz_deltaWithNow;

/// 返回指定时间差值的日期字符串
///
/// @param delta 时间差值
///
/// @return 日期字符串，格式：yyyy-MM-dd HH:mm:ss
+ (nonnull NSString *)lz_dateStringWithDelta:(NSTimeInterval)delta;

/// 日期描述字符串
///
/// 格式如下
///     -   刚刚(一分钟内)
///     -   X分钟前(一小时内)
///     -   X小时前(当天)
///     -   昨天 HH:mm(昨天)
///     -   MM-dd HH:mm(一年内)
///     -   yyyy-MM-dd HH:mm(更早期)
- (NSString *_Nonnull)lz_dateDescription;



@end
