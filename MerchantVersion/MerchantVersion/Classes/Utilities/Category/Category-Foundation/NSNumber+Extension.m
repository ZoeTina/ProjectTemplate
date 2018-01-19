//
//  NSNumber+Extension.m
//  LZExtension
//
//  Created by 寕小陌 on 16/10/27.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import "NSNumber+Extension.h"

@implementation NSNumber (Extension)

+ (NSInteger)lz_randomIntBetweenMin:(NSInteger)minValue andMax:(NSInteger)maxValue {
    return (NSInteger)(minValue + [self lz_randomFloat] * (maxValue - minValue));
}

+ (CGFloat)lz_randomFloat {
    return (float) arc4random() / UINT_MAX;
}

+ (CGFloat)lz_randomFloatBetweenMin:(CGFloat)minValue andMax:(CGFloat)maxValue {
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * (maxValue - minValue)) + minValue;
}

@end
