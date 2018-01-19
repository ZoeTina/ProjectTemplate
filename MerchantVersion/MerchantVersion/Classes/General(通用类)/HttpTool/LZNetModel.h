//
//  LZNetModel.h
//  MerchantVersion
//
//  Created by 寜小陌 on 2018/1/19.
//  Copyright © 2018年 寜小陌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZNetModel : NSObject

/// 是get还是post
@property (nonatomic, assign)    BOOL                   isGetOrPost;
/// 请求链接
@property (nonatomic, copy)      NSString               *URLString;
/// post请求参数
@property (nonatomic, strong)    NSMutableDictionary    *parameter;
/// post请求body体
@property (nonatomic, copy)      NSString               *postData;
/// 请求结果参数
@property (nonatomic, assign)    NSInteger              requestType;

-(instancetype)initIsGetOrPost:(BOOL)isGet  URLString:(NSString*)URLString  Parameter:(NSDictionary*)parameter;

@end
