//
//  VC_MineAccount.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/20.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "VC_MineAccount.h"
#import "Header_Mine.h"

@interface VC_MineAccount ()

@end

@implementation VC_MineAccount

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)setupNa {
    // [self setLeftSild];
    [self setNavigationItemTitleViewWithTitle:@"我的账户"];
    [self showBackWithTitle:@""];
    
}

- (void)setupUI {
    self.GtableView = [[GBase_Tableview alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.GtableView.delegate =self;
    self.GtableView.dataSource = self;
    self.view =self.GtableView;
    self.GtableView.tableHeaderView = [self setupHeadView];
    
}

-(UIView *)setupHeadView {
    
    MineAccount_heard *head = [[MineAccount_heard alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
    return head;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineAccount_Cell *cell = [[MineAccount_Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    cell.imageView.image = [UIImage imageNamed:@"money_pai"];
    cell.textLabel.text=@"200bi+VIP";
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
