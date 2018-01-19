//
//  NSObject+Extension.h
//  LZExtension
//
//  Created by 寕小陌 on 16/10/27.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  此分类增加了一些关于NSObject的有用方法
 */
@interface NSObject (Extension)

/**
 *  检查对象是否可用(不为nil或null)
 *
 *  @return YES可用，NO不可用
 */
- (BOOL)lz_isValid;

@end
