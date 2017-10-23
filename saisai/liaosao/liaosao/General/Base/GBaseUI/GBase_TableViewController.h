//
//  GBase_TableViewController.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/29.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBaseViewController.h"

@interface GBase_TableViewController : GBaseViewController


@property (nonatomic,strong) UITableView *tableview;

#pragma mark - 返回顶部
- (void)showBackToTopBtn;//显示返回顶部按钮
- (void)hideBackToTopBtn;//隐藏返回顶部按钮


@end
