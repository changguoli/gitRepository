//
//  VC_HomePageDetail.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/12.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "VC_HomePageDetail.h"
#import "Header_HomePage.h"
#import "GBase_Toolbar.h"
@interface VC_HomePageDetail ()
@property (nonatomic,strong) RedBookDetails *redBookModel;
@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UIImageView *mainImageView;

@property (nonatomic,assign) CGRect destinationRec;
@property (nonatomic,strong) HomeDetail_Scrollview *home_scrollView;

@end

@implementation VC_HomePageDetail
#pragma mark-- MKJAnimatorDelegate
- (void)animationFinish
{
    // 图片往上平铺
    [self.home_scrollView.pictureImageView sd_setImageWithURL:[NSURL URLWithString:self.redBookModel.img]];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
   
}


-(void)viewWillAppear:(BOOL)animated

{
    
    [super viewWillAppear:animated];
    
//    self.navigationController.toolbarHidden =NO;
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;


}
//na
- (void)setupNa {
    [self setLeftItemWithIcon:nil title:nil selector:@selector(tapBack_Home:)];
    
    
}
//UI
- (void)setupUI {
    self.home_scrollView = [[HomeDetail_Scrollview alloc] initWithFrame:self.view.bounds];
    self.home_scrollView.ImageFrame = self.destinationRec;
    WS(weakSelf)

    self.home_scrollView.tapAction = ^(){
        [weakSelf.navigationController popViewControllerAnimated:YES];

    };
    self.view = self.home_scrollView;
    
}

- (void)tapBack_Home:(id)sender {
    [self.home_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
    
}


- (void)refreshData:(RedBookDetails *)details destinationRec:(CGRect)destinationRec {
    self.destinationRec = destinationRec;
    self.redBookModel = details;
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
