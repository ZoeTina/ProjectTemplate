//
//  SCCompressTools.h
//  SiChuanFocus
//
//  Created by Ensem on 2017/7/4.
//  Copyright © 2017年 Ensem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZCompressTools : NSObject

/** 压缩文件工具单例 */
+ (instancetype)sharedTools;
- (CGFloat)getFileSize:(NSString *)path;
@end
