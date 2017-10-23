//
//  MineTotal_Cell.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/24.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "MineTotal_Cell.h"

@implementation MineTotal_Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutAllsubViews];
    }
    return self;
}


- (void)layoutAllsubViews {
    
}

- (MineViews_MindeTotal *)minetotalView {
    if (_minetotalView) {
        
        
    }
    return _minetotalView;
}



@end
