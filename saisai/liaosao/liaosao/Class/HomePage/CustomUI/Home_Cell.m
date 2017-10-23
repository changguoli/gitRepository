//
//  Home_Cell.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/28.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Home_Cell.h"
#import "Home_Model.h"

@implementation Home_Cell
{
    UILabel *_label;
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        _label.numberOfLines = 0;
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top);
            make.bottom.equalTo(self.contentView.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
  
        }];
        
        
    }
    return self;
}

- (void)configure:(UITableViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath
{
    Home_Model *model = (Home_Model *)obj ;
    //  BQCell *mycell = (BQCell *)cell ;
    _label.text = model.str ;
    
   }


@end
