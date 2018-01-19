//
//  UIView+Runtime.h
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  此分类增加了一些关于UIView的有用方法
 */
@interface UIView (Runtime)

/// 查找子视图
///
/// @param view      要查找的视图
/// @param clazzName 子控件类名
///
/// @return 找到的第一个子视图
+ (UIView *)lz_firstInView:(UIView *)view clazzName:(NSString *)clazzName;

/// TODO: 可以抽取到 NSObject 分类中国年
/// 遍历当前视图的成员变量 - 仅供测试使用
- (void)lz_ivarsList;
// 提示，此处打断点，在控制台输入 po [self.pageControl lz_ivarsList] 可以查看所有成员变量
@end
