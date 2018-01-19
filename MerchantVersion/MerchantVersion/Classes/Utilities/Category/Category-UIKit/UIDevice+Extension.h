//
//  UIDevice+Extension.h
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  此分类增加了一些关于UIDevice的有用方法
 */
@interface UIDevice (Extension)

/**
 *  返回设备平台字符串
 *  如:"iPhone7,2"
 *
 *  @return 返回设备平台字符串
 */
+ (NSString * _Nonnull)lz_devicePlatform;
/**
 *  返回可读的设备平台字符串
 *  如:"iPad Air (Cellular)"
 *
 *  @return 返回可读的设备平台字符串
 */
+ (NSString * _Nonnull)lz_devicePlatformString;

/**
 *  检查当前设备是否是iPad
 *
 *  @return 返回YES是iPad，NO不是
 */
+ (BOOL)lz_isiPad;

/**
 *  检查当前设备是否是iPhone
 *
 *  @return 返回YES是iPhone，NO不是
 */
+ (BOOL)lz_isiPhone;

/**
 *  检查当前设备是否是iPod
 *
 *  @return 返回YES是iPod，NO不是
 */
+ (BOOL)lz_isiPod;

/**
 *  检查当前设备是否是Apple TV
 *
 *  @return 返回YES是Apple TV，NO不是
 */
+ (BOOL)lz_isAppleTV;

/**
 *  检查当前设备是否是Apple Watch
 *
 *  @return 返回YES是Apple Watch，NO不是
 */
+ (BOOL)lz_isAppleWatch;

/**
 *  检查当前设备是否是模拟器
 *
 *  @return 返回YES是模拟器，NO不是
 */
+ (BOOL)lz_isSimulator;

/**
 *  返回当前iOS版本号(不包含子版本号)
 *  如:7
 *
 *  @return 返回当前iOS版本号
 */
+ (NSInteger)lz_iOSVersion;

/**
 *  返回当前设备CPU频率
 *
 *  @return 返回当前设备CPU频率
 */
+ (NSUInteger)lz_cpuFrequency;

/**
 *  返回当前设备BUS频率
 *
 *  @return 返回当前设备BUS频率
 */
+ (NSUInteger)lz_busFrequency;

/**
 *  返回当前设备RAM大小
 *
 *  @return 返回当前设备RAM大小
 */
+ (NSUInteger)lz_ramSize;

/**
 *  返回当前设备CPU数量
 *
 *  @return 返回当前设备CPU数量
 */
+ (NSUInteger)lz_cpuNumber;

/**
 *  返回当前设备总内存
 *
 *  @return 返回当前设备总内存
 */
+ (NSUInteger)lz_totalMemory;

/**
 *  返回当前设备内核内存
 *
 *  @return 返回当前设备内核内存
 */
+ (NSUInteger)lz_userMemory;

/**
 *  返回当前设备总沙盒空间
 *
 *  @return 返回当前设备总沙盒空间
 */
+ (NSNumber * _Nonnull)lz_totalDiskSpace;

/**
 *  返回当前设备可用沙盒空间
 *
 *  @return 返回当前设备可用沙盒空间
 */
+ (NSNumber * _Nonnull)lz_freeDiskSpace;

@end
