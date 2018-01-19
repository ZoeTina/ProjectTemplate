//
//  UIToolbar+Extension.m
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import "UIToolbar+Extension.h"

@implementation UIToolbar (Extension)

- (void)lz_setTransparent:(BOOL)transparent {
    if (transparent) {
        [self setBackgroundImage:[UIImage new] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new] forToolbarPosition:UIBarPositionAny];
    } else {
        [self setBackgroundImage:nil forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        [self setShadowImage:nil forToolbarPosition:UIBarPositionAny];
    }
}

@end
