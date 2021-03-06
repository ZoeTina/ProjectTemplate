//
//  LZHttpRequestTool.m
//  SEZB
//
//  Created by 寕小陌 on 2016/12/13.
//  Copyright © 2016年 寜小陌. All rights reserved.
//

#import "LZHttpRequestTool.h"

static AFHTTPSessionManager *manager_ = nil;

@implementation LZHttpRequestTool
{
    AFHTTPSessionManager * _urlSession;
}
//实例化单例对象
+(instancetype)manager{
    LZHttpRequestTool *manager = [[LZHttpRequestTool alloc] init];
    return manager;
}

+ (void)cancelCurrentRequest{
    [manager_.tasks makeObjectsPerformSelector:@selector(cancel)];
    
}
+ (void)invalidateCancelingRequest{
    [manager_ invalidateSessionCancelingTasks:true];
}

/**
 *  Get 请求
 *
 *  @param URLString 请求URL
 *  @param parameter 请求参数
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 */
+(void)getWithURLString:(NSString *)URLString parameter:(NSDictionary *)parameter success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setTimeoutInterval:10];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
//    NSString *userAgent = [NSString stringWithFormat:@"iOS/%@/2.15.0",[[UIDevice currentDevice] name]];
//    [manager.requestSerializer setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    
    // 判断是否登录
//    YYUserLoginModel *loginModel = [YYUserLoginModel sharedUserLoginModel];
//    if ([YYUserLoginModel sharedUserLoginModel].isLogin) {
//        
//        [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:loginModel.uid
//                                                                  password:loginModel.token];
//    }else{
    
//        [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"lz" password:@"123456"];
//    }
    
    
    [manager GET:URLString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
    }];
    
}

/**
 *  Post 请求
 *
 *  @param URLString 请求URL
 *  @param parameter 请求参数
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 */
+(void)postWithURLString:(NSString *)URLString parameter:(NSDictionary *)parameter success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setTimeoutInterval:10];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
//    NSString *userAgent = [NSString stringWithFormat:@"iOS/%@/2.15.0",[[UIDevice currentDevice] name]];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setValue:userAgent forHTTPHeaderField:@"User-Agent"];
//    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"lz" password:@"123456"];
//    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [manager POST:URLString parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
    }];
}


/**
 *  上传头像
 *
 *  @param URLString 请求URL
 *  @param parameter 请求参数
 *  @param image     请求上传图片
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 */
+ (void)postImageWithURLString:(NSString *)URLString parameter:(NSDictionary *)parameter image:(UIImage *)image success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    
    
}


/**
 *  上传照片数组
 *
 *  @param URLString  请求URL
 *  @param parameter  请求参数
 *  @param imageArray 请求照片数组
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)postImageArrayWithURLString:(NSString *)URLString parameter:(NSDictionary *)parameter imageArray:(NSArray *)imageArray success:(void (^)(NSArray *responseObject))success failure:(void (^)(NSArray *error))failure{
    
}


/* 上传视频方法的参数
 * 1. appendPartWithFileData：要上传的照片[二进制流]
 * 2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
 * 3. fileName：要保存在服务器上的文件名
 * 4. mimeType：上传的文件的类型
 */
+ (void)uploadVideoDataWithURLString:(NSString *)URLString parameter:(NSDictionary *)parameter withVideoData:(NSData *)videoData success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    
}

/**
 *   用于单个接口进行get网络请求,只能用于json格式数据请求，否则报错
 *
 *  @param URLString 请求URL
 *  @param success   请求成功后数据回调
 *  @param failure   请求失败进行返回出去
 */
+ (void)getDataWithURLString:(NSString *)URLString success:(void (^)( id responseObject))success failure:(void (^)(NSError *error))failure{
    
}


/**
 *   用于单个接口进行post网络请求,只能用于json格式数据请求，否则报错
 *
 *  @param URLString 请求URL
 *  @param parameter 请求参数
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 */
+ (void)postDataWithURLString:(NSString *)URLString parameter:(NSDictionary*)parameter success:(void (^)( id responseObject))success failure:(void (^)(NSError *error))failure{
    
}


/**
 *  带有token的单个接口进行post网络请求,只能用于json格式数据请求，否则报错
 *
 *  @param URLString post进行网络请求的链接
 *  @param parameter post进行网络请求的参数
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 *  @param tokenErrorInfo token相关失败信息
 */
+ (void)postDataHaveTokenWithURLString:(NSString *)URLString parameter:(NSDictionary *)parameter success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure tokenErrorInfo:(void (^)(NSString *tokenErrorInfo))tokenErrorInfo{
    
}

#pragma mark 一个页面多个get和post请求
/**
 *  对get和post进行多个请求
 *
 *  @param parameter 请求的参数
 *  @param success   请求成功回调
 *  @param failure   请求失败回调
 */

+ (void)getMoreDataWithParameter:(NSArray<LZNetModel*> *)parameter success:(void (^)(id responseObject))success failure:(void (^)(NSArray *errors))failure{
    
}

/**
 将参数放在body里以json格式请求
 
 @param URLString URLString
 @param parameter 请求的参数
 @param success   请求成功回调
 @param failure   请求失败回调
 */
+ (void)postBodyDataURLString:(NSString *)URLString parameter:(NSString *)parameter success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    
}


/**
 * 将参数放在body里的多个请求
 *
 * @param parameter 请求数组
 * @param success   请求成功回调
 * @param failure   请求失败回调
 */
+ (void)checkMoreOrderDataWithParameter:(NSArray<LZNetModel*> *)parameter productIdArray:(NSArray *)productIdArray success:(void (^)(NSArray *responseObject))success failure:(void (^)(NSArray *errors))failure{
    
}


@end
