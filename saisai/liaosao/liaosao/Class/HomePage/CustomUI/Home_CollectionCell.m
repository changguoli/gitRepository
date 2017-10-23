//
//  Home_CollectionCell.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/10.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Home_CollectionCell.h"

@implementation Home_CollectionCell



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor randomColor_Custom];
        [self layoutSubViews_home];
    }
    
    return self;
    
}

- (void)layoutSubViews_home {
    [self.contentView addSubview:self.pictureView];
    [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.pictureView.superview);
    }];
}



- (UIImageView *)pictureView {
    if (!_pictureView) {
        _pictureView = [[UIImageView alloc] init];
    }
    return _pictureView;
    
}



@end

