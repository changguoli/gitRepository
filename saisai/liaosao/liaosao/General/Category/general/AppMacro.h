//
//  AppMacro.h
//  Layou
//  app 常用宏定义
//  Created by zhaoshi on 15/7/9.
//  Copyright (c) 2015年 butterfly. All rights reserved.
//


#define ScreenRect [UIScreen mainScreen].bounds
#define ScreenSize [UIScreen mainScreen].bounds.size
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

// 根据屏幕宽度适配宽度,参数a是在iphone 5(即320宽度)情况下的高
#define GetAdaptationWithByScreenWith(a) ceilf(a * (ScreenWidth/320))

// 根据屏幕宽度适配宽度,参数a是在iphone 6(即375高度)情况下的高
#define GetAdaptationHeightByScreenHight(a) ceilf(a * (ScreenHeight/568))


//判断版本
#define ISIOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0

//调用函数
#define LogFun  GDBLog(@"%s",__func__);

//输出视图的frame边界
#define LogFrame(view)  GDBLog(@"%@",NSStringFromCGRect(view.frame) );

//输出所有子视图
#define LogSubviews(view)  GDBLog(@"%@",view.subviews);

#import "NSString+Common.h"
#import "NSString+BFExtension.h"
