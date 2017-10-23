//
//  iphoneData.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/15.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iphoneData : NSObject
//获取设备信息
+ (NSString *)getCurrentDeviceModel:(UIViewController *)controller;
@end
