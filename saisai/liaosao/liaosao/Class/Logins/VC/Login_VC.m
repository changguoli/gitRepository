//
//  Login_VC.m
//  liaosao
//
//  Created by guoxuyao on 2017/6/20.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Login_VC.h"

@interface Login_VC ()<LoginS_Delegate>
@property (nonatomic,strong) LoginViews*loginView;

@end

@implementation Login_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationItemTitleViewWithTitle:@"登录"];
    
    //这个是git修改
    //this is second change for git
    //这是第三次修改
    [self setRightItemWithTitle:@"注册" selector:@selector(tapRegisteraction:)];
    self.loginView = [[LoginViews alloc] initWithFrame:self.view.bounds];
    self.loginView.loginDelegate = self;
     self.view = self.loginView ;
    
}

#pragma  mark --LoginS_Delegate

- (void)loginActionButton:(UIButton *)button {
    switch (button.tag) {
        case 100:
            //登陆
        {
            [self.loginView.phoneView.rightTextFiled resignFirstResponder];
            [self.loginView.passWordView.rightTextFiled resignFirstResponder];
            [self loginRequest];
        }
            break;
        case 101:
            //忘记米啊吗
        {
            Forget_VC *forgetVC = [[Forget_VC alloc] init];
            [self.navigationController pushViewController:forgetVC animated:YES];
            
        }
            break;
            
        default:
            break;
    }
    
    
}

/*status = 1;
	oauth_token_secret = "fae39515ea401ef1bc7468bdca1544c4";
	uid = 2;
	oauth_token = "22c574a55e23b592d4d07c7b735f9a41";*/
- (void)loginRequest {
    NSString *phoneStr =self.loginView.phoneView.rightTextFiled.text;
    NSString *pswStr=self.loginView.passWordView.rightTextFiled.text;
    if ([NSString isEmpty:phoneStr]) {
        kShowMessage(@"账号不能为空");
        return;
    }
    
    if ([NSString isEmpty:pswStr]) {
        kShowMessage(@"密码不能为空");
        return;
    }
    
    
    NSDictionary *tempDic= @{@"login":phoneStr,
                             @"password":pswStr};
//    NSString *url = [NSString stringWithFormat:@"http://vpai.api.ha.cn/api.php?mod=%@&act=%@",phoneStr, pswStr];
    [GLNetWorkManager requestPostWithURLStr:@"http://vpai.api.ha.cn/api.php?mod=Oauth&act=authorize" parameters:tempDic finish:^(id dataDic) {
         NSLog(@"data: %@", dataDic);
        if ([[dataDic objectForKey:@"status"] integerValue] == 1) {
            //登陆成功
            Logins_Model *model = [[Logins_Model alloc] initWithDictionary:dataDic error:nil];
            [DataInfo_UserDefaults setAuthDic:model];
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            kShowMessage([dataDic objectForKey:@"msg"]);
        }
    } enError:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
 /* 窑子代码
    Logins_ViewModel *loginmodel = [Logins_ViewModel modelWithViewController:self];
    
    [loginmodel loginin:tempDic success:^(NSDictionary *dic) {
        GDBLog(@"di%@",dic);
        //登陆成功
        Logins_Model *model = [[Logins_Model alloc] initWithDictionary:dic error:nil];
        [DataInfo_UserDefaults setAuthDic:model];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
    } failure:^(NSError *error) {
        NSLog(@"error--:%@", error);
    }];
 */
    
    
    
}


- (void)tapRegisteraction:(UIButton *)button {
    Register_VC *registerVC = [[Register_VC alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
    
    
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
