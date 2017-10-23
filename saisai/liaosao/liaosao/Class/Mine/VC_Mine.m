//
//  VC_Mine.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "VC_Mine.h"
#define title_Arr @[@"",@"我的相册",@"我的账户",@"主拍认证",@"福利中心",@"我的积分",@"签到"]
#define pic_Arr  @[@"",@"photos",@"money",@"v",@"dedication",@"feedback",@"set"]

//vcname
#define vcName_Arr @[@"MineDetail_VC",@"VC_MinePic",@"VC_MineAccount",@"VC_Approve",@"VC_welfare",@"VC_Minetotal",@"VC_SignIn"]

@interface VC_Mine ()

@end

@implementation VC_Mine

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupNa {
    [self setLeftSild];

}

- (void)setupUI {
    self.GtableView = [[GBase_Tableview alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.GtableView.delegate =self;
    self.GtableView.dataSource = self;
    self.view =self.GtableView;
    
}
#pragma mark-- UITableViewDelegate,UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            Mine_cell *cell = [[Mine_cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            Mine_model *model ;
            [cell setViewModelDataSource:model];
            return cell;
            
        }
            
            break;
       
            
            break;
            
        default:
        {
            GBase_TableViewCell *cell = [[GBase_TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
            cell.imageView.image = [UIImage imageNamed:pic_Arr[indexPath.row]];
            cell.textLabel.text = title_Arr[indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            Mine_model *model ;
            [cell setViewModelDataSource:model];
            return cell;

        }
            break;
    }
        return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self pushToNewVCIndex:indexPath.row];
    
    
}

- (void)pushToNewVCIndex:(NSInteger)index {
    Class class = NSClassFromString(vcName_Arr[index]);
    GBaseViewController * vc = (GBaseViewController *)[[class alloc] init] ;
    
    [self.navigationController pushViewController:vc animated:YES];

    
    
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
