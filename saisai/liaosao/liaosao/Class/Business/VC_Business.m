//
//  VC_Business.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "VC_Business.h"

#import "Header_Business.h"
@interface VC_Business ()

@end

@implementation VC_Business

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
   // [self.GtableView setEditing:YES animated:YES];
    self.view =self.GtableView;
    
}
#pragma mark-- UITableViewDelegate,UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Take_Cell *cell = [[Take_Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    Mine_model *model ;
    [cell setViewModelDataSource:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma  mark --可编辑状态的tableview
// 当增减按钮按下时，用来处理数据和UI的回调。
// 8.0版本后加入的UITableViewRowAction不在这个回调的控制范围内，UITableViewRowAction有单独的回调Block。
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



// 这个回调决定了在当前indexPath的Cell是否可以编辑。
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}


// 这个回调很关键，返回Cell的编辑样式。
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  UITableViewCellEditingStyleDelete;
    
}

// 删除按钮的文字
//- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED {
//    return @"删除";
//}

// 8.0后侧滑菜单的新接口，支持多个侧滑按钮。
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{
    return [self setupUITableViewRowActionArr];
    
}

// 这个接口决定编辑状态下的Cell是否需要缩进。
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

// 这是两个状态回调
- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath __TVOS_PROHIBITED{
    
}
- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath __TVOS_PROHIBITED{
    
}




//创建UITableViewRowAction

- (NSArray *)setupUITableViewRowActionArr {
    UITableViewRowAction *moneyTableViewAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"续订" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //续费
    }];
    
    
    UITableViewRowAction *picTableViewAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"相册" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //进入相册
        
    }];
    
    return @[moneyTableViewAction,picTableViewAction];
  
    
    
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
