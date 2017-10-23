//
//  NewStar_cell.h
//  liaosao
//
//  Created by guoxuyao on 2017/4/14.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewStar_cell : GBase_TableViewCell
@property (nonatomic,strong) UIImageView *userImage_left;
@property (nonatomic,strong) UILabel *userLabel;
@property (nonatomic,strong) UILabel *userDetail;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIImageView *VipImage;
@property (nonatomic,strong) UILabel *level_label;

@property (nonatomic,strong) UIView *rightview;
@property (nonatomic,strong) UIImageView *starImagr_right;
@property (nonatomic,strong) UILabel *number_label;
- (void)setupAllSubviews ;
@end
