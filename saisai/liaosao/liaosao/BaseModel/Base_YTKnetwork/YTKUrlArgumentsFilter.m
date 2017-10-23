//
//  YTKUrlArgumentsFilter.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "YTKUrlArgumentsFilter.h"


@implementation YTKUrlArgumentsFilter{
    NSDictionary *_arguments;
}

+ (YTKUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments {
    return [[self alloc] initWithArguments:arguments];
}

- (id)initWithArguments:(NSDictionary *)arguments {
    self = [super init];
    if (self) {
        _arguments = arguments;
    }
    return self;
}
#pragma warning  ————有问题
//- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request {
//    return [YTKUrlArgumentsFilter urlStringWithOriginUrlString:originUrl appendParameters:_arguments];
//}

@end
