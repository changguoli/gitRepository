//
//  GBase_TableViewCell.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/28.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Base_JSONModel;
@interface GBase_TableViewCell : UITableViewCell
- (void)setViewModelDataSource:(Base_JSONModel *)model;
@end
