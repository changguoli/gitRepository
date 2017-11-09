//
//  GLNetWorkManager.h
//  liaosao
//
//  Created by cgl on 2017/10/24.
//  Copyright © 2017年 changguoli. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 本类是对AFNetWorking 进行二次封装,并结合MBProgressHUD,给出基本进度提示
 由于项目涉及到:
 带/不带Token的GET/POST请求
 
 @URLlStr:网络请求URL
 @parameters:请求参数
 @finish:请求成功
 @enError:请求失败
 */
@interface GLNetWorkManager : NSObject

/**
 无Token的GET请求
 */

+ (void)requestGETWithURLStr:(NSString *)URLStr parameters:(id)parameters finish:(void(^)(id dataDic))finish enError:(void(^)(NSError *error))enError;

/**
 无Token的POST请求
 */

+ (void)requestPostWithURLStr:(NSString *)URLStr parameters:(id)parameters finish:(void(^)(id dataDic))finish enError:(void(^)(NSError *error))enError;

/**
 带Token的GET请求
 */

+ (void)requestGETContainAuthorizationWithURLStr:(NSString *)URLStr parameters:(id)parameters token_type:(NSString *)token_type access_token:(NSString *)access_token finish:(void(^)(id dataDic))finish enError:(void(^)(NSError *error))enError;
/**
 带Token的POST请求
 */
+ (void)requestPostContainTokenWithURLStr:(NSString *)URLStr parameters:(id)parameters finish:(void(^)(id dataDic))finish enError:(void(^)(NSError *error))enError;

+ (void)requestPostContainAuthorizationWithURLStr:(NSString *)URLStr parameters:(id)parameters token_type:(NSString *)token_type access_token:(NSString *)access_token finish:(void(^)(id dataDic))finish enError:(void(^)(NSError *error))enError;

//上传表单
+(void)postUpLoadDataByString:(NSString *)urlString BODYDic:(NSDictionary *)bodyDic ImageNumber:(NSInteger)num ImageData_1:(NSData *)data1 ImageName_1:(NSString *)string1 ImageData_2:(NSData *)data2 ImageName_2:(NSString *)string2 WithDataBlock:(void(^)(id data))dataBlock;

//多图上传
+ (void)postUpLoadDuoTuDataByString:(NSString *)urlString BODYDic:(NSDictionary *)bodyDic ImageNumber:(NSInteger)num ImageData_1:(NSData *)data1 ImageData_2:(NSData *)data2 ImageData_3:(NSData *)data3 ImageData_4:(NSData *)data4 ImageData_5:(NSData *)data5 ImageData_6:(NSData *)data6 WithDataBlock:(void (^)(id data))dataBlock;


@end
