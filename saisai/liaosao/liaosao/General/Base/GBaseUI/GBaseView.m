//
//  GBaseView.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBaseView.h"

@implementation GBaseView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self layoutAllSubViews];

    }
    return self;
    
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutAllSubViews];
    }
    return self;
    
    
}


- (void)layoutAllSubViews {
    
}


@end
