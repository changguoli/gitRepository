//
//  MBProgressHUD+development.h
//  JiDuANTiA
//
//  Created by guoxuyao on 16/1/12.
//  Copyright © 2016年 guoxuyao. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>
#pragma mark --枚举，消息提示框的位置
typedef NS_ENUM(NSInteger,MBProgressHUBPosition) {
    MBProgressHUBPositionTop,            //头部
    MBProgressHUBPositionCenter,         //中心
    MBProgressHUBPositionBottom          //底部
};

@interface MBProgressHUD (development)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

//上边保留  暂时用下边的
#pragma mark -- custom
+ (void)showMessageTo:(UIView *)view tip:(NSString *)message showTime:(NSInteger)time;
//弹出提示弹框
+ (void)showMessageTo:(UIView *)view tip:(NSString *)message  ;
+ (void)showMessageOnWindow:(NSString *)message ;
//弹出加载等待
+ (MBProgressHUD *)showLoding:(NSString *)message toView:(UIView *)view ;
+ (MBProgressHUD *)showLoding:(NSString *)message;
+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;@end
