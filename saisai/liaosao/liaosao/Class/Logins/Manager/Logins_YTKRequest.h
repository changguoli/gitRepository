//
//  Logins_YTKRequest.h
//  liaosao
//
//  Created by guoxuyao on 2017/6/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Base_YTKRequest.h"
//登陆
@interface Logins_YTKRequest : Base_YTKRequest
-(id)initWithLoginDic:(NSDictionary *)dic;

@end
//kloginOUT_URL
#pragma mark --- 登出
@interface Loginout_YTKRequest : Base_YTKRequest
-(id)initWithLoginOutDic:(NSDictionary *)dic;


@end

#pragma mark --- 获取验证码/Oauth/sendCodeByPhone
@interface sendCodeByPhone_YTKRequest : Base_YTKRequest
-(id)initWithsendCodeByPhoneDic:(NSDictionary *)dic;


@end


#pragma mark ---  注册/Oauth/sendCodeByPhone kregister_URL


@interface register_YTKRequest : Base_YTKRequest
-(id)initWithregisterDic:(NSDictionary *)dic;


@end

