//
//  Forget_VC.m
//  liaosao
//
//  Created by guoxuyao on 2017/6/21.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Forget_VC.h"

@interface Forget_VC ()
@property (nonatomic,strong) ForgetView*forgetView;

@end

@implementation Forget_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationItemTitleViewWithTitle:@"找回密码"];

    self.forgetView = [[ForgetView alloc] initWithFrame:self.view.bounds];
    self.view = self.forgetView ;
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
