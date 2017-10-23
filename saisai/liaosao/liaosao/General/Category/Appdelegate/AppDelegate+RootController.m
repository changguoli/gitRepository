//
//  AppDelegate+RootController.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/6.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "AppDelegate+RootController.h"
#import "CYLTabBarControllerConfig.h"
#import "CYLPlusButtonSubclass.h"

@implementation AppDelegate (RootController)
//- (void)setRoot
//{
//    UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:self.viewController];
//    navc.navigationBar.barTintColor = Main_Color;
//    
//    navc.navigationBar.shadowImage = [[UIImage alloc] init];
//    [navc.navigationBar setTranslucent:NO];
//    
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    
//    [navc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    navc.navigationBar.tintColor = [UIColor whiteColor];
//    self.window.rootViewController = navc;
//}
//
//- (void)setTabbarController
//{
//    HomePageViewController *school = [[HomePageViewController alloc]init];
//    AboutChildViewController *child  = [[AboutChildViewController alloc]init];
//    CommuntiyViewController *edu = [[CommuntiyViewController alloc]init];
//    SZCourseListViewController *courseList = [[SZCourseListViewController alloc]init];
//    AboutMeViewController *about = [[AboutMeViewController alloc]init];
//    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
//    [tabBarController setViewControllers:@[school,edu,child,courseList,about]];
//    self.viewController = tabBarController;
//    tabBarController.delegate = self;
//    [self customizeTabBarForController:tabBarController];
//}
//
//- (void)setAppWindows
//{
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [[UIApplication sharedApplication]setStatusBarHidden:NO];
//    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
//    
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
//}
//
//
- (void)createLoadingScrollView
{
    //引导页实例
}


/**
 *  设置根视图
 */
- (void)setRootViewController  {
   // [CYLPlusButtonSubclass registerPlusButton];
    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    self.sideViewController = [[YRSideViewController alloc] init];
    self.sideViewController.rootViewController = tabBarControllerConfig.tabBarController;
    self.sideViewController.leftViewController = leftVC;
    self.sideViewController.leftViewShowWidth = 200;
    self.sideViewController.needSwipeShowMenu = YES;
    
    [self.window setRootViewController:self.sideViewController];
    
    
}
//检查更新
- (void)checkVersion {
    
    NSString *ccc =  @"1、增加白菜党等特色标签筛选\n2、增加频道热度排行\n3、增加夜间模式\n4、Material design风格优化\n5、滑动返回优化\n6、其他bug修复";
    
    NSString *message = [[NSString alloc]initWithFormat:@"发现新版本1.1,是否更新?\n本次更新内容:\n%@",ccc];
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"升级提醒" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"暂不更新"style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"立即更新"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertVC addAction:cancelAction];
    
    [alertVC addAction:okAction];
    
   
    

    
    
        
    }
    
    
    
@end
