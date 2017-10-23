//
//  VC_welfare.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/20.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "VC_welfare.h"
#import "Mine_WelfareCell.h"
#import "Mine_FLCenter_VIew.h" //头

#define kwelfareArr @[@"",@"",@"",@""]


#define kBottom_Label @"邀请说明：\n1.邀请用户充值的积分数额提现后清零\n2.邀请主拍赚取的积分数额提现后清零\n3.可提现额度为积分数额0.1%\n4.1拍币等于1积分"

static NSString *const MyCellIdentifier = @"welfare_cell" ;

@interface VC_welfare ()

@end

@implementation VC_welfare

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)setupNa {
    // [self setLeftSild];
    [self setNavigationItemTitleViewWithTitle:@"福利中心"];
    
    
}

- (void)setupUI {
    self.GtableView = [[GBase_Tableview alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.GtableView.delegate =self;
    self.GtableView.dataSource = self;
    self.view =self.GtableView;
    [self.GtableView registerClass:[Mine_WelfareCell class] forCellReuseIdentifier:MyCellIdentifier];
    
    CGRect rect = CGRectMake(0, 0, kScreenWidth, 160);
    Mine_FLHeaderView *headerView = [[Mine_FLHeaderView alloc] initWithFrame:rect];
    self.GtableView.tableHeaderView = headerView;
    
    [self setupFootView];
    
}

- (void)setupFootView {
    CGSize size = [ kBottom_Label  textSizeIn:CGSizeMake(kScreenWidth-kMiddleSpace, MAXFLOAT) font:kMax_Font];
    
    
    UILabel *footLabel = [[UILabel alloc] initWithFrame:CGRectMake(kMiddleSpace, 0, kScreenWidth-2*kMiddleSpace, size.height+20)];
    footLabel.numberOfLines = 0;
    [footLabel setLabelFont:kMax_Font color:kShenFS_Color text:kBottom_Label];
    
    self.GtableView.tableFooterView = footLabel;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Mine_WelfareCell *cell = [[Mine_WelfareCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyCellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text =@"测试";
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
