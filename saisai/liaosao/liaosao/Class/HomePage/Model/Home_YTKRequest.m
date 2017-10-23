//
//  Home_YTKRequest.m
//  Youngs
//
//  Created by guoxuyao on 2017/4/1.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Home_YTKRequest.h"

@implementation Home_YTKRequest

- (id) initwithFirst:(NSString *)first {
    if (self) {
        
    }
    return self;
    
    
}


//设置请求头
- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
    //设置通用header 签名
    /*
     1.3	X-REQUEST-SIGNATURE：zkiRn2/k3saflPhxXI7aXA== 0
     value 为 md5（请求body的json内容的+预设的key）
     1.6	TOKEN：weuertisdf93945023hssie74385 0
     登录的时候会返回一个token
     */
    [self.requestHeaderDic setValue:@"" forKey:@"X-REQUEST-SIGNATURE"];
    [self.requestHeaderDic setValue:@"" forKey:@"TOKEN"];
    return self.requestHeaderDic;
    
    
}

@end

@implementation GetSlideShow_YTKRequest
{
    NSDictionary *_sendDic;
}

-(id)initWithGetSlideShow:(NSDictionary *)slideDic {
    self = [super init];
    if (self) {
        //参数为空就不传
        
        _sendDic = slideDic;
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

