//
//  Register_VC.m
//  liaosao
//
//  Created by guoxuyao on 2017/6/21.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Register_VC.h"

@interface Register_VC ()<LoginS_Delegate>
@property (nonatomic,strong) RegisterView*RegisterView;

@end

@implementation Register_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationItemTitleViewWithTitle:@"注册"];

    self.RegisterView = [[RegisterView alloc] initWithFrame:self.view.bounds];
    self.RegisterView.loginDelegate = self;
    self.view = self.RegisterView ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginActionButton:(UIButton *)button {
    switch (button.tag) {
        case 101:
        {//确定
            [self registerPhone];
        }
            break;
        case 102:
        {//获取验证码
            
            //kregister_URL
            [self registerGetPhoneCode];
            
        }
            break;
            
        default:
            break;
    }
    
    
    
    
}

- (void)registerPhone {
    /*phone
     
     regCode
     
     uname
     
     sex
     
     password
     
     avatar_url
     
     avatar_width
     
     avatar_height
*/
    NSString *phoneStr = self.RegisterView.phoneView.rightTextFiled.text;
    NSString *codeStr = self.RegisterView.codeView.rightTextFiled.text;
    NSString *pwStr = self.RegisterView.passWordView.rightTextFiled.text;

    Logins_ViewModel *loginVM = [Logins_ViewModel modelWithViewController:self];
    
    
    NSDictionary *tempDic= @{@"login":phoneStr,
                             @"regCode":codeStr,
                             @"uname":@"",
                             @"sex":@"",
                             @"password":pwStr,
                             @"avatar_url":@"",
                             @"avatar_width":@"",
                             @"avatar_height":@""};
    
    [loginVM registerPhone:tempDic success:^(NSDictionary *dic) {
        GDBLog(@"注册成功");

    } failure:^(NSError *error) {
        
    }];
    
}


- (void)registerGetPhoneCode {
    NSString *phoneStr = self.RegisterView.phoneView.rightTextFiled.text;
    
    
    
    Logins_ViewModel *loginVM = [Logins_ViewModel modelWithViewController:self];
    NSDictionary *tempDic= @{@"login":phoneStr};
    
    [loginVM sendCodeByPhone:tempDic success:^(NSDictionary *dic) {
        GDBLog(@"验证码发送成功");
    } failure:^(NSError *error) {
        
    }];
    
    
}

@end
