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

@interface MineDetail_VC ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, UIAlertViewDelegate>
{
     MineDetail_model *detail_data;
     UIImageView      *_picture;//头像
}
@end
@implementation MineDetail_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setupNa];
//    [self setupUI];
//    [self setTableViewFootView];
    
}

- (void)setupNa {
   // [self setLeftSild];
    [self setNavigationItemTitleViewWithTitle:@"个人信息"];
    [self showBackWithTitle:@""];
    
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

    if (indexPath.row == 0) {
        _picture = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 75, 15, 40, 40)];
        cell.detailTextLabel.text = @"";
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changePictureAction:)];
        [_picture addGestureRecognizer:tap];
        _picture.userInteractionEnabled = YES;
        [cell addSubview:_picture];
        [_picture sd_setImageWithURL:[NSURL URLWithString:@"http://vpai.api.ha.cn/resources/theme/stv1/_static/image/noavatar/big.jpg"] placeholderImage:nil];
        
    }
//    [cell setViewModelDataSource:detail_data];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    if (indexPath.row == 1) {//获取邮箱验证码
        NSDictionary *dataDic = @{@"email":@"416495176@qq.com",
                                  @"notreg":@"1"};
        [GLNetWorkManager requestPostWithURLStr:KURL_API(@"getEmailCode") parameters:dataDic finish:^(id dataDic) {
            
        } enError:^(NSError *error) {
            
        }];
        
    } else if (indexPath.row == 2) {//邮箱验证码是否正确
        NSDictionary *dataDic = @{@"email":@"416495176@qq.com",
                                  @"code":@"222333"};
        [GLNetWorkManager requestPostWithURLStr:KURL_API(@"hasCodeByEmail") parameters:dataDic finish:^(id dataDic) {
            
        } enError:^(NSError *error) {
            
        }];
    } else if (indexPath.row == 3) {//用邮箱注册
        NSDictionary *dataDic = @{@"email":@"18937197723@163.com",
                                  @"username":@"qqq",
                                  @"password":@"123456",
                                  @"code":@"223344",
                                  @"picurl":@"qqq",
                                  @"picwidth":@"30",
                                  @"picheight":@"30",
                                  @"sex":@"2"};
                                  
                                  
        [GLNetWorkManager requestPostWithURLStr:KURL_API(@"signUp2Email") parameters:dataDic finish:^(id dataDic) {
            
        } enError:^(NSError *error) {
            
        }];
    } else if (indexPath.row == 4) {//邮箱密码找回
        NSDictionary *dataDic = @{@"email":@"416495176@qq.com",
                                  @"password":@"222333",
                                  @"code":@"222333"};
                                  
        [GLNetWorkManager requestPostWithURLStr:KURL_API(@"findPassword2Email") parameters:dataDic finish:^(id dataDic) {
            
        } enError:^(NSError *error) {
            
        }];
    } else if (indexPath.row == 5) {//意见反馈
        NSDictionary *dataDic = @{@"content":@"意见反馈测试",
                                  @"uid":@"4",};
        
        [GLNetWorkManager requestPostContainTokenWithURLStr:KURL_API_two(@"System", @"sendFeeedback") parameters:dataDic finish:^(id dataDic) {
            
        } enError:^(NSError *error) {
            
        }];
    } else if (indexPath.row == 6) {//获取用户头像
        NSDictionary *dataDic = @{@"method":@"url",
                                  @"uid":@"4",};
        
        [GLNetWorkManager requestPostContainTokenWithURLStr:KURL_API_two(@"Message", @"getUserFace") parameters:dataDic finish:^(id dataDic) {
            
        } enError:^(NSError *error) {
            
        }];
    } else {
        NSDictionary *dataDic = @{@"num":@"",
                                  @"user_id":@"4",
                                  @"uname":@"1760219772"};
        
        [GLNetWorkManager requestPostContainTokenWithURLStr:KURL_API_two(@"User", @"show") parameters:dataDic finish:^(id dataDic) {
            if (([dataDic objectForKey:@"status"] != nil) && ([[dataDic objectForKey:@"status"] integerValue] == 0)) {//请求错误
                kShowMessage([dataDic objectForKey:@"msg"]);
            } else {
                NSLog(@"请求成功");
                
                detail_data = [[MineDetail_model alloc] initWithJsonObject:dataDic];
                NSLog(@"detail_data: %@", detail_data);
            }
            NSLog(@"daraDIC %@", dataDic);
        } enError:^(NSError *error) {
            NSLog(@"daraDIC %@", dataDic);
        }];
    }
    
    
}

//点击头像切换照片
- (void)changePictureAction:(UITapGestureRecognizer *)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相册",@"拍照", nil];
    [sheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:
(NSInteger)buttonIndex {
    // 相册 0 拍照 1
    switch (buttonIndex) {
        case 0:
            //从相册中读取
            [self readImageFromAlbum];
            break;
        case 1:
            //拍照
            [self readImageFromCamera];
            break;
        default:
            break;
    }
}
- (void)readImageFromAlbum {
    //创建对象
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    //（选择类型）表示仅仅从相册中选取照片
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //指定代理，因此我们要实现UIImagePickerControllerDelegate,
    //UINavigationControllerDelegate协议
    //设置在相册选完照片后，是否跳到编辑模式进行图片剪裁。(允许用户编辑)
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    //显示相册
    [self presentViewController:imagePicker animated:YES completion:nil];
}
- (void)readImageFromCamera {
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.allowsEditing = YES; //允许用户编辑
        imagePicker.delegate = self;
        [self presentViewController:imagePicker animated:YES completion:nil];
    } else {
        //弹出窗口响应点击事件
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告"
                                                        message:@"未检测到摄像头" delegate:nil cancelButtonTitle:nil
                                              otherButtonTitles:@"确定", nil];
        [alert show];
    }
}


//图片完成之后处理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    _picture.image = info[UIImagePickerControllerEditedImage];
    
    [GLNetWorkManager postUpLoadDataByString:KURL_API_two(@"User", @"upload_avatar") BODYDic:nil ImageNumber:1 ImageData_1:UIImagePNGRepresentation(_picture.image) ImageName_1:@"touxian" ImageData_2:nil ImageName_2:nil WithDataBlock:^(id data) {
        NSLog(@"-----: %@", data);
    }];
    //结束操作
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
