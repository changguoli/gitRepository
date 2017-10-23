//
//  HomeDetail_Scrollview.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/12.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "HomeDetail_Scrollview.h"

@implementation HomeDetail_Scrollview

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutAllSubViews];
       
        
    }
    return self;
}
- (void)layoutAllSubViews {
    self.pictureImageView = [[UIImageView alloc] init];
    [self addSubview:self.pictureImageView];
    self.backgroundColor = [UIColor blackColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap];
    
}

- (void)tapAction:(id)sender {
    if (self.tapAction) {
        self.tapAction();
    }
}

- (void)setImageFrame:(CGRect)ImageFrame {
    _ImageFrame = ImageFrame;
    self.pictureImageView.frame = ImageFrame;
    [self updateConstraints];
   
}


@end
