//
//  Home_ViewModel.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/28.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Home_ViewModel.h"

#import "Home_YTKRequest.h"

@implementation Home_ViewModel

- (void)getSlideShow:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^)(NSError *error))failure  {
    
    GetSlideShow_YTKRequest *getDliderApi = [[GetSlideShow_YTKRequest alloc] initWithGetSlideShow:dic];
    
    
    YTK_Network *ytkNetwork = [[YTK_Network alloc] initWithSuccess:^(Base_YTKRequest *returnValue, NSDictionary *responseString) {
        GDBLog(@"==%@",responseString);
        
        if (success) {
            success(responseString);
        }
    } withErrorBlock:^(Base_YTKRequest *returnValue, NSDictionary *responseString) {
        if (failure) {
            failure(nil);
        }
        
    } withFailBlock:^(Base_YTKRequest *returnValue, NSError *error) {
        if (failure) {
            failure(error);
        }
        
    } withLoadBlock:^(id loadInfo) {
        
    }];
    [ytkNetwork currtYTKRequest:getDliderApi];
    
    

    
    
}

@end
