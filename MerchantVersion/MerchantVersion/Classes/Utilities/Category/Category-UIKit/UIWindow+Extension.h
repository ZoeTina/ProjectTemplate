//
//  UIWindow+CMKit.h
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  此分类增加了一些关于UIWindow的有用方法
 */
@interface UIWindow (Extension)

/**
 *  获取当前window的屏幕截图，不保存至照片专辑中
 *
 *  @return 返回UIImage格式的屏幕截图
 */
- (UIImage * _Nonnull)lz_takeScreenshot;

/**
 *  获取当前window的屏幕截图，并选择是否保存至照片专辑中
 *
 *  @param save YES保存，NO不保存
 *
 *  @return 返回UIImage格式的屏幕截图
 */
- (UIImage * _Nonnull)lz_takeScreenshotAndSave:(BOOL)save;

/**
 *  获取当前window的屏幕截图，并选择是否保存至照片专辑中且延时多久保存
 *
 *  @param delay      延时时间(单位为秒)
 *  @param save       YES保存，NO不保存
 *  @param completion 完成保存后的回调
 */
- (void)lz_takeScreenshotWithDelay:(CGFloat)delay save:(BOOL)save completion:(void (^ _Nullable)(UIImage * _Nonnull screenshot))completion;

@end
