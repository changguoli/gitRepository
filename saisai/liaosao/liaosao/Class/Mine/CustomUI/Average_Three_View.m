//
//  Average_Three_View.m
//  liaosao
//
//  Created by guoxuyao on 2017/7/9.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Average_Three_View.h"
#define kwidth_ALl  kScreenWidth/3.0

@implementation Average_Three_View


- (instancetype)init {
    self = [super init];
    if (self) {
        [self layoutAllSubViews];
 
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self  =[super initWithFrame:frame];
    if (self) {
        [self layoutAllSubViews];
    }
    return self;
    
    
    
}


- (void)layoutAllSubViews {
    self.leftLabel = [[UILabel alloc] init];
    self.middleLabel = [[UILabel alloc] init];
    self.rightLabel = [[UILabel alloc] init];
    
    [self addSubview:self.leftLabel];
    [self addSubview:self.middleLabel];
    [self addSubview:self.rightLabel];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(kwidth_ALl);
        
    }];
    
    
    [self.middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.leftLabel.mas_right);
        make.width.mas_equalTo(kwidth_ALl);
    }];
    
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.middleLabel.mas_right);
        make.width.mas_equalTo(kwidth_ALl);
    }];
    
    
    
}




@end

@implementation Average_ThreeImage_View


- (instancetype)init {
    self = [super init];
    if (self) {
        [self layoutAllSubViews];
        
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self  =[super initWithFrame:frame];
    if (self) {
        [self layoutAllSubViews];
    }
    return self;
    
    
    
}


- (void)layoutAllSubViews {
    self.leftImage = [[UIImageView alloc] init];
    self.middleLabel = [[UILabel alloc] init];
    self.rightLabel = [[UILabel alloc] init];
    
    [self addSubview:self.leftImage];
    [self addSubview:self.middleLabel];
    [self addSubview:self.rightLabel];
    
    [self.leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(kwidth_ALl);
        
    }];
    
    
    [self.middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.leftImage.mas_right);
        make.width.mas_equalTo(kwidth_ALl);
    }];
    
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.middleLabel.mas_right);
        make.width.mas_equalTo(kwidth_ALl);
    }];
    
    
    
}




@end
