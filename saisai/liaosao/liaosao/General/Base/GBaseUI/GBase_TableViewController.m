//
//  GBase_TableViewController.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/29.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBase_TableViewController.h"

@interface GBase_TableViewController ()
@property (nonatomic,strong) UIButton *backToTopBtn;//返回顶部按钮


@end

@implementation GBase_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - 返回顶部

//显示返回顶部按钮
- (void)showBackToTopBtn {
    if (nil == _backToTopBtn) {
        _backToTopBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 36 - 20, self.view.frame.size.height - 20 - 36, 36, 36)];
        [_backToTopBtn setBackgroundImage:[UIImage imageNamed:@"back_to_top"] forState:UIControlStateNormal];
        [_backToTopBtn addTarget:self action:@selector(onBackToTopBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backToTopBtn];
        
    }
    else{
        [self.view bringSubviewToFront:_backToTopBtn];
    }
    
    _backToTopBtn.alpha = 0.0f;
    [UIView animateWithDuration:0.3 animations:^{
        _backToTopBtn.alpha = 1.0;
    }];
}

//隐藏返回顶部按钮
- (void)hideBackToTopBtn {
    [UIView animateWithDuration:0.3 animations:^{
        _backToTopBtn.alpha = 0.0;
    }];
}

//返回顶部事件
- (void)onBackToTopBtnClick {
    [self.tableview setContentOffset:CGPointMake(0, -self.tableview.contentInset.top) animated:YES];
}

#pragma mark - 懒加载

- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _tableview.backgroundColor = [UIColor clearColor];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}


@end
