//
//  MineAccount_Cell.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/21.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "MineAccount_Cell.h"

@implementation MineAccount_Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self layoutAllSubViews];
    }
    return self;
}

- (void)layoutAllSubViews {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:15.0]; //设置矩形四个圆角半径
    //边框宽度
    [button.layer setBorderWidth:1.0];
    button.layer.borderColor=[UIColor redColor].CGColor;
    [button setTitle:@"¥3元" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-kSpace);
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.centerY.equalTo(self.contentView);
        
    }];
    
    
}
- (void)tapButton:(id)sender {
    
}


@end
