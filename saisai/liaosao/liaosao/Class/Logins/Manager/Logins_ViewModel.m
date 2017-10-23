//
//  Logins_ViewModel.m
//  liaosao
//
//  Created by guoxuyao on 2017/6/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Logins_ViewModel.h"
#import "Logins_YTKRequest.h"

@implementation Logins_ViewModel

//登陆
- (void)loginin:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^)(NSError *error))failure {
    Logins_YTKRequest *loginApi = [[Logins_YTKRequest alloc] initWithLoginDic:dic];
 
    
    
    YTK_Network *ytkNetwork = [[YTK_Network alloc] initWithSuccess:^(Base_YTKRequest *returnValue, NSDictionary *responseString) {
        GDBLog(@"==%@",responseString);
        
        if (success) {
            success(responseString);
        }
    } withErrorBlock:^(Base_YTKRequest *returnValue, NSDictionary *responseString) {
        if (failure) {
            failure(nil);
        }
        
    } withFailBlock:^(Base_YTKRequest *returnValue, NSError *error) {
        if (failure) {
            failure(error);
        }
        
    } withLoadBlock:^(id loadInfo) {
        
    }];
    [ytkNetwork currtYTKRequest:loginApi];
    
    
}



#pragma mark ---登出

- (void)loginout:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^)(NSError *error))failure  {
    Loginout_YTKRequest *loginoutApi = [[Loginout_YTKRequest alloc] initWithLoginOutDic:dic];
    YTK_Network *ytkNetwork = [[YTK_Network alloc] initWithSuccess:^(Base_YTKRequest *returnValue, NSDictionary *responseString) {
        GDBLog(@"==%@",responseString);
        
        if (success) {
            success(responseString);
        }
    } withErrorBlock:^(Base_YTKRequest *returnValue, NSDictionary *responseString) {
        if (failure) {
            failure(nil);
        }
        
    } withFailBlock:^(Base_YTKRequest *returnValue, NSError *error) {
        if (failure) {
            failure(error);
        }
        
    } withLoadBlock:^(id loadInfo) {
        
    }];
    [ytkNetwork currtYTKRequest:loginoutApi];

    
    
}



#pragma mark ---获取验证码/Oauth/sendCodeByPhone

- (void)sendCodeByPhone:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^)(NSError *error))failure {
    
    sendCodeByPhone_YTKRequest *sendCodeApi = [[sendCodeByPhone_YTKRequest alloc] initWithsendCodeByPhoneDic:dic];
    
    YTK_Network *ytkNetwork = [[YTK_Network alloc] initWithSuccess:^(Base_YTKRequest *returnValue, NSDictionary *responseString) {
        GDBLog(@"==%@",responseString);
        
        if (success) {
            success(responseString);
        }
    } withErrorBlock:^(Base_YTKRequest *returnValue, NSDictionary *responseString) {
        if (failure) {
            failure(nil);
        }
        
    } withFailBlock:^(Base_YTKRequest *returnValue, NSError *error) {
        if (failure) {
            failure(error);
        }
        
    } withLoadBlock:^(id loadInfo) {
        
    }];
    [ytkNetwork currtYTKRequest:sendCodeApi];
    

    
    
    
}



#pragma mark ---注册

- (void)registerPhone:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^)(NSError *error))failure{
    register_YTKRequest *registerApi = [[register_YTKRequest alloc] initWithregisterDic:dic];
    
    YTK_Network *ytkNetwork = [[YTK_Network alloc] initWithSuccess:^(Base_YTKRequest *returnValue, NSDictionary *responseString) {
        GDBLog(@"==%@",responseString);
        
        if (success) {
            success(responseString);
        }
    } withErrorBlock:^(Base_YTKRequest *returnValue, NSDictionary *responseString) {
        if (failure) {
            failure(nil);
        }
        
    } withFailBlock:^(Base_YTKRequest *returnValue, NSError *error) {
        if (failure) {
            failure(error);
        }
        
    } withLoadBlock:^(id loadInfo) {
        
    }];
    [ytkNetwork currtYTKRequest:registerApi];
    
 
    
}




@end
