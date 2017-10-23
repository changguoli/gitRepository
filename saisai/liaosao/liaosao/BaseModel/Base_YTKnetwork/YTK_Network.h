//
//  YTK_Network.h
//  Youngs
//
//  Created by guoxuyao on 2017/4/1.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>


//定义block类型
typedef void (^ReturnValueBlock) (Base_YTKRequest* returnValue, NSDictionary* responseString);
typedef void (^ErrorCodeBlock) (Base_YTKRequest* returnValue, NSDictionary* responseString);
typedef void (^FailureBlock)(Base_YTKRequest* returnValue,NSError *error);
typedef void (^LoadRequestBlock)(id loadInfo);

@interface YTK_Network : NSObject

@property (nonatomic,copy)ReturnValueBlock  sucessBlock;
@property (nonatomic,copy)ErrorCodeBlock  ErrorBlock;
@property (nonatomic,copy)FailureBlock  FaileBlock ;
@property (nonatomic,copy)LoadRequestBlock  loadBlock;





- (instancetype)initWithSuccess:(ReturnValueBlock)returnSuccessBlock  withErrorBlock:(ErrorCodeBlock)returnErrorBlock withFailBlock:(FailureBlock)returnFaileBlock withLoadBlock:(LoadRequestBlock)returnloadBlock;





//通用单次请求方法

- (void)currtYTKRequest:(Base_YTKRequest *)request;
//特殊请求不需要提示
- (void)currtYTKRequestNoPrompt:(Base_YTKRequest *)request;




//依赖请求  未完成  暂不封装
- (void)YTKNetworkSucessBlock:(ReturnValueBlock)returnSuccessBlock  withErrorBlock:(ErrorCodeBlock)returnErrorBlock withFailBlock:(FailureBlock)returnFaileBlock currtYTKRequest:(Base_YTKRequest *)request nextYTKRequest:(Base_YTKRequest *)nextRequest;



@end
