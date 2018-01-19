//
//  LZHttpRequestTool.h
//  SEZB
//
//  Created by 寕小陌 on 2016/12/13.
//  Copyright © 2016年 寜小陌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZNetModel.h"

@interface LZHttpRequestTool : NSObject

//创建对象的类方法
+(instancetype)manager;

+(void)cancelCurrentRequest;
+(void)invalidateCancelingRequest;

/**
 *  Get 请求
 *
 *  @param URLString 请求URL
 *  @param parameter 请求参数
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 */
+(void)getWithURLString:(NSString *)URLString
              parameter:(NSDictionary *)parameter
                success:(void(^)(id responseObject))success
                failure:(void(^)(NSError *error))failure;


/**
 *  Post 请求
 *
 *  @param URLString 请求URL
 *  @param parameter 请求参数
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 */
+(void)postWithURLString:(NSString *)URLString
               parameter:(NSDictionary *)parameter
                 success:(void(^)(id responseObject))success
                 failure:(void(^)(NSError *error))failure;





#pragma mark ------------------- 后续更新 -------------------
/**
 *  上传头像
 *
 *  @param URLString 请求URL
 *  @param parameter 请求参数
 *  @param image     请求上传图片
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 */
+ (void)postImageWithURLString:(NSString *)URLString
                     parameter:(NSDictionary *)parameter
                         image:(UIImage *)image
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;


/**
 *  上传照片数组
 *
 *  @param URLString  请求上传照片url
 *  @param parameter  请求参数
 *  @param imageArray 请求照片数组
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)postImageArrayWithURLString:(NSString *)URLString
                          parameter:(NSDictionary *)parameter
                         imageArray:(NSArray *)imageArray
                            success:(void (^)(NSArray *responseObject))success
                            failure:(void (^)(NSArray *error))failure;


/* 上传视频方法的参数
 * 1. appendPartWithFileData：要上传的照片[二进制流]
 * 2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
 * 3. fileName：要保存在服务器上的文件名
 * 4. mimeType：上传的文件的类型
 */
+ (void)uploadVideoDataWithURLString:(NSString *)URLString
                           parameter:(NSDictionary *)parameter
                       withVideoData:(NSData *)videoData
                        success:(void(^)(id responseObject))success
                        failure:(void(^)(NSError *error))failure;



/**
 *   用于单个接口进行get网络请求,只能用于json格式数据请求，否则报错
 *
 *  @param URLString 请求URL
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 */
+ (void)getDataWithURLString:(NSString *)URLString
                     success:(void (^)( id responseObject))success
                     failure:(void (^)(NSError *error))failure;


/**
 *   用于单个接口进行post网络请求,只能用于json格式数据请求，否则报错
 *
 *  @param URLString 请求URL
 *  @param parameter 请求参数
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 */
+ (void)postDataWithURLString:(NSString *)URLString
                    parameter:(NSDictionary*)parameter
                      success:(void (^)( id responseObject))success
                      failure:(void (^)(NSError *error))failure;


/**
 *  带有token的单个接口进行post网络请求,只能用于json格式数据请求，否则报错
 *
 *  @param URLString 请求URL
 *  @param parameter 请求参数
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 *  @param tokenErrorInfo token相关失败信息
 */
+ (void)postDataHaveTokenWithURLString:(NSString *)URLString
                             parameter:(NSDictionary *)parameter
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure
                        tokenErrorInfo:(void (^)(NSString *tokenErrorInfo))tokenErrorInfo;

#pragma mark 一个页面多个get和post请求
/**
 *  对get和post进行多个请求
 *
 *  @param parameter 请求的参数
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 */

+ (void)getMoreDataWithParameter:(NSArray<LZNetModel*> *)parameter
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSArray *errors))failure;

/**
 将参数放在body里以json格式请求
 
 @param URLString 请求URL
 @param parameter 请求的参数
 @param success   请求成功回调
 @param failure   请求失败回调
 */
+ (void)postBodyDataURLString:(NSString *)URLString
                    parameter:(NSString *)parameter
                      success:(void(^)(id responseObject))success
                      failure:(void(^)(NSError *error))failure;


/**
 * 将参数放在body里的多个请求
 *
 * @param parameter 请求数组
 * @param success   成功回调数组
 * @param failure   失败回调数组
 */
+ (void)checkMoreOrderDataWithParameter:(NSArray<LZNetModel*> *)parameter
                         productIdArray:(NSArray *)productIdArray
                                success:(void (^)(NSArray *responseObject))success
                                failure:(void (^)(NSArray *errors))failure;
@end
