//
//  CYLTabBarControllerConfig.h
//  CYLTabBarController
//
//  v1.10.0 Created by 微博@iOS程序犭袁 ( http://weibo.com/luohanchenyilong/ ) on 15/11/3.
//  Copyright © 2015年 https://github.com/ChenYilong .All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYLTabBarController.h"

#import "GBaseTabarView.h"

@interface CYLTabBarControllerConfig : NSObject

+ (instancetype)shareTabar_Single;

@property (nonatomic, readwrite, strong) GBaseTabarView *tabBarController;

@end

