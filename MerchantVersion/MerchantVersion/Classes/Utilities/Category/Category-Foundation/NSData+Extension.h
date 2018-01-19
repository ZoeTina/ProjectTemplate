//
//  NSData+Extension.h
//  LZExtension
//
//  Created by 寕小陌 on 16/10/27.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  此分类增加了一些关于NSData的有用方法
 */
@interface NSData (Extension)
/**
 *  将给出的NSData数据转换为UTF8格式的字符串
 *
 *  @param data 需要被转换的NSData数据
 *
 *  @return 返回被转换为UTF8字符串格式的NSData数据
 */
+ (NSString * _Nonnull)lz_convertToUTF8String:(NSData * _Nonnull)data;

/**
 *  转换自身为UTF8格式字符串
 *
 *  @return 返回被转换为UTF8格式字符串的自身
 */
- (NSString * _Nonnull)lz_convertToUTF8String;

/**
 *  将给出的NSData数据转换为ASCII格式的字符串
 *
 *  @param data 需要被转换的NSData数据
 *
 *  @return 返回被转换为ASCII字符串格式的NSData数据
 */
+ (NSString * _Nonnull)lz_convertToASCIIString:(NSData * _Nonnull)data;

/**
 *  转换自身为ASCII格式字符串
 *
 *  @return 返回被转换为ASCII格式字符串的自身
 */
- (NSString * _Nonnull)lz_convertToASCIIString;

/**
 *  转换自己的UUID为字符串
 *  一般用于消息推送
 *
 *  @return 返回将UUID转换为字符串的本身
 */
- (NSString * _Nullable)lz_convertUUIDToString;

@end
