//
//  LeftViewController.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/11.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "LeftViewController.h"

static NSString *const MineCellIdentifier = @"left_cell" ;


#define title_Arr @[@"我的账户",@"签到",@"分享",@"帮助",@"设置"]
#define pic_Arr  @[@"money",@"set",@"v",@"dedication",@"feedback"]


@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.GtableView = [[GBase_Tableview alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.GtableView.delegate =self;
    self.GtableView.dataSource = self;
    [self.GtableView registerClass:[MineDetail_Cell class] forCellReuseIdentifier:MineCellIdentifier];
    self.view =self.GtableView;

}

#pragma mark-- UITableViewDelegate,UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return title_Arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineDetail_Cell *cell = [[MineDetail_Cell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MineCellIdentifier];
    cell.textLabel.text = title_Arr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:pic_Arr[indexPath.row]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    MineDetail_model *model;
    [cell setViewModelDataSource:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
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
