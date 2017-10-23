//
//  DataInfo_UserDefaults.h
//  liaosao
//
//  Created by guoxuyao on 2017/6/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataInfo_UserDefaults : NSObject
//存取token
+(void)setAuthDic:(Logins_Model*)dic;

+ (Logins_Model *)getAuthDic;

//获取uid
+(NSString *)getUidFromModel;

//判断是否登陆

+ (BOOL)isLogins;

@end
