//
//  UIImageView+Extension.h
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/9.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  此分类增加了一些关于UIImageView的有用方法
 */
@interface UIImageView (Extension)

/**
 *  根据指定image和frame创建一个UIImageView
 *
 *  @param image UIImageView image
 *  @param rect  UIImageView frame
 *
 *  @return 返回创建的UIImageView实例
 */
+ (instancetype _Nonnull)lz_initWithImage:(UIImage * _Nonnull)image
                                    frame:(CGRect)rect;

/**
 *  根据指定image、frame、center创建一个UIImageView
 *
 *  @param image  UIImageView image
 *  @param size   UIImageView size
 *  @param center UIImageView center
 *
 *  @return 返回创建的UIImageView实例
 */
+ (instancetype _Nonnull)lz_initWithImage:(UIImage * _Nonnull)image
                                     size:(CGSize)size
                                   center:(CGPoint)center;

/**
 *  根据指定image、center创建一个UIImageView
 *
 *  @param image  UIImageView image
 *  @param center UIImageView center
 *
 *  @return 返回创建的UIImageView实例
 */
+ (instancetype _Nonnull)lz_initWithImage:(UIImage * _Nonnull)image
                                   center:(CGPoint)center;

/**
 *  根据指定tintColor、image创建一个模板UIImageView
 *
 *  @param image     UIImageView image
 *  @param tintColor UIImageView tint color
 *
 *  @return 返回创建的UIImageView实例
 */
+ (instancetype _Nonnull)lz_initWithImageAsTemplate:(UIImage * _Nonnull)image
                                          tintColor:(UIColor * _Nonnull)tintColor;

/**
 *  创建一个有阴影效果
 *
 *  @param color   阴影的color(颜色)
 *  @param radius  阴影的radius(半径)
 *  @param offset  阴影的offset(偏移量)
 *  @param opacity S阴影的opacity(不透明度)
 */
- (void)lz_setImageShadowColor:(UIColor * _Nonnull)color
                        radius:(CGFloat)radius
                        offset:(CGSize)offset
                       opacity:(CGFloat)opacity;

/**
 *  减掉超出UIImage Bounds范围的部分
 *
 *  @param image The mask UIImage
 */
- (void)lz_setMaskImage:(UIImage * _Nonnull)image;



/**
 设置图片在父视图的中心

 @param size 子视图尺寸
 */
- (void)lz_setFrameInSuperViewCenterWithSize:(CGSize)size;


@end
