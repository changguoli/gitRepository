//
//  Base_YTKRequest.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Base_YTKRequest.h"

@implementation Base_YTKRequest
//设置请求头
- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
    //设置通用header 签名
    /*
     1.1	X-REQUEST-ID:ed634c3e-1af0-40e4-ad1e-68c2fb67c8e1 1
     该次请求的UUID
     1.2	X-API-VERSION:1.0.0 1
     代表请求的api版本，预留字段，方便以后扩展，暂时没有用
     1.3	X-REQUEST-SIGNATURE：zkiRn2/k3saflPhxXI7aXA== 0
     value 为 md5（请求body的json内容的+预设的key）
     1.4	X-DEVICEID:XXXX-XXXXX-XXXX 1
     请求设备的id，
     1.5	X-DEVICE-TYPE:[IOS,  ANDROID, WINPHONE] 1
     请求设备的类型
     1.6	TOKEN：weuertisdf93945023hssie74385 0
     登录的时候会返回一个token
     1.7	Content-Type:application/json   1
     请求体必须是jso


     */
    
    
    NSDictionary *dic = @{@"X-REQUEST-ID":kCurrentUUID,@"X-API-VERSION":@"",@"X-DEVICEID":@"",@"X-DEVICE-TYPE":@"IOS",@"Content-Type":@"application/json"};
   
    return dic;
    
    
}





- (NSMutableDictionary *)requestHeaderDic {
    
    
    
    NSDictionary *dic = @{@"X-REQUEST-ID":kCurrentUUID,@"X-API-VERSION":@"",@"X-REQUEST-SIGNATURE":@"",@"X-DEVICEID":@"",@"X-DEVICE-TYPE":@"IOS",@"TOKEN":@"",@"Content-Type":@"application/json"};
    return (NSMutableDictionary *)dic;
    
}


- (YTKRequestSerializerType)requestSerializerType {
    
    return YTKRequestSerializerTypeJSON;
}






@end
