//
//  UIApplication+Extensions.m
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import "UIApplication+Extensions.h"
#import "UIScreen+Extension.h"

@implementation UIApplication (Extensions)

+ (AppDelegate *)lz_appDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

+ (UIViewController *)lz_rootViewController {
    return [UIApplication lz_appDelegate].window.rootViewController;
}

+ (UIImage *)lz_launchImage {
    UIImage *image = nil;
    NSArray *launchImages = [NSBundle mainBundle].infoDictionary[@"UILaunchImages"];
    
    for (NSDictionary *dict in launchImages) {
        // 1. 将字符串转换成尺寸
        CGSize size = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        // 2. 与当前屏幕进行比较
        if (CGSizeEqualToSize(size, [UIScreen lz_screenSize])) {
            NSString *filename = dict[@"UILaunchImageName"];
            image = [UIImage imageNamed:filename];
            
            break;
        }
    }
    return image;
}

@end

