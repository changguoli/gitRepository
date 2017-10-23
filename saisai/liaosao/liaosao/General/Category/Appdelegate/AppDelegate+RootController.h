//
//  AppDelegate+RootController.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/6.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//
/*
  根视图
 */
#import "AppDelegate.h"

@interface AppDelegate (RootController)
/**
 *  首次启动轮播图
 */
- (void)createLoadingScrollView;
/**
 *  tabbar实例
 */
//- (void)setTabbarController;

/**
 *  window实例
 */
//- (void)setAppWindows;

/**
 *  设置根视图
 */
- (void)setRootViewController;
    
    
//检测软件升级
- (void)checkVersion;
    
@end
