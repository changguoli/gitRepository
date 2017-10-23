//
//  Home_ViewModel.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/28.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "BQBaseViewModel.h"

@interface Home_ViewModel : BQBaseViewModel
#pragma mark ---首页接口//kgetSlideShow_URL


- (void)getSlideShow:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^)(NSError *error))failure ;


@end

