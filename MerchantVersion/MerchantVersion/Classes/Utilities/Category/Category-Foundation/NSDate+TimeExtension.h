//
//  NSDate+TimeCategory.h
//  LZExtension
//
//  Created by 寕小陌 on 2017/3/17.
//  Copyright © 2017年 寜小陌. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  此分类增加了一些关于NSDate的有用方法
 */
@interface NSDate (TimeExtension)

/**
 *  字符串转NSDate
 *
 *  @param timeStr 字符串时间
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return return value description
 */
+ (NSDate *)lz_dateFromString:(NSString *)timeStr
                       format:(NSString *)format;

/**
 *  NSDate转时间戳
 *
 *  @param date 字符串时间
 *
 *  @return 返回时间戳
 */
+ (NSInteger)lz_timestampFromDate:(NSDate *)date;

/**
 *  字符串转时间戳
 *
 *  @param timeStr 字符串时间
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回时间戳的字符串
 */
+(NSInteger)lz_timestampFromString:(NSString *)timeStr
                            format:(NSString *)format;


/**
 *  时间戳转字符串
 *
 *  @param timeStamp 时间戳
 *  @param format    转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)lz_dateStrFromCstampTime:(NSInteger)timeStamp
                        withDateFormat:(NSString *)format;

/**
 *  NSDate转字符串
 *
 *  @param date   NSDate时间
 *  @param format 转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)lz_datestrFromDate:(NSDate *)date
                  withDateFormat:(NSString *)format;
@end
