//
//  Forget_VC.m
//  liaosao
//
//  Created by guoxuyao on 2017/6/21.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Forget_VC.h"

@interface Forget_VC ()<LoginS_Delegate>
@property (nonatomic,strong) ForgetView*forgetView;

@end

@implementation Forget_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationItemTitleViewWithTitle:@"找回密码"];

    self.forgetView = [[ForgetView alloc] initWithFrame:self.view.bounds];
    self.forgetView.loginDelegate = self;
    self.view = self.forgetView ;
}

- (void)loginActionButton:(UIButton *)button {
    switch (button.tag) {
        case 102:
        {//获取验证码
            [self sendPhoneCode];
        }
            break;
        case 103:
        {//确定
            [self saveUserPasswordByPhone];
        }
            break;
        default:
            break;
    }
}
//发送验证码
- (void)sendPhoneCode {
    NSString *phoneStr = self.forgetView.phoneView.rightTextFiled.text;
    NSDictionary *tempDic= @{@"login":phoneStr};
    [GLNetWorkManager requestPostWithURLStr:KURL_API(@"sendCodeByPhone") parameters:tempDic finish:^(id dataDic) {
        NSLog(@"data: %@", dataDic);
    } enError:^(NSError *error) {
        
    }];
}
//保存新密码
- (void)saveUserPasswordByPhone {
    NSString *phoneStr = self.forgetView.phoneView.rightTextFiled.text;
    NSString *codeStr = self.forgetView.codeView.rightTextFiled.text;
    NSString *pwStr = self.forgetView.passWordView.rightTextFiled.text;
    NSDictionary *tempDic = @{@"login":phoneStr,
                              @"password":pwStr,
                              @"code":codeStr
                              };
    [GLNetWorkManager requestPostWithURLStr:KURL_API(@"saveUserPasswordByPhone") parameters:tempDic finish:^(id dataDic) {
        
    } enError:^(NSError *error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
