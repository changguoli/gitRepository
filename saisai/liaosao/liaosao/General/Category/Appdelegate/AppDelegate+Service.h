//
//  AppDelegate+Service.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/6.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Service)
- (void)registerBugly;

/**
 *  基本配置
 */
- (void)configurationLaunchUserOption;

/**
 *  友盟注册
 */
- (void)registerUmeng;
/**
 *  Mob注册
 */

- (void)registerMob;

/**
 *  检查更新
 */
- (void)checkAppUpDataWithshowOption:(BOOL)showOption;

/**
 *  上传用户设备信息
 */
- (void)upLoadMessageAboutUser;

/**
 *  检查黑名单用户
 */
-(void)checkBlack;
/**
 *  融云
 */
-(void)registerRongyun;


- (void)configurationYTKNetwork ;
@end
