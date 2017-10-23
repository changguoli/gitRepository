//
//  GBaseTabarView.m
//  liaosao
//
//  Created by guoxuyao on 2017/7/11.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBaseTabarView.h"
#import "AppDelegate+Service.h"

@interface GBaseTabarView ()

@end

@implementation GBaseTabarView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
    if ([viewController isEqual:[tabBarController.viewControllers objectAtIndex:4]]) {
        
       
        
        
    }
    
    //    if ([viewController isEqual:[tabBarController.viewControllers objectAtIndex:2]]) {
    //
    //        //如果未登陆
    //        if (![DataInfo_UserDefaults isLogin]) {
    //            [app gotoLoginViewController:(UINavigationController *)viewController];
    //
    //        }
    //
    //        
    //    }
    //
    
}


@end
