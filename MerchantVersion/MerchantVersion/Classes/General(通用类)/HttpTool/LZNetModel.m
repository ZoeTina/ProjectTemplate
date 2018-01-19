//
//  LZNetModel.m
//  MerchantVersion
//
//  Created by 寜小陌 on 2018/1/19.
//  Copyright © 2018年 寜小陌. All rights reserved.
//

#import "LZNetModel.h"

@implementation LZNetModel

-(instancetype)initIsGetOrPost:(BOOL)isGet  URLString:(NSString *)URLString Parameter:(NSDictionary *)parameter{
    
    self = [super init];
    
    if (self) {
        self.isGetOrPost    = isGet;
        self.URLString      = URLString;
        self.parameter      = [NSMutableDictionary dictionaryWithDictionary:parameter];
    }
    return self;
}

-(NSMutableDictionary *)parameter{
    if (!_parameter) {
        _parameter = [NSMutableDictionary dictionary];
    }
    return _parameter;
}

@end
