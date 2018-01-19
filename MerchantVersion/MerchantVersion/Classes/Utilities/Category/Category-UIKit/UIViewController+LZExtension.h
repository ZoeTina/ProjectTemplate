//
//  UIViewController+LZExtension.h
//  LZKit
//
//  Created by 寕小陌 on 2017/7/17.
//  Copyright © 2017年 寕小陌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZNavigationBarConfigure.h"

extern NSString *const LZViewControllerPropertyChangedNotification;

// 交给单独控制器处理
@protocol LZViewControllerPushDelegate <NSObject>

@optional
- (void)pushToNextViewController;

@end

@interface UIViewController (LZExtension)

/** 是否禁止当前控制器的滑动返回(包括全屏返回和边缘返回) */
@property (nonatomic, assign) BOOL lz_interactivePopDisabled;

/** 是否禁止当前控制器的全屏滑动返回 */
@property (nonatomic, assign) BOOL lz_fullScreenPopDisabled;

/** 全屏滑动时，滑动区域距离屏幕左边的最大位置，默认是0：表示全屏都可滑动 */
@property (nonatomic, assign) CGFloat lz_popMaxAllowedDistanceToLeftEdge;

/** 设置导航栏的透明度 */
@property (nonatomic, assign) CGFloat lz_navBarAlpha;

/** 设置状态栏类型 */
@property (nonatomic, assign) UIStatusBarStyle lz_statusBarStyle;

/** 设置状态栏是否显示(default is NO 即不隐藏) */
@property (nonatomic, assign) BOOL lz_StatusBarHidden;

/** 设置返回按钮的类型 */
@property (nonatomic, assign) LZNavigationBarBackStyle lz_backStyle;

/** push代理 */
@property (nonatomic, assign) id<LZViewControllerPushDelegate> lz_pushDelegate;

/**
 返回显示的控制器
 */
- (UIViewController *)lz_visibleViewControllerIfExist;

@end
