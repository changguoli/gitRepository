//
//  GBaseViewController.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^getImageView)(UIImage *image);
@class GBase_CollectionView;
@class GBase_Tableview;
#import "UIScrollView+EmptyDataSet.h"

@interface GBaseViewController : UIViewController<UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>
@property (nonatomic,strong) GBase_Tableview *GtableView;
@property (nonatomic,strong) GBase_CollectionView *collectionView;
@property (nonatomic,strong) CHTCollectionViewWaterfallLayout *customLayout;
@property (nonatomic,strong)NSMutableArray *dataSource;
//个人基本信息
@property (nonatomic,strong) MineDetail_model *detail_data;




//截取屏幕
- (UIImage *)getCurrtImage;


//弹框
- (void)callImagePickerActionSheet;

// 对于界面上有输入框的，可以选择性调用些方法进行收起键盘
- (void)addTapBlankToHideKeyboardGesture;

///去登陆界面
- (void)gotoLoginViewController;
//返回
- (void)backAction:(UIButton *)sender;
#pragma mark 界面切换

//不需要传参数的push 只需告诉类名字符串
- (void)pushViewControllerWithName:(id)classOrName;
//回到当前模块导航下的某一个页面
- (void)returnViewControllerWithName:(id)classOrName;
//切到指定模块下
- (void)popToHomePageWithTabIndex:(NSInteger)index completion:(void (^)(void))completion;



#pragma mark 左边按钮定制

/**
 *  显示默认返回按钮
 *
 *  @param title 需要传入上级界面标题
 */
- (void)showBackWithTitle:(NSString *)title;

//事件自己处理
- (void)showBackWithTitle:(NSString *)title selector:(SEL)selector;

/**
 *  自定义左边按钮
 *
 *  @param icon     图标 非必填
 *  @param title    标题 非必填
 *  @param selector 事件
 */
- (void)setLeftItemWithIcon:(UIImage *)icon title:(NSString *)title selector:(SEL)selector;
- (UIBarButtonItem *)ittemLeftItemWithIcon:(UIImage *)icon title:(NSString *)title selector:(SEL)selector;

#pragma mark 右边按钮定制

/**
 *  通过文字设置右侧导航按钮
 *
 *  @param title    文字
 *  @param selector 事件
 */
- (void)setRightItemWithTitle:(NSString *)title selector:(SEL)selector;
- (UIBarButtonItem *)ittemRightItemWithTitle:(NSString *)title selector:(SEL)selector;

/**
 *  通过ico定制右侧按钮
 *
 *  @param icon     图标
 *  @param selector 事件
 */
- (void)setRightItemWithIcon:(UIImage *)icon selector:(SEL)selector;
- (UIBarButtonItem *)ittemRightItemWithIcon:(UIImage *)icon selector:(SEL)selector;

#pragma mark titleView定制

//设置纯文字titleVIew
- (void)setNavigationItemTitleViewWithTitle:(NSString *)title;
//调用图片

@property (nonatomic,copy)getImageView getImageView;  //获取image

/**
 * 功能：隐藏显示导航栏
 * 参数：（1）是否隐藏导航栏：isHide
 *      （2）是否有动画过渡：animated
 */
-(void)hideNavigationBar:(BOOL)isHide
                animated:(BOOL)animated;

//保存sdwebimage 加载的图片
- (void)saveImage:(NSString *)imageURL;


/*
 设置left
 */

- (void)setLeftSild;


//清除本地数据
- (void)clearAllUserDefaultsData;


- (void)seleteTabarItem:(NSInteger)index;

@end
