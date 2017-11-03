//
//  VC_Approve.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/20.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "VC_Approve.h"
#import "Mine_ZbRZ_View.h"

@interface VC_Approve ()

@end

@implementation VC_Approve

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupNa {
    // [self setLeftSild];
    [self setNavigationItemTitleViewWithTitle:@"主拍认证"];
    [self showBackWithTitle:@""];
    
}

- (void)setupUI {
    
    Mine_ZbRZ_View *zbView = [[Mine_ZbRZ_View alloc] init];
    zbView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-64);
    self.view = zbView;
    
    
    
    
    
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
