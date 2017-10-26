//
//  GLNetWorkManager.m
//  liaosao
//
//  Created by cgl on 2017/10/24.
//  Copyright © 2017年 changguoli. All rights reserved.
//

#import "GLNetWorkManager.h"

@implementation GLNetWorkManager

/**
 无Token的GET请求
 */

+ (void)requestGETWithURLStr:(NSString *)URLStr parameters:(id)parameters finish:(void(^)(id dataDic))finish enError:(void(^)(NSError *error))enError {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    manager.requestSerializer.timeoutInterval = 30.f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", @"charset=utf-8", nil];
    [manager GET:URLStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        finish(dataDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        enError(error);
        [self handleFailureMessageWithError:error];
    }];
    
}

/**
 无Token的POST请求
 */

+ (void)requestPostWithURLStr:(NSString *)URLStr parameters:(id)parameters finish:(void(^)(id dataDic))finish enError:(void(^)(NSError *error))enError {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30.f;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", @"charset=utf-8", nil];
    [manager POST:URLStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        finish(dataDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        enError(error);
        [self handleFailureMessageWithError:error];
    }];
    
}

/**
 带Token的GET请求
 */

+ (void)requestGETContainAuthorizationWithURLStr:(NSString *)URLStr parameters:(id)parameters token_type:(NSString *)token_type access_token:(NSString *)access_token finish:(void(^)(id dataDic))finish enError:(void(^)(NSError *error))enError {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30.f;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    NSString *authorization = [NSString stringWithFormat:@"%@ %@",token_type, access_token];
    [manager.requestSerializer setValue:authorization forHTTPHeaderField:@"Authorization"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", @"charset=utf-8", nil];
    [manager GET:URLStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        if ([[dataDic objectForKey:@"errorCode"] isEqualToString:@"0000"]) {
            //请求成功
            finish(dataDic);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        enError(error);
        
        [self handleFailureMessageWithError:error];
        
    }];
    
}
/**
 带Token的POST请求
 */

+ (void)requestPostContainAuthorizationWithURLStr:(NSString *)URLStr parameters:(id)parameters token_type:(NSString *)token_type access_token:(NSString *)access_token finish:(void(^)(id dataDic))finish enError:(void(^)(NSError *error))enError {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30.f;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    NSString *authorization = [NSString stringWithFormat:@"%@ %@",token_type, access_token];
    [manager.requestSerializer setValue:authorization forHTTPHeaderField:@"Authorization"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", @"charset=utf-8", nil];
    [manager POST:URLStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        if ([[dataDic objectForKey:@"errorCode"] isEqualToString:@"0000"]) {
            //请求成功
            finish(dataDic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        enError(error);
        [self handleFailureMessageWithError:error];
    }];
    
}

/*
 * 处理错误信息,以及提示用户操作
 */
+ (void)handleFailureMessageWithError:(NSError *)error {
    
    NSLog(@"网络请求error:%@", error);
}
@end
