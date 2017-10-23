//
//  GXYTabBarController.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/6.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GXYTabBarController.h"

@interface GXYTabBarController ()

@end

@implementation GXYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化
  //  NSUserDefaults *userCenter = [NSUserDefaults standardUserDefaults];
   
    
    /*添加子控制器 */
    /** 动态墙 */
//    [self setUpChildControllerWith:[[LiveWallVC alloc]init] norImage:[UIImage imageNamed:@"dynamic"] selImage:[self getOriginalImageWithName:@"full_dynamic"]title:@"动态墙"];
//    

    
    
    
}



//中间按钮点击事件
- (void)chickCenterButton
{
    
    

    
    
    
    
}

- (void)setUpChildControllerWith:(UIViewController *)childVc norImage:(UIImage *)norImage selImage:(UIImage *)selImage title:(NSString *)title
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    
    childVc.title = [NSString stringWithFormat:@"%@",title];
    
    childVc.tabBarItem.image = norImage;
    childVc.tabBarItem.selectedImage = selImage;
    
    [self addChildViewController:nav];
    
}
- (UIImage *)getOriginalImageWithName:(NSString *)name
{
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
