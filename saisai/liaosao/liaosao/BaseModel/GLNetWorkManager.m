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
        NSLog(@"url:%@,data: %@", URLStr, dataDic);
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
        NSString *code = [dataDic objectForKey:@"status"];
        NSString *codeStr = [NSString stringWithFormat:@"%@",code];
        if ([codeStr isEqualToString:@"1"]) {
            //请求成功
            finish(dataDic);
        } else {
            //请求失败
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


+ (void)postUpLoadDataByString:(NSString *)urlString BODYDic:(NSDictionary *)bodyDic ImageNumber:(NSInteger)num ImageData_1:(NSData *)data1 ImageName_1:(NSString *)string1 ImageData_2:(NSData *)data2 ImageName_2:(NSString *)string2 WithDataBlock:(void (^)(id))dataBlock
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30.f;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
//    NSString *authorization = [NSString stringWithFormat:@"%@ %@",token_type, access_token];
//    [manager.requestSerializer setValue:authorization forHTTPHeaderField:@"Authorization"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", @"charset=utf-8", nil];
    // 2.发送一个请求
    [manager POST:urlString parameters:bodyDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (num == 1) {
            [formData appendPartWithFileData:data1 name:string1 fileName:@"haha.jpg" mimeType:@"image/jpeg"];
        }else if (num == 2){
            [formData appendPartWithFileData:data1 name:string1 fileName:@"haha.jpg" mimeType:@"image/jpeg"];
            [formData appendPartWithFileData:data2 name:string2 fileName:@"hehe.jpg" mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"uploadProgress: %@", uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSString *code = [dataDic objectForKey:@"status"];
        NSString *codeStr = [NSString stringWithFormat:@"%@",code];
        if ([codeStr isEqualToString:@"1"]) {
            //请求成功
            dataBlock(dataDic);
        } else {
            //请求失败
            dataBlock(dataDic);
        }
        NSLog(@"dataBlock: %@", dataDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败");
    }];
    
   
}


@end
