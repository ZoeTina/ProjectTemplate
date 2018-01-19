//
//  SCCompressTools.m
//  SiChuanFocus
//
//  Created by Ensem on 2017/7/4.
//  Copyright © 2017年 Ensem. All rights reserved.
//

#import "LZCompressTools.h"
#import <AVFoundation/AVFoundation.h>

@implementation LZCompressTools

+ (instancetype)sharedTools {
    static LZCompressTools *tools = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[LZCompressTools alloc] init];
    });
    return tools;
}

/**
 * 获取当前时间
 */
- (NSString *)getCurrentTime {
    [NSDate lz_sharedDateFormatter].dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [[NSDate lz_sharedDateFormatter] stringFromDate:[NSDate date]];
}

/**
 * 获取视频大小
 *
 * @param     path 文件路径
 * @return    size 文件大小
 */
- (CGFloat)getFileSize:(NSString *)path {
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    float fileSize = -1.0;
    if ([fileManager fileExistsAtPath:path]) {
        // 获取文件属性
        NSDictionary *dict = [fileManager attributesOfItemAtPath:path error:nil];
        unsigned long long size = [[dict objectForKey:NSFileSize] longLongValue];
        fileSize = 1.0 * size / 1024;
    }
    return fileSize;
}

/**
 * 视频压缩
 *
 * @param   url 原视频Url
 * @return  newUrl 压缩后视频Url
 */
- (NSURL *)compressVideoNewUrl:(NSURL *)url {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *destFilePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.MOV", [self getCurrentTime]]];
    NSURL *destUrl = [NSURL fileURLWithPath:destFilePath];
    
    //将视频文件copy到沙盒目录中
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error = nil;
    [manager copyItemAtURL:url toURL:destUrl error:&error];
    
    YYLog(@"压缩前--%.2fk", [self getFileSize:destFilePath]);
    
    // 压缩视频
    AVAsset *asset = [AVAsset assetWithURL:destUrl];
    
    // 创建视频资源导出会话
    /**
     NSString *const AVAssetExportPresetLowQuality; // 低质量
     NSString *const AVAssetExportPresetMediumQuality;
     NSString *const AVAssetExportPresetHighestQuality; //高质量
     */
    
    AVAssetExportSession *session = [[AVAssetExportSession alloc] initWithAsset:asset presetName:AVAssetExportPresetLowQuality];
    NSString *resultPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.MOV", [self getCurrentTime]]];
    
    session.outputURL = [NSURL fileURLWithPath:resultPath];
    
    // 必须配置输出属性
    session.outputFileType = @"com.apple.quicktime-movie";
    // 导出视频
    [session exportAsynchronouslyWithCompletionHandler:^{
        YYLog(@"压缩后----%.2fk", [self getFileSize:resultPath]);
        YYLog(@"视频导出完成");
    }];
    
    return session.outputURL;
}

@end
