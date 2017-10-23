//
//  MineAccount_heard.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/21.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "MineAccount_heard.h"
#define ktop_bottom 30
#define klabel_top 20
#define klabel_bottom 30

@implementation MineAccount_heard


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutAllSubViews];
        
    }
    return self;
}


- (void)layoutAllSubViews {
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_account"]];
    
    UIView *bgView= [[UIView alloc] init];
    self.left_image = [[UIImageView alloc] init];
    self.right_Label = [[UILabel alloc] init];
    self.money_Label = [[UILabel alloc] init];
    
    self.left_image.image = [UIImage imageNamed:@"money_pai"];
    self.right_Label.text  =@"排比";
    self.right_Label.textColor = white_color;
    self.money_Label.font = KFon_B(25);
    self.money_Label.text = @"10000";
    self.money_Label.textColor = white_color;
    [self addSubview:bgView];
    [bgView addSubview:self.left_image];
    [bgView addSubview:self.right_Label];

    [self addSubview:self.money_Label];
  
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@[self,self.money_Label]);
        make.top.equalTo(self.mas_top).offset(ktop_bottom);
        make.height.mas_equalTo(klabel_top);
        
        
    }];
    
    [self.left_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left);
        make.height.equalTo(bgView.mas_height);
        make.top.equalTo(@[self.right_Label,bgView]);
        
    }];
    
    [self.right_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bgView.mas_right);
        make.left.equalTo(self.left_image.mas_right).offset(kSpace_min);
        make.height.mas_equalTo(klabel_top);
    }];

    
    [self.money_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(klabel_bottom);
        make.top.equalTo(bgView.mas_bottom).offset(kSpace);

    }];
    
    
    
    
    
    
    
    
}


@end
