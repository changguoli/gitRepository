//
//  DataInfo_UserDefaults.m
//  liaosao
//
//  Created by guoxuyao on 2017/6/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//
#define kuserInfo @"userInfo"


#import "DataInfo_UserDefaults.h"

@implementation DataInfo_UserDefaults
//存取token
+(void)setAuthDic:(Logins_Model*)dic {
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:dic];
    [UserDefaultsUtils saveValue:data forKey:kuserInfo];
    
    
}

+ (Logins_Model *)getAuthDic {
    NSData *data = [UserDefaultsUtils valueWithKey:kuserInfo];
    Logins_Model *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if((NSNull*)model == [NSNull null])
        return  nil;
    else
        return model;

    
}


//获取uid
+(NSString *)getUidFromModel {
    NSData *data = [UserDefaultsUtils valueWithKey:kuserInfo];
    Logins_Model *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if((NSNull*)model == [NSNull null])
        return  @"";
    else
        return model.uid;
    
    
}

//判断是否登陆

+ (BOOL)isLogins {
    NSData *data = [UserDefaultsUtils valueWithKey:kuserInfo];
    Logins_Model *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if((NSNull*)model == [NSNull null])
        return  NO;
    else
        return YES;
    
    
}


@end
