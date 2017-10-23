//
//  AppDelegate+Service.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/6.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//
/*
 服务以及sdk初始化
 */

#import "AppDelegate+Service.h"
#import "AFNetworking.h"


@implementation AppDelegate (Service)

/**
 *  融云
 */
-(void)registerRongyun {
    [[RCIM sharedRCIM] initWithAppKey:kRong_AppKey];
    // 服务端获取融云token
    [[RCIM sharedRCIM] connectWithToken:@"YourTestUserToken"     success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", (long)status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];

    
}


/*配置YTK信息*/
- (void)configurationYTKNetwork {
    
    //
    // 配置安全模式
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    //config.debugLogEnabled = YES;
    
    config.baseUrl = k_BASE_URL_https;
    config.cdnUrl = @"http://fen.bi";
    //    config.cdnUrl = @"http://fen.bi";
    
    //    // 验证公钥和证书的其他信息
    //    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    //    [securityPolicy setAllowInvalidCertificates:YES];
    //    [securityPolicy setValidatesDomainName:NO];
    
    // 允许自建证书
    config.securityPolicy.allowInvalidCertificates = YES;
    
    // 校验域名信息 如果为yes 必须倒入证书
    config.securityPolicy.validatesDomainName      = NO;
    
    // 获取证书
    //    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"" ofType:@""];//证书的路径
    //    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    //    // 添加服务器证书,单向验证;  可采用双证书 双向验证;
    //    NSSet *sets =  [NSSet setWithObject:certData];
    //
    //    securityPolicy.pinnedCertificates       = sets;
    
    // [config setSecurityPolicy:securityPolicy];
    
}




@end
