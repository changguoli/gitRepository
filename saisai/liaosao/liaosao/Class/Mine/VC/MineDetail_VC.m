//
//  MineDetail_VC.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/14.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "MineDetail_VC.h"
#import "Header_Mine.h"
#import "Base_RTRootNavigationController.h"

#import "Login_VC.h"
static NSString *const MineCellIdentifier = @"Mine_cell" ;


#define kLeftArr @[@"头像",@"昵称",@"简介",@"性别",@"城市",@"绑定手机",@"清除缓存"]

@interface MineDetail_VC ()

@end

@implementation MineDetail_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self setupNa];
//    [self setupUI];
//    [self setTableViewFootView];
}

- (void)setupNa {
   // [self setLeftSild];
    [self setNavigationItemTitleViewWithTitle:@"个人信息"];

    
}

- (void)setupUI {
    self.GtableView = [[GBase_Tableview alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.GtableView.delegate =self;
    self.GtableView.dataSource = self;
    [self.GtableView registerClass:[MineDetail_Cell class] forCellReuseIdentifier:MineCellIdentifier];
    self.GtableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.view =self.GtableView;
    [self setTableViewFootView];
}
- (void)setTableViewFootView {
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
    
    UIButton *bottomBT  = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect rect = CGRectMake(kSpace_max, 10, kScreenWidth - kSpace_max*2, 40);
    bottomBT.frame = rect;
    
    [bottomBT setBackgroundColor:red_color];
    bottomBT.layer.cornerRadius = 3;
    bottomBT.layer.masksToBounds = YES;
    [bottomBT setTitle:@"退出登录" forState:UIControlStateNormal];
    [bottomBT addTarget:self action:@selector(tapBTAction:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:bottomBT];
    self.GtableView.tableFooterView = footView;
    
    
}

- (void)tapBTAction:(UIButton *)sender {
    
        Login_VC *logonVC = [[Login_VC alloc] init];
        Base_RTRootNavigationController *na = [[Base_RTRootNavigationController alloc] initWithRootViewController:logonVC];
        [self presentViewController:na animated:YES completion:nil];
    
    
//    Logins_ViewModel *loginsVM = [Logins_ViewModel modelWithViewController:self];
//    NSDictionary *dataDic = @{@"login":[DataInfo_UserDefaults getUidFromModel],
//                              };
//    WS(weakSelf)
//    [loginsVM loginout:dataDic success:^(NSDictionary *dic) {
//
//        [weakSelf loginOUtAction];
//
//    } failure:^(NSError *error) {
//       [weakSelf loginOUtAction];
//    }];
    
}


- (void)loginOUtAction {
    Login_VC *logonVC = [[Login_VC alloc] init];
    [self.navigationController pushViewController:logonVC animated:YES];
    [self clearAllUserDefaultsData];
    
    //模态退出登录
//    Login_VC *logonVC = [[Login_VC alloc] init];
//    Base_RTRootNavigationController *na = [[Base_RTRootNavigationController alloc] initWithRootViewController:logonVC];
//    [self presentViewController:na animated:YES completion:nil];
}

#pragma mark-- UITableViewDelegate,UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kLeftArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineDetail_Cell *cell = [[MineDetail_Cell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MineCellIdentifier];
    cell.textLabel.text = kLeftArr[indexPath.row];
    cell.detailTextLabel.text = kLeftArr[indexPath.row];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    MineDetail_model *model;
    [cell setViewModelDataSource:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
