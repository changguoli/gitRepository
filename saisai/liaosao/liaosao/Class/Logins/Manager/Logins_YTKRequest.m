//
//  Logins_YTKRequest.m
//  liaosao
//
//  Created by guoxuyao on 2017/6/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Logins_YTKRequest.h"

@implementation Logins_YTKRequest
{
    NSDictionary *_loginDic;
}
-(id)initWithLoginDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        //参数为空就不传
        
        _loginDic = dic;
    }
    
    return self;
    
}

//请求的地址
-(NSString *)requestUrl{
    return klogin_URL;
    
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}



- (id)requestArgument {
    
    return _loginDic;
}

@end


//kloginOUT_URL
#pragma mark --- 登出

@implementation Loginout_YTKRequest
{
    NSDictionary *_loginDic;
}
-(id)initWithLoginOutDic:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        //参数为空就不传
        
        _loginDic = dic;
    }
    
    return self;
}

//请求的地址
-(NSString *)requestUrl{
    return kloginOUT_URL;
    
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}



- (id)requestArgument {
    
    return _loginDic;
}


@end



#pragma mark --- 获取验证码/Oauth/sendCodeByPhone

@implementation sendCodeByPhone_YTKRequest
{
    NSDictionary *_sendDic;
}
-(id)initWithsendCodeByPhoneDic:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        //参数为空就不传
        
        _sendDic = dic;
    }
    
    return self;
}

//请求的地址
-(NSString *)requestUrl{
    return ksendCodeByPhone_URL;
    
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}



- (id)requestArgument {
    
    return _sendDic;
}

@end



#pragma mark ---  注册/Oauth/sendCodeByPhone kregister_URL

@implementation register_YTKRequest
{
    NSDictionary *_sendDic;
}
-(id)initWithregisterDic:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        //参数为空就不传
        
        _sendDic = dic;
    }
    
    return self;
}

//请求的地址
-(NSString *)requestUrl{
    return kregister_URL;
    
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}



- (id)requestArgument {
    
    return _sendDic;
}


@end





