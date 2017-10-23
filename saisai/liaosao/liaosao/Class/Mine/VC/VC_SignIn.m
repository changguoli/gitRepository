//
//  VC_SignIn.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/20.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "VC_SignIn.h"
#import "GAnimation.h"

@interface VC_SignIn ()
@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation VC_SignIn

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupNa {
    // [self setLeftSild];
    [self setNavigationItemTitleViewWithTitle:@"签到"];
    
    
    
}
#define kTop 50

#define kspaces 80
- (void)setupUI {
    //背景
    UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    self.view= bgImage;
    bgImage.userInteractionEnabled = YES;
    //顶部视图
    UIImageView *topImage=  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"prompt"]];
    topImage.frame = CGRectMake(0, 0, kScreenWidth, kTop);
    [self.view addSubview:topImage];
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth-20, 40)];
    self.textLabel.text = @"已经连续签到好几年了";
    [self.view addSubview:self.textLabel];
    //签到按钮
    GBase_Button *buttonQD = [GBase_Button imageButtonWithTarget:self action:@selector(tapBT:) image:@"set_up" highLightImage:@"set_down"];
    [self.view addSubview:buttonQD];

    [buttonQD mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(topImage.mas_bottom).offset(kspaces);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    
    //视图
    
    self.imageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"set_time"]];
    [self.view addSubview:self.imageView];

    [ self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(buttonQD.mas_bottom).offset(kspaces);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);

    }];

    
}

-(void)tapBT:(id)sender {
    
    [GAnimation animationExplosion:sender];
    self.imageView.image =[UIImage imageNamed:@"set_time_one"];

    
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
