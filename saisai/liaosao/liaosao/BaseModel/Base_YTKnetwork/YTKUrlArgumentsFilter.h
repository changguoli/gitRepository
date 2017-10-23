//
//  YTKUrlArgumentsFilter.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTKUrlArgumentsFilter : NSObject  <YTKUrlFilterProtocol>
+ (YTKUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments;

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request;



@end
