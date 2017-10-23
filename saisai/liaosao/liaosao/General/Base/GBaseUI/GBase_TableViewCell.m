//
//  GBase_TableViewCell.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/28.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBase_TableViewCell.h"

@implementation GBase_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
  
    }
    return self;
}

- (void)setViewModelDataSource:(Base_JSONModel *)model {
    
}


//对于列表  尽量使用懒加载
@end
