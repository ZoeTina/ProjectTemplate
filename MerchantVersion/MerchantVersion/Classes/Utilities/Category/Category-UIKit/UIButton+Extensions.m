//
//  UIButton+CMKit.m
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import "UIButton+Extensions.h"
#import "UIImage+Extension.h"

@implementation UIButton (Extensions)

+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame {
    return [UIButton lz_initWithFrame:frame title:nil];
}

+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame title:(NSString * _Nullable)title {
    return [UIButton lz_initWithFrame:frame title:title backgroundImage:nil];
}

+ (instancetype _Nonnull )lz_initWithFrame:(CGRect)frame title:(NSString * _Nullable)title backgroundImage:(UIImage * _Nullable)backgroundImage {
    return [UIButton lz_initWithFrame:frame
                                title:title
                      backgroundImage:backgroundImage
           highlightedBackgroundImage:nil];
}

+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame title:(NSString * _Nullable)title backgroundImage:(UIImage * _Nullable)backgroundImage highlightedBackgroundImage:(UIImage * _Nullable)highlightedBackgroundImage {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
    
    return button;
}

+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame title:(NSString * _Nonnull)title color:(UIColor * _Nonnull)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [UIButton lz_initWithFrame:frame
                                title:title
                      backgroundImage:[UIImage lz_imageWithColor:color]
           highlightedBackgroundImage:[UIImage lz_imageWithColor:[UIColor colorWithRed:components[0]-0.1 green:components[1]-0.1 blue:components[2]-0.1 alpha:1]]];
}

+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame title:(NSString * _Nonnull)title color:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nonnull)highlightedColor {
    return [UIButton lz_initWithFrame:frame
                                title:title
                      backgroundImage:[UIImage lz_imageWithColor:color]
           highlightedBackgroundImage:[UIImage lz_imageWithColor:highlightedColor]];
}

+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame color:(UIColor * _Nonnull)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [UIButton lz_initWithFrame:frame
                                title:nil
                      backgroundImage:[UIImage lz_imageWithColor:color]
           highlightedBackgroundImage:[UIImage lz_imageWithColor:[UIColor colorWithRed:components[0]-0.1 green:components[1]-0.1 blue:components[2]-0.1 alpha:1]]];
}

+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame color:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nonnull)highlightedColor {
    return [UIButton lz_initWithFrame:frame
                                title:nil
                      backgroundImage:[UIImage lz_imageWithColor:color]
           highlightedBackgroundImage:[UIImage lz_imageWithColor:highlightedColor]];
}

+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame image:(UIImage * _Nonnull)image {
    return [UIButton lz_initWithFrame:frame image:image highlightedImage:nil];
}

+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame image:(UIImage * _Nonnull)image highlightedImage:(UIImage * _Nullable)highlightedImage {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    
    return button;
}

- (void)lz_setTitleColor:(UIColor * _Nonnull)color {
    [self lz_setTitleColor:color
          highlightedColor:[color colorWithAlphaComponent:0.4]];
}

- (void)lz_setTitleColor:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nullable)highlightedColor {
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:highlightedColor forState:UIControlStateHighlighted];
}


@end
