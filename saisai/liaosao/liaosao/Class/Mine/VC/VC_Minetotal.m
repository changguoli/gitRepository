//
//  VC_Minetotal.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/20.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "VC_Minetotal.h"
#import "MineViews.h"

@interface VC_Minetotal ()

@end

@implementation VC_Minetotal

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupNa {
    // [self setLeftSild];
    [self setNavigationItemTitleViewWithTitle:@"我的积分"];
    [self showBackWithTitle:@""];
    
}

- (void)setupUI {
    self.GtableView = [[GBase_Tableview alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.GtableView.delegate =self;
    self.GtableView.dataSource = self;
    [self.view addSubview:self.GtableView];
    
    MineViews_MindeTotal_BottomView *bottomView = [[MineViews_MindeTotal_BottomView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-50-64, kScreenWidth, 50)];
    [self.view addSubview:bottomView];
    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineDetail_Cell *cell = [[MineDetail_Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    cell.label_left.text = @"ca";

    cell.label_left.text = @"ca";

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    MineDetail_model *model;
    [cell setViewModelDataSource:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
