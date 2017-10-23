//
//  Mine_FLCenter_VIew.m
//  liaosao
//
//  Created by guoxuyao on 2017/7/7.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Mine_FLCenter_VIew.h"
#define kbottomtext @"邀请说明:\n1.邀请用户充值的积分数额提现后清零\n2.邀请主拍赚取的积分数额提现后清零\n3.可提现额度为积分数额0.%\n4.1拍币等于1积分"

#define kdefaultdpace 20

#define khei_text 40
#define kwidth_TextField 150

#define kh_BT 30
#define kwidth_BT 80
@implementation Mine_FLCenter_VIew
{
    
    
}


@end


@implementation Mine_FLHeaderView

{
    UILabel *_topLabel;
    UITextField *_middleTextfield;
    UIButton *_bottomBT;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutAllsubViewS];
    }
    return self;
}


- (void)layoutAllsubViewS {
    self.backgroundColor = kFense_Color;
    _topLabel = [[UILabel alloc] init];
    _middleTextfield = [[UITextField alloc] init];
    _bottomBT = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_topLabel setLabelFont:kMax_Font color:white_color text:@"填写好友ID领取奖励VIP(3天)"];
    _topLabel.textAlignment = NSTextAlignmentCenter;
    
    _middleTextfield.placeholder = @"输入ID";
    _middleTextfield.backgroundColor = white_color;
    _middleTextfield.layer.cornerRadius = khei_text/2;
    _middleTextfield.layer.masksToBounds = YES;
    _middleTextfield.textAlignment = NSTextAlignmentCenter;
    
    
    [_bottomBT setTitle:@"领取" forState:UIControlStateNormal];
    [_bottomBT setBackgroundColor:kQingse_Color];
    _bottomBT.layer.cornerRadius = 3;
    _bottomBT.layer.masksToBounds = YES;
    [self addSubview:_topLabel];
    [self addSubview:_middleTextfield];
    [self addSubview:_bottomBT];
    
    
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kdefaultdpace);
        make.left.right.equalTo(self);
        
    }];
    
    [_middleTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_topLabel.mas_bottom).offset(kdefaultdpace);
        make.size.mas_equalTo(CGSizeMake(kwidth_TextField, khei_text));
        
    }];
    
    [_bottomBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_middleTextfield.mas_bottom).offset(kdefaultdpace);
        make.size.mas_equalTo(CGSizeMake(kwidth_BT, kh_BT));
        

    }];
    
    
    
}


@end
