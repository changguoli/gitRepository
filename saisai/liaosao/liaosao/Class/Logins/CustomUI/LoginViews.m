//
//  LoginViews.m
//  liaosao
//
//  Created by guoxuyao on 2017/6/21.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "LoginViews.h"

#define  kspace_Top 40

#define kspace_Height 60

@implementation LoginViews
{
    UIButton *_forgetBT;
    
}
- (void)layoutAllSubViews {
    self.backgroundColor = kWhiteGay_Color;
    
    
    self.phoneView  = [[ImageTFVIew alloc] init];
    self.passWordView = [[ImageTFVIew alloc] init];
    self.bottomBT = [UIButton buttonWithType:UIButtonTypeCustom];
    _forgetBT = [UIButton buttonWithType:UIButtonTypeCustom];
    //iphone  password verification-code eyes eyes_no
    [self.phoneView setImage:@"iphone" textFieldText:@"请输入手机号"];
    [self.passWordView setImage:@"password" textFieldText:@"请输入密码"];
    [self.bottomBT setTitle:@"登陆" forState:UIControlStateNormal];
    [self.bottomBT setBackgroundColor:kFense_Color];
    [_forgetBT setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [_forgetBT setTitleColor:kHuise_Color forState:UIControlStateNormal];
    
    [self.bottomBT addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.bottomBT.tag = 100;
    _forgetBT.tag =101;
    
    [_forgetBT addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    

    
    [self addSubview:self.phoneView];
    [self addSubview:self.passWordView];
    [self addSubview:self.bottomBT];
    [self addSubview:_forgetBT];
    
    
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kspace_Top);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(kspace_Height);
  
    }];
    
    [self.passWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom).offset(1);
        make.left.right.equalTo(self);
        make.height.equalTo(self.phoneView);
        
    }];
    
    [self.bottomBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passWordView.mas_bottom).offset(kSpace_middle);
        make.left.equalTo(self).offset(kSpace_middle);
        make.right.equalTo(self).offset(-kSpace_middle);
        make.height.mas_equalTo(kspace_Top);
        
    }];
    
    
    [_forgetBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bottomBT);
        make.height.mas_equalTo(kspace_Top);
        make.top.equalTo(self.bottomBT.mas_bottom);
    }];
    
    
    
    
}

- (void)tapAction:(id)sender {
    if (self.loginDelegate && [self.loginDelegate respondsToSelector:@selector(loginActionButton:)]) {
        [self.loginDelegate loginActionButton:sender];
        
    }
    
    
}

@end


@implementation RegisterView


- (void)layoutAllSubViews {
    self.backgroundColor = kWhiteGay_Color;

    self.phoneView  = [[ImageTFVIew alloc] init];
    self.codeView = [[ImageTFRightBT alloc] init];
    self.passWordView = [[ImageTFVIew alloc] init];
    self.bottomBT = [UIButton buttonWithType:UIButtonTypeCustom];

    
    [self.phoneView setImage:@"iphone" textFieldText:@"请输入手机号"];
    
    [self.passWordView setImage:@"password" textFieldText:@"请输入密码"];
    [self.codeView setImage:@"verification-code" textFieldText:@"请输入验证码"];
    [self.bottomBT setTitle:@"确认" forState:UIControlStateNormal];
    [self.bottomBT setBackgroundColor:kFense_Color];
     [self.bottomBT addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    self.bottomBT.tag = 101;
    self.codeView.rightT.tag =102;
    
     [self.codeView.rightT addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.phoneView];
    [self addSubview:self.codeView];
    [self addSubview:self.passWordView];
    [self addSubview:self.bottomBT];

    
    
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kspace_Top);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(kspace_Height);

        
    }];
    
    [self.codeView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom).offset(1);
        make.left.right.equalTo(self);
        make.height.equalTo(self.phoneView);
        
    }];
    
    [self.passWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeView.mas_bottom).offset(1);
        make.left.right.equalTo(self);
        make.height.equalTo(self.phoneView);
        
    }];
    [self.bottomBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passWordView.mas_bottom).offset(kSpace_middle);
        make.left.equalTo(self).offset(kSpace_middle);
        make.right.equalTo(self).offset(-kSpace_middle);
        make.height.mas_equalTo(kspace_Top);
        
    }];
    


}


- (void)tapAction:(id)sender {
    if (self.loginDelegate && [self.loginDelegate respondsToSelector:@selector(loginActionButton:)]) {
        [self.loginDelegate loginActionButton:sender];
        
    }
    
    
}

@end


@implementation ForgetView


- (void)layoutAllSubViews {
    self.backgroundColor = kWhiteGay_Color;

    self.phoneView  = [[ImageTFVIew alloc] init];
    self.codeView = [[ImageTFRightBT alloc] init];
    self.passWordView = [[ImageTFVIew alloc] init];
    
    self.bottomBT = [UIButton buttonWithType:UIButtonTypeCustom];

    [self.phoneView setImage:@"iphone" textFieldText:@"请输入手机号"];
    [self.passWordView setImage:@"password" textFieldText:@"请输入密码"];
    [self.codeView setImage:@"verification-code" textFieldText:@"请输入验证码"];
    [self.bottomBT setTitle:@"注册" forState:UIControlStateNormal];
    [self.bottomBT setBackgroundColor:kFense_Color];
    
     [self.bottomBT addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    self.bottomBT.tag = 103;
    self.codeView.rightT.tag =102;
    
    [self.codeView.rightT addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    

    
    [self addSubview:self.phoneView];
    [self addSubview:self.codeView];
    [self addSubview:self.passWordView];
    [self addSubview:self.bottomBT];

    
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kspace_Top);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(kspace_Height);

        
    }];
    
    [self.codeView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom).offset(1);
        make.left.right.equalTo(self);
        make.height.equalTo(self.phoneView);
        

        
    }];
    
    [self.passWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeView.mas_bottom).offset(1);
        make.left.right.equalTo(self);
        make.height.equalTo(self.phoneView);
        
    }];
    
    [self.bottomBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passWordView.mas_bottom).offset(kSpace_middle);
        make.left.equalTo(self).offset(kSpace_middle);
        make.right.equalTo(self).offset(-kSpace_middle);
        make.height.mas_equalTo(kspace_Top);
        
    }];
    




}


- (void)tapAction:(id)sender {
    if (self.loginDelegate && [self.loginDelegate respondsToSelector:@selector(loginActionButton:)]) {
        [self.loginDelegate loginActionButton:sender];
        
    }
    
    
}

@end

