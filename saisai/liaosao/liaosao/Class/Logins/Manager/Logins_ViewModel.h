//
//  Logins_ViewModel.h
//  liaosao
//
//  Created by guoxuyao on 2017/6/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "BQBaseViewModel.h"

@interface Logins_ViewModel : BQBaseViewModel
//登陆
- (void)loginin:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^)(NSError *error))failure ;

#pragma mark ---登出

- (void)loginout:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^)(NSError *error))failure ;

#pragma mark ---获取验证码/Oauth/sendCodeByPhone

- (void)sendCodeByPhone:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^)(NSError *error))failure ;


#pragma mark ---注册

- (void)registerPhone:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^)(NSError *error))failure ;



@end
