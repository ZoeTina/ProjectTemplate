//
//  NSObject+Extension.m
//  LZExtension
//
//  Created by 寕小陌 on 16/10/27.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)

- (BOOL)lz_isValid {
    return !(self == nil || [self isKindOfClass:[NSNull class]]);
}


@end
