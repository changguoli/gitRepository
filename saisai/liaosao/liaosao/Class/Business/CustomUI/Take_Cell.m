//
//  Take_Cell.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/19.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Take_Cell.h"

@implementation Take_Cell
- (void)setupAllSubviews{
    [super setupAllSubviews];
    
    self.timeImage = [[UIImageView alloc] init];
    self.timelabel = [[UILabel alloc] init];
    
    [self.rightview addSubview:self.timeImage];
    [self.rightview addSubview:self.timelabel];
    
    
    [self.timeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.timelabel.mas_left).offset(-kSpace_min);
        make.width.height.mas_equalTo(20);
        make.top.equalTo( self.rightview);
    }];
    [self.timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo( self.rightview.mas_right);
        make.centerY.equalTo( self.rightview.mas_centerY);
    }];

    
    
}

- (void)setViewModelDataSource:(Base_JSONModel *)model {
    
    self.userImage_left.image = [UIImage imageNamed:kLove_Pic];
    self.userLabel.text = @"猜不透啊";
    self.userDetail.text = @"我的简介";
    self.VipImage.image = [UIImage imageNamed:kLove_Pic];
    self.level_label.text = @"LV18";
    
    self.timeImage.image = [UIImage imageNamed:kTime_Pic];
    self.timelabel.text = @"100天";
}


@end
