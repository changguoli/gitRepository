//
//  ImageTFVIew.m
//  liaosao
//
//  Created by guoxuyao on 2017/6/21.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "ImageTFVIew.h"
#define kheight  40


#define kwidth 15

@implementation ImageTFVIew


- (void)layoutAllSubViews {
    self.backgroundColor = white_color;
    
    self.leftImageView = [[UIImageView alloc] init];
    self.rightTextFiled = [[UITextField alloc] init];
    self.leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:self.leftImageView];
    [self addSubview:self.rightTextFiled];
    
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kSpace);
        make.width.mas_equalTo(kwidth);
        make.top.equalTo(self).offset(kSpace);
        make.bottom.equalTo(self).offset(-kSpace);
        
    }];
    
    
    [self.rightTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImageView.mas_right).offset(kSpace);
        make.height.equalTo(self);
        make.top.equalTo(self);
        make.right.equalTo(self);
        
    }];
    
    
    
    
    
    
}


- (void)setImage:(NSString *)imageStr textFieldText:(NSString *)textStr {
    self.leftImageView.image = [UIImage imageNamed:imageStr];
    self.rightTextFiled.placeholder = textStr;
    
    
    
}


@end
#define kwidth_BT 100

@implementation ImageTFRightBT



- (void)layoutAllSubViews {
    
    [super layoutAllSubViews];
    
    
    self.rightT = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightT setTitle:@"发送验证码" forState:UIControlStateNormal];
    [self.rightT setTitleColor:blue_color forState:UIControlStateNormal];
    self.rightT.titleLabel.font = kMiddle_Font;
    [self addSubview:self.rightT];
    
    [self.rightT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rightTextFiled);
        make.height.equalTo(self);
        make.top.equalTo(self);
        make.width.mas_equalTo(kwidth_BT);
        
    }];
    
    
}






@end
