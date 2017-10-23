//
//  YTK_Network.m
//  Youngs
//
//  Created by guoxuyao on 2017/4/1.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "YTK_Network.h"



@implementation YTK_Network
- (instancetype)initWithSuccess:(ReturnValueBlock)returnSuccessBlock  withErrorBlock:(ErrorCodeBlock)returnErrorBlock withFailBlock:(FailureBlock)returnFaileBlock withLoadBlock:(LoadRequestBlock)returnloadBlock {
    self = [super init];
    if (self) {
        self.sucessBlock = returnSuccessBlock;
        self.ErrorBlock = returnErrorBlock;
        self.FaileBlock = returnFaileBlock;
        self.loadBlock =  returnloadBlock;
        
    }
    
    return self;
    
}


//通用单次请求方法
- (void)currtYTKRequest:(Base_YTKRequest *)request {
    WS(weakSelf)
    
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        //code：状态码，可以认为非1都为异常，1为正常返回
        kHidHUD_Loding;
        
        NSDictionary *json = [request responseObject];
        GDBLog(@"%@",json);
        
        if (!(json && [json returnDicHaveKey:kCode_request])) {
            kShowMessage(kDataError_request);
            return ;
        }
       
        
        NSInteger codes= [json[kCode_request] integerValue];
        switch (codes) {
            case 1:
            {
                
                //请求成功
                if (self.sucessBlock) {
                    self.sucessBlock(request,json);
                    
                }
                
            }
                break;
                
                
            default:
            {
            
                               
                if (self.ErrorBlock) {
                    self.ErrorBlock(request,json);
                    
                }
            }
                break;
        }
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        //请求失败
        GDBLog(@"%@",request.error);
        kHidHUD_Loding;
        kShowMessage(@"请求失败");
        
        //        self.FaileBlock(request,request.error);
        if (request.error.code == 301) {
            
            
        } else {
            
            [weakSelf showFaileMessage:request.error];
            if (self.FaileBlock) {
                self.FaileBlock(request,request.error);
                
            }
            
        }
        
        
        
        
    }];
    
    
    
}


//特殊请求不需要提示
- (void)currtYTKRequestNoPrompt:(Base_YTKRequest *)request {
    
    
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        //code：状态码，可以认为非0都为异常，0为正常返回
        NSDictionary *json = request.responseObject;
        GDBLog(@"===---%d",[json returnDicHaveKey:kCode_request]);
        
        kHidHUD_Loding;
        
        if (!(json && [json returnDicHaveKey:kCode_request])) {
            
            return ;
        }
        
        //data
        
        NSInteger codes= [json[kCode_request] integerValue];
        
        
        switch (codes) {
            case 0:
            {
                //请求成功
                if (self.sucessBlock) {
                    self.sucessBlock(request,json);
                    
                }
                
            }
                break;
                
                
            default:
            {
                
                if (self.ErrorBlock) {
                    self.ErrorBlock(request,json);
                    
                }
            }
                break;
        }
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        GDBLog(@"2%@",request.error);
        if (request.error.code == 301) {
            
            
        } else {
            if (self.FaileBlock) {
                self.FaileBlock(request,request.error);
                
            }
            
        }
        
        
        
        
    }];
    
    
    
    
}



- (void)showFaileMessage:(NSError *)error {
    switch (error.code) {
        case 500:
        {
            [MBProgressHUD showError:kRequestFaile_500];

        }
            break;
        case 404:
        {
            [MBProgressHUD showError:kRequestFaile_404];
            
        }
            break;

            
        default:
        {
            [MBProgressHUD showError:kRequestFaile_other];
            
        }
            break;
    }
    
    
}




- (void)YTKNetworkSucessBlock:(ReturnValueBlock)returnSuccessBlock  withErrorBlock:(ErrorCodeBlock)returnErrorBlock withFailBlock:(FailureBlock)returnFaileBlock currtYTKRequest:(Base_YTKRequest *)request nextYTKRequest:(Base_YTKRequest *)nextRequest {
    YTKChainRequest *chainReq = [[YTKChainRequest alloc] init];
    [chainReq addRequest:request callback:^(YTKChainRequest * _Nonnull chainRequest, YTKBaseRequest * _Nonnull baseRequest) {
        //获取数据
        //初始化nextrequest
        
        //添加请求
        
        
        
        
        
    }];
    
    
    
    
    
}



@end
