//
//  UINavigationBar+Extension.h
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/9.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  此分类增加了一些关于UINavigationBar的有用方法
 */
@interface UINavigationBar (Extension)

/**
 *  设置UINavigationBar是否透明
 *
 *  @param transparent YES透明，NO不透明
 */
- (void)lz_isRetinasetTransparent:(BOOL)transparent;

/**
 *  设置UINavigationBar是否透明、半透明
 *
 *  @param transparent YES透明，NO不透明
 *  @param translucent 一个决定UINavigationBar是否半透明的Boolean值参数
 */
- (void)lz_isRetinasetTransparent:(BOOL)transparent translucent:(BOOL)translucent;

@end
