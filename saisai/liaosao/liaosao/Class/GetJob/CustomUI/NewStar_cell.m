//
//  NewStar_cell.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/14.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "NewStar_cell.h"
#define kCellHeight 70
#define kimageHeight 60

#define kspace_right 15

#define kspace_top 15 //其他头部

@implementation NewStar_cell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupAllSubviews];
    }
    return self;
}

- (void)setupAllSubviews {
    self.userImage_left = [[UIImageView alloc] init];
    self.userLabel = [[UILabel alloc] init];
    self.userLabel.font = KFon_B(20);
    
    self.userDetail = [[ UILabel alloc] init];
    self.userDetail.font = kMiddle_Font;
    self.userDetail.textColor = [UIColor grayColor];
    
    self.bgView = [[UIView alloc] init];
    self.VipImage = [[UIImageView alloc] init];
    self.level_label = [[UILabel alloc] init];
    self.level_label.textColor = [UIColor redColor];
    self.level_label.font=kMin_Font;
    
    self.rightview = [[UIView alloc] init];
    self.starImagr_right = [[UIImageView alloc] init];
    self.number_label = [[UILabel alloc] init];
    self.number_label.font = kMin_Font;
    
    [self.contentView addSubview:self.userImage_left];
    [self.contentView addSubview:self.userLabel];
    [self.contentView addSubview:self.userDetail];
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.VipImage];
    [self.bgView addSubview:self.level_label];
    
    [self.contentView addSubview: self.rightview];
    [ self.rightview addSubview:self.starImagr_right];
    [ self.rightview addSubview:self.number_label];
    
    
    [self.userImage_left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kSpace);
        make.height.width.mas_equalTo(kimageHeight);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userImage_left.mas_right).offset(kSpace_min);
        make.top.equalTo(self.contentView.mas_top).offset(kspace_top);
    
    }];
    [self.userDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userLabel);
        make.top.equalTo(self.userLabel.mas_bottom).offset(kSpace_min);
    }];
    
    [self.VipImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.bgView);
        make.height.width.equalTo(self.bgView.mas_height);
    }];
    
    [self.level_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgView);
        make.left.equalTo(self.VipImage.mas_right).offset(kSpace_min);
        
    }];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.userLabel.mas_height);
        make.top.equalTo(self.contentView.mas_top).offset(kspace_top);
        make.left.equalTo(self.userLabel.mas_right).offset(kSpace_min);
    }];
  
    
    [self.starImagr_right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.number_label.mas_left).offset(-kSpace_min);
        make.width.height.mas_equalTo(20);
        make.top.equalTo( self.rightview);
    }];
    [self.number_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo( self.rightview.mas_right);
        make.centerY.equalTo( self.rightview.mas_centerY);
    }];
    
    [ self.rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-kspace_right);
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(20);
        
    }];
}


- (void)setViewModelDataSource:(Base_JSONModel *)model {

    self.userImage_left.image = [UIImage imageNamed:kLove_Pic];
    self.userLabel.text = @"猜不透啊";
    self.userDetail.text = @"我的简介";
    self.VipImage.image = [UIImage imageNamed:kVipYellow_Pic];
    self.level_label.text = @"LV18";
    
    self.starImagr_right.image = [UIImage imageNamed:kLove_Pic];
    self.number_label.text= @"1000+";
}



@end
