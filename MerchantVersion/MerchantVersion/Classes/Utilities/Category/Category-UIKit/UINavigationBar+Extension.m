//
//  UINavigationBar+Extension.m
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/9.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import "UINavigationBar+Extension.h"

@implementation UINavigationBar (Extension)

- (void)lz_isRetinasetTransparent:(BOOL)transparent {
    [self lz_isRetinasetTransparent:transparent translucent:YES];
}

- (void)lz_isRetinasetTransparent:(BOOL)transparent translucent:(BOOL)translucent {
    if (transparent) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.shadowImage = [UIImage new];
        self.translucent = translucent;
    } else {
        [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        self.shadowImage = nil;
        self.translucent = translucent;
    }
}

@end
