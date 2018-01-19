//
//  NSNumber+Extension.h
//  LZExtension
//
//  Created by 寕小陌 on 16/10/27.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

/**
 *  此分类增加了一些关于NSNumber的有用方法
 */
@interface NSNumber (Extension)

/**
 *  在指定范围内创建一个随机integer值
 *
 *  @param minValue 最小随机值
 *  @param maxValue 最大随机值
 *
 *  @return 返回被创建的随机值
 */
+ (NSInteger)lz_randomIntBetweenMin:(NSInteger)minValue
                             andMax:(NSInteger)maxValue;

/**
 *  创建一个随机的float值
 *
 *  @return 返回被创建的随机float值
 */
+ (CGFloat)lz_randomFloat;

/**
 *  在指定范围内创建一个随机float值
 *
 *  @param minValue 最小随机值
 *  @param maxValue 最大随机值
 *
 *  @return 返回被创建的随机值
 */
+ (CGFloat)lz_randomFloatBetweenMin:(CGFloat)minValue
                          andMax:(CGFloat)maxValue;

@end
