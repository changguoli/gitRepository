//
//  MineDetail_Cell.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/14.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "MineDetail_Cell.h"
#define krightSpace 30
@implementation MineDetail_Cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self layoutAllSubViews];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *subview in self.contentView.superview.subviews) {
        if ([NSStringFromClass(subview.class) hasSuffix:@"SeparatorView"]) {
            subview.hidden = NO;
            CGRect frame = subview.frame;
            frame.origin.x += self.separatorInset.left;
            frame.size.width -= self.separatorInset.right;
            subview.frame =frame;
        }
    }
}

- (void)layoutAllSubViews{
    self.label_left = [[UILabel alloc] init];
    self.label_right = [[UILabel alloc] init];
    self.image_right = [[UIImageView alloc] init];
    
    
    
    [self.contentView addSubview:self.label_left];
    [self.contentView addSubview:self.label_right];
    [self.contentView addSubview:self.image_right];
    
//    [self.label_left mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.contentView.mas_left).offset(kSpace);
//        make.width.mas_equalTo(100);
//
//    }];
//
//    [self.label_right mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.contentView.mas_right).offset(krightSpace);
//        make.top.bottom.equalTo(self.contentView);
//    }];
//
//    [self.image_right mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.contentView.mas_right).offset(krightSpace);
//        make.top.equalTo(self.contentView).offset(kSpace);
//        make.bottom.equalTo(self.contentView).offset(-kSpace);
//
//        make.width.equalTo(self.image_right.mas_height);
//    }];
    
    
}
//设置
- (void)setViewModelDataSource:(Base_JSONModel *)model {
    self.label_left.text = @"头像";
    self.label_right.text =@"郭旭垚";    
}



@end


@implementation Mine_cell
- (void)setViewModelDataSource:(Base_JSONModel *)model {
    
    self.userImage_left.image = [UIImage imageNamed:kLove_Pic];
    self.userLabel.text = @"猜不透呀";
    self.userDetail.text = @"我的简介";
    self.VipImage.image = [UIImage imageNamed:kVipRed_Pic];
    self.level_label.text = @"LV18";
    self.rightview.hidden=YES;
    
}



@end
