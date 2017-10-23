//
//  News_Cell.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/19.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "News_Cell.h"

@implementation News_Cell


- (void)setViewModelDataSource:(Base_JSONModel *)model {
    
    self.userImage_left.image = [UIImage imageNamed:kLove_Pic];
    self.userLabel.text = @"猜不透啊";
    self.userDetail.text = @"我的简介";
    self.VipImage.image = [UIImage imageNamed:kVipRed_Pic];
    self.level_label.text = @"LV18";
    self.rightview.hidden=YES;
    
}


@end
