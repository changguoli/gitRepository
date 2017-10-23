//
//  MineDetail_Cell.h
//  liaosao
//
//  Created by guoxuyao on 2017/4/14.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBase_TableViewCell.h"
#import "NewStar_cell.h"
@interface MineDetail_Cell : GBase_TableViewCell
@property (nonatomic,strong) UILabel *label_left;
@property (nonatomic,strong) UILabel *label_right;
@property (nonatomic,strong) UIImageView *image_right;
@end

@interface Mine_cell : NewStar_cell

@end

