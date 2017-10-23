//
//  Base_YTKRequest.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

@interface Base_YTKRequest : YTKRequest

@property (nonatomic,strong) NSDictionary *URLDic;
//requestHeader  请求头
@property (nonatomic,strong) NSMutableDictionary *requestHeaderDic;




@end

