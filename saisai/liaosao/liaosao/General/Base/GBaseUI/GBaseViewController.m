//
//  GBaseViewController.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBaseViewController.h"
#import <objc/runtime.h>

 #import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

#import "CYLTabBarControllerConfig.h"




@interface GBaseViewController ()

@end

@implementation GBaseViewController

//截取屏幕
- (UIImage *)getCurrtImage {
    UIGraphicsBeginImageContext(self.view.bounds.size);     //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    UIGraphicsEndImageContext();//移除栈顶的基于当前位图的图形上下文
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);//然后将该图片保存到图片图
    return viewImage;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self removeNavgationBarLine];

//    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
//        [self setAutomaticallyAdjustsScrollViewInsets:NO];
//    }
    
    self.view.backgroundColor = white_color;
    
    self.GtableView.emptyDataSetSource = self;
    self.GtableView.emptyDataSetDelegate = self;
    
    //这行代码必须加上，可以去除tableView的多余的线，否则会影响美观
    [self setupNa];
    [self setupUI];
    
}

- (void)setupNa {
    
}

- (void)setupUI {
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

#pragma mark----DZNEmptyDataSetSource, DZNEmptyDataSetDelegate
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"empty_placeholder"];
}
//图片的动画效果
- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
    
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}
//标题文本，详细描述，富文本样式

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"Please Allow Photo Access";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"This allows you to share photos from your library and save photos to your camera roll.";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
//按钮文本或者背景样式
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]};
    
    return [[NSAttributedString alloc] initWithString:@"Continue" attributes:attributes];
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    return [UIImage imageNamed:@"button_image"];
}
//空白页的背景色
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIColor whiteColor];
}

//如果需求无法满足，你可以自定义
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    //加入你自定义的view
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityView startAnimating];
    return activityView;
}


//是否显示空白页，默认YES
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return YES;
}

//是否允许点击，默认YES
- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return YES;
}

//是否允许滚动，默认NO
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

//图片是否要动画效果，默认NO
- (BOOL) emptyDataSetShouldAllowImageViewAnimate:(UIScrollView *)scrollView {
    return YES;
}

//空白页点击事件
- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
    
}

//空白页按钮点击事件
- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView {
    
}

#pragma mark -- other
/**
 * 功能：隐藏显示导航栏
 * 参数：（1）是否隐藏导航栏：isHide
 *      （2）是否有动画过渡：animated
 */
-(void)hideNavigationBar:(BOOL)isHide
                animated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.navigationController.navigationBarHidden=isHide;
        }];
    }
    else{
        self.navigationController.navigationBarHidden=isHide;
    }
}



/**
 *  去除nav 上的line
 */
- (void)removeNavgationBarLine {
    
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        
        NSArray *list=self.navigationController.navigationBar.subviews;
        
        for (id obj in list) {
            
            if ([obj isKindOfClass:[UIImageView class]]) {
                
                UIImageView *imageView=(UIImageView *)obj;
                
                NSArray *list2=imageView.subviews;
                
                for (id obj2 in list2) {
                    
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        
                        UIImageView *imageView2=(UIImageView *)obj2;
                        
                        imageView2.hidden=YES;
                        
                    }
                }
            }
        }
    }
}





- (void)addTapBlankToHideKeyboardGesture;
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBlankToHideKeyboard:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
}

- (void)onTapBlankToHideKeyboard:(UITapGestureRecognizer *)ges
{
    if (ges.state == UIGestureRecognizerStateEnded)
    {
        [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    }
}


- (void)callImagePickerActionSheet
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"相册", nil];
    actionSheet.cancelButtonIndex = 2;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex)
    {
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    if (buttonIndex == 0 && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else if (buttonIndex == 1 && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *photoImage = [info objectForKey:UIImagePickerControllerEditedImage];
    if (self.getImageView) {
        self.getImageView(photoImage);
    }
    //    self.logoImageView.image = info[UIImagePickerControllerEditedImage];
    //    isHasLogo = YES;
    [picker dismissViewControllerAnimated:YES completion:nil];
    //    //显示在最上方
    //    [self.view bringSubviewToFront:_HUD];
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

///去登陆界面
- (void)gotoLoginViewController {
    
}
//返回
- (void)backAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - 回到导航Index

- (void)popToHomePageWithTabIndex:(NSInteger)index
                       completion:(void (^)(void))completion
{
    UIWindow *keyWindow = [[UIApplication sharedApplication].windows objectAtIndex:0];
    NSInteger viewIndex = 0;
    for (UIView *view in keyWindow.subviews)
    {
        if (viewIndex > 0)
        {
            [view removeFromSuperview];
        }
        viewIndex++;
    }
    
    self.tabBarController.selectedIndex = index;
    if ([self.tabBarController presentedViewController]) {
        [self.tabBarController dismissViewControllerAnimated:NO completion:^{
            for (UINavigationController *nav in self
                 .tabBarController.viewControllers) {
                [nav popToRootViewControllerAnimated:NO];
            }
            if (completion)
                completion();
        }];
    } else {
        for (UINavigationController *nav in self
             .tabBarController.viewControllers) {
            [nav popToRootViewControllerAnimated:NO];
        }
        if (completion)
            completion();
    }
}

- (void)pushViewControllerWithName:(id)classOrName {
    if (classOrName) {
        Class classs;
        if ([classOrName isKindOfClass:[NSString class]]) {
            NSString *name = classOrName;
            classs = NSClassFromString(name);
        } else if ([classOrName isSubclassOfClass:[GBaseViewController class]]) {
            classs = classOrName;
        }
        
        UIViewController *vc = [classs new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)returnViewControllerWithName:(id)classOrName {
    if (classOrName) {
        Class classs;
        if ([classOrName isKindOfClass:[NSString class]]) {
            NSString *name = classOrName;
            classs = NSClassFromString(name);
        } else if ([classOrName isSubclassOfClass:[GBaseViewController class]]) {
            classs = classOrName;
        }
        
        [self.navigationController.viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:classs]) {
                [self.navigationController popToViewController:obj animated:YES];
                *stop = YES;
                return;
            }
        }];
    }
}
/**
 *  显示默认返回按钮
 *
 *  @param title 需要传入上级界面标题
 */
- (void)showBackWithTitle:(NSString *)title {
    NSString *imageName = @"back";
    if (kStatusBarStyle == UIStatusBarStyleLightContent) {
        imageName = @"back";
    }
    [self setLeftItemWithIcon:[UIImage imageNamed:imageName] title:title selector:@selector(backAction:)];
}
//事件自己处理
- (void)showBackWithTitle:(NSString *)title selector:(SEL)selector{
    NSString *imageName = @"back";
    if (kStatusBarStyle == UIStatusBarStyleLightContent) {
        imageName = @"back";
    }
    
    [self setLeftItemWithIcon:[UIImage imageNamed:imageName] title:title selector:selector];
}





- (void)setLeftItemWithIcon:(UIImage *)icon title:(NSString *)title selector:(SEL)selector {
    self.navigationItem.leftBarButtonItem = [self ittemLeftItemWithIcon:icon title:title selector:selector];
}

- (UIBarButtonItem *)ittemLeftItemWithIcon:(UIImage *)icon title:(NSString *)title selector:(SEL)selector {
    UIBarButtonItem *item;
    if (!icon && title.length == 0) {
        item = [[UIBarButtonItem new] initWithCustomView:[UIView new]];
        return item;
    }
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    if (selector) {
        [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    [btn setTitleColor:kUIToneTextColor forState:UIControlStateNormal];
    [btn setTitleColor:kUIToneTextColor forState:UIControlStateHighlighted];
    CGSize titleSize = [title ex_sizeWithFont:btn.titleLabel.font constrainedToSize:CGSizeMake(kScreenWidth, MAXFLOAT)];
    float leight = titleSize.width;
    if (icon) {
        leight += icon.size.width;
        [btn setImage:icon forState:UIControlStateNormal];
        [btn setImage:icon forState:UIControlStateHighlighted];
        if (title.length == 0) {
            //文字没有的话，点击区域+10
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -13, 0, 13);
        } else {
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 3);
        }
    }
    if (title.length == 0) {
        //文字没有的话，点击区域+10
        leight = leight + 15;
    }
    view.frame = CGRectMake(0, 0, leight, 30);
    btn.frame = CGRectMake(0, 0, leight, 30);
    [view addSubview:btn];
    
    item = [[UIBarButtonItem alloc] initWithCustomView:view];
    return item;
}



- (void)setRightItemWithTitle:(NSString *)title selector:(SEL)selector {
    UIBarButtonItem *item = [self ittemRightItemWithTitle:title selector:selector];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)setRightItemWithIcon:(UIImage *)icon selector:(SEL)selector {
    UIBarButtonItem *item = [self ittemRightItemWithIcon:icon selector:selector];
    self.navigationItem.rightBarButtonItem = item;
}

- (UIBarButtonItem *)ittemRightItemWithIcon:(UIImage *)icon selector:(SEL)selector {
    UIBarButtonItem *item;
    if (!icon) {
        item = [[UIBarButtonItem new] initWithCustomView:[UIView new]];
        return item;
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    if (selector) {
        [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    float leight = icon.size.width;
    [btn setImage:icon forState:UIControlStateNormal];
    [btn setImage:icon forState:UIControlStateHighlighted];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    [btn setFrame:CGRectMake(0, 0, leight, 30)];
    
    item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

- (UIBarButtonItem *)ittemRightItemWithTitle:(NSString *)title selector:(SEL)selector {
    UIBarButtonItem *item;
    if (title.length == 0) {
        item = [[UIBarButtonItem new] initWithCustomView:[UIView new]];
        return item;
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    if (selector) {
        [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    [btn setTitleColor:kUIToneTextColor forState:UIControlStateNormal];
    [btn setTitleColor:kUIToneTextColor forState:UIControlStateHighlighted];
    CGSize titleSize = [title ex_sizeWithFont:btn.titleLabel.font constrainedToSize:CGSizeMake(kScreenWidth, MAXFLOAT)];
    float leight = titleSize.width;
    [btn setFrame:CGRectMake(0, 0, leight, 30)];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

#pragma mark titleView定制

//设置纯文字titleVIew
- (void)setNavigationItemTitleViewWithTitle:(NSString *)title {
    self.navigationItem.titleView = nil;
    if (title.length == 0) {
        return;
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    [btn setTitleColor:kUIToneTextColor forState:UIControlStateNormal];
    [btn setTitleColor:kUIToneTextColor forState:UIControlStateHighlighted];
    CGSize titleSize = [title ex_sizeWithFont:btn.titleLabel.font constrainedToSize:CGSizeMake(kScreenWidth, MAXFLOAT)];
    float leight = titleSize.width;
    [btn setFrame:CGRectMake(0, 0, leight, 30)];
    self.navigationItem.titleView = btn;
}



//保存sdwebimage 加载的图片
- (void)saveImage:(NSString *)imageURL {
    [MBProgressHUD showHUDAddedTo:kKeywindow animated:YES];
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    NSURL *allURLString = [NSURL URLWithString:imageURL];
    UIImage *img;
    if ([manager diskImageExistsForURL:allURLString])
    {
        img =  [[manager imageCache] imageFromDiskCacheForKey:allURLString.absoluteString];
        
    }
    else
    {
        //从网络下载图片
        NSData *data = [NSData dataWithContentsOfURL:allURLString];
        img = [UIImage imageWithData:data];
    }
    
    // 保存图片到相册中
    UIImageWriteToSavedPhotosAlbum(img,self, @selector(image:didFinishSavingWithError:contextInfo:),nil);
    
    
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    [MBProgressHUD hideHUD];
    // Was there an error?
    if (error != NULL)
    {
        // Show error message…
        [MBProgressHUD showSuccess:@"保存失败"];
        
       
        
    }
    else  // No errors
    {
        // Show message image successfully saved
        [MBProgressHUD showSuccess:@"保存成功"];

        
    }
}

/*
 设置left
 */

- (void)setLeftSild {
     [self setLeftItemWithIcon:[UIImage imageNamed:@"more"] title:nil selector:@selector(handleLeft:)];
}

- (void)handleLeft:(id)sender {
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    YRSideViewController *sideViewController=[delegate sideViewController];
    [sideViewController showLeftViewController:true];
}


- (void)clearAllUserDefaultsData
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *dic = [userDefaults dictionaryRepresentation];
    for (id  key in dic) {
        [userDefaults removeObjectForKey:key];
    }
    [userDefaults synchronize];
    
}


- (void)seleteTabarItem:(NSInteger)index {
    [self.navigationController popToRootViewControllerAnimated:NO];
    
    GBaseTabarView *tabar = [CYLTabBarControllerConfig shareTabar_Single].tabBarController;
    [tabar setSelectedIndex:index];
    
}




@end
