//
//  UIWebView+Extension.h
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  此分类增加了一些关于UIWebView的有用方法
 */
@interface UIWebView (Extension)

/**
 *  移除当前UIWebView的背景阴影
 */
- (void)lz_removeBackgroundShadow;

/**
 *  加载网址
 *
 *  @param website 需要加载的网址
 */
- (void)lz_loadWebsite:(NSString * _Nonnull)website;

@end
