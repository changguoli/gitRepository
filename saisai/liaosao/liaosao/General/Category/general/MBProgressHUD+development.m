//
//  MBProgressHUD+development.m
//  JiDuANTiA
//
//  Created by guoxuyao on 16/1/12.
//  Copyright © 2016年 guoxuyao. All rights reserved.
//

#import "MBProgressHUD+development.h"

#define kMessage_ShowTime 1

@implementation MBProgressHUD (development)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.label.textColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:0.5];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    
    hud.dimBackground = YES;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}


//弹出提示弹框
//toast提示
+ (void)showMessageTo:(UIView *)view tip:(NSString *)message {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *MBProgress = [MBProgressHUD showHUDAddedTo:view animated:YES];
    MBProgress.mode = MBProgressHUDModeText;
    MBProgress.label.text = message;
    MBProgress.bezelView.backgroundColor = [UIColor blackColor];
    MBProgress.label.textColor = [UIColor whiteColor];
    MBProgress.removeFromSuperViewOnHide = YES;
    [self setMBShowOffetSet:MBProgress positionENUM:MBProgressHUBPositionBottom];
    [MBProgress hideAnimated:YES afterDelay:kMessage_ShowTime];
    
}
+ (void)showMessageOnWindow:(NSString *)message {
    [self showMessageTo:nil tip:message];
}


+ (void)showMessageTo:(UIView *)view tip:(NSString *)message showTime:(NSInteger)time{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *MBProgress = [MBProgressHUD showHUDAddedTo:view animated:YES];
    MBProgress.mode = MBProgressHUDModeText;
    MBProgress.label.text = message;
    MBProgress.bezelView.backgroundColor = [UIColor blackColor];
    MBProgress.label.textColor = [UIColor whiteColor];
    MBProgress.removeFromSuperViewOnHide = YES;
    [self setMBShowOffetSet:MBProgress positionENUM:MBProgressHUBPositionBottom];
    [MBProgress hideAnimated:YES afterDelay:time];
    
}

//弹出加载等待

#pragma mark 显示一些信息
+ (MBProgressHUD *)showLoding:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = message;
    hud.label.adjustsFontSizeToFitWidth = YES;
    // 隐藏时候从父控件中移除
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.removeFromSuperViewOnHide = YES;
    hud.contentColor = [UIColor  whiteColor];
    
    [hud showAnimated:YES];
    [self hideAlertDelay];
    return hud;
}



+ (MBProgressHUD *)showLoding:(NSString *)message
{
    return [self showLoding:message toView:nil];
}
//隐藏
+ (MBProgressHUD *)HUDForView_Custom:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            MBProgressHUD *hud = (MBProgressHUD *)subview;
            if (hud.mode == MBProgressHUDModeIndeterminate) {
                return (MBProgressHUD *)subview;
            }
            
        }
    }
    return nil;
}



//隐藏hud
+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [self HUDForView_Custom:view];
    
    if (hud != nil) {
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES];
    }
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
//设置mb偏移量
+ (void)setMBShowOffetSet:(MBProgressHUD *)hub positionENUM:(MBProgressHUBPosition )position {
    CGFloat margin = 150.0 / 667.0 *kScreenHeight ;  //距离底部和顶部的距离
    CGFloat offSetY = kScreenHeight / 2 - margin;
    
    if (position == MBProgressHUBPositionTop) {
        offSetY = -offSetY;
    }
    if (position == MBProgressHUBPositionCenter) {
        offSetY = 0;
    }
    if (position == MBProgressHUBPositionBottom) {
        offSetY = offSetY;
    }
    
    hub.yOffset = offSetY;
    
}


#pragma mark -   超时后（默认20s）自动隐藏加载提示
+ (void)hideAlertDelay {
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHUDForView:nil];
        
    });
}





@end
