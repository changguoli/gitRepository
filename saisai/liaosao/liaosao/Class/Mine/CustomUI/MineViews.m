//
//  MineViews.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/24.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "MineViews.h"

@implementation MineViews
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


@end

@implementation MineViews_Approve
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


@end


@implementation MineViews_Public
{
    UILabel *_titleLabel;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self layoutAllSubViews];

    }
    return self;
}

-(void)layoutAllSubViews {
    
}


@end

@implementation MineViews_MindeTotal

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutAllSubViews];
    }
    return self;
    
}

- (void)layoutAllSubViews {
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.middleLabel.mas_left);
        make.top.and.bottom.equalTo(self);
        
    }];
    
    [self.middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rightLabel.mas_left);
        make.top.and.bottom.equalTo(self);
        
    }];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.middleLabel);
        make.right.equalTo(self.mas_right);
        make.top.and.bottom.equalTo(self);
        
    }];
    
    
    
    
}

- (GBaseLabel *)leftLabel {
    if (!_leftLabel) {
        _leftLabel = [[GBaseLabel alloc] init];
        [self addSubview:_leftLabel];
    }
    return _leftLabel;
}


- (GBaseLabel *)middleLabel {
    if (!_middleLabel) {
        _middleLabel = [[GBaseLabel alloc] init];
        [self addSubview:_middleLabel];
        
    }
    return _middleLabel;
}


- (GBaseLabel *)rightLabel {
    if (!_rightLabel) {
        _rightLabel = [[GBaseLabel alloc] init];
        [self addSubview:_rightLabel];
    }
    return _rightLabel;
}



@end


@implementation MineViews_MindeTotal_BottomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        [self layoutAllSubViews];

    }
    return self;
}


- (void)layoutAllSubViews {
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.leftButton setBackgroundColor:kColor_37393d];
    [self.rightButton setBackgroundColor:kColor_1f2022];
    [self.rightButton setTitle:@"提现" forState:UIControlStateNormal];
    
    self.totalLabel = [[UILabel alloc] init];
    self.totalLabel.text = @"1000W";
    self.totalLabel.textColor = white_color;
    [self addSubview:self.leftButton];
    [self addSubview:self.rightButton];
    [self.leftButton addSubview:self.totalLabel];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.mas_height);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.rightButton.mas_left);
        make.top.equalTo(self.mas_top);
        
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_width).dividedBy(4);
        make.height.equalTo(self.mas_height);
        make.right.equalTo(self.mas_right);
         make.top.equalTo(self.mas_top);
        
    }];
    
    
    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self);
        make.width.mas_lessThanOrEqualTo(200);
        make.height.equalTo(self);
    }];
    
    
}

@end


