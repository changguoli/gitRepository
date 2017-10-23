//
//  CYLTabBarControllerConfig.m
//  CYLTabBarController
//
//  v1.10.0 Created by 微博@iOS程序犭袁 ( http://weibo.com/luohanchenyilong/ ) on 10/20/15.
//  Copyright © 2015 https://github.com/ChenYilong . All rights reserved.
//
#import "CYLTabBarControllerConfig.h"
#import "Base_RTRootNavigationController.h"

@interface CYLBaseNavigationController : UINavigationController
@end

@implementation CYLBaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end



#import "ViewController.h"

@interface CYLTabBarControllerConfig ()


@end

@implementation CYLTabBarControllerConfig

//单例

+ (instancetype)shareTabar_Single {
    static CYLTabBarControllerConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [CYLTabBarControllerConfig new];
        
        
    });
    return config;
    
    
    
}

/**
 *  lazy load tabBarController
 *
 *  @return CYLTabBarController
 */
- (CYLTabBarController *)tabBarController {

    if (_tabBarController == nil) {
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributesForController];
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (NSArray *)viewControllers {
    VC_HomePage *firstViewController = [[VC_HomePage alloc] init];
    Base_RTRootNavigationController*firstNavigationController = [[Base_RTRootNavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    firstViewController.title = @"发现";
    
    VC_GetJob *secondViewController = [[VC_GetJob alloc] init];
    Base_RTRootNavigationController *secondNavigationController = [[Base_RTRootNavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    secondViewController.title = @"心星";
    VC_Living *vcliving = [[VC_Living alloc] init];
    Base_RTRootNavigationController *plusNavigationController = [[Base_RTRootNavigationController alloc]
                                                                   initWithRootViewController:vcliving];

    vcliving.title = @"消息";
    VC_Business *thirdViewController = [[VC_Business alloc] init];
    Base_RTRootNavigationController *thirdNavigationController = [[Base_RTRootNavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    thirdViewController.title =@"订阅";
    VC_Mine *fourthViewController = [[VC_Mine alloc] init];
    Base_RTRootNavigationController *fourthNavigationController = [[Base_RTRootNavigationController alloc]
                                                    initWithRootViewController:fourthViewController];
    fourthViewController.title = @"我的";
    
    /**
     * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
     * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
     * 更推荐后一种做法。
     */
    //tabBarController.imageInsets = UIEdgeInsetsMake(4.5, 0, -4.5, 0);
    //tabBarController.titlePositionAdjustment = UIOffsetMake(0, MAXFLOAT);
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 plusNavigationController,
                                 thirdNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : @"发现",
                                                 CYLTabBarItemImage : @"find",  /* NSString and UIImage are supported*/
                                                 CYLTabBarItemSelectedImage : @"find_red", /* NSString and UIImage are supported*/
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"心星",
                                                  CYLTabBarItemImage : @"heart",
                                                  CYLTabBarItemSelectedImage : @"heart_red",
                                                  };
    NSDictionary *plusTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"消息",
                                                  CYLTabBarItemImage : @"news",
                                                  CYLTabBarItemSelectedImage : @"news_red",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : @"订阅",
                                                 CYLTabBarItemImage : @"subscribe",
                                                 CYLTabBarItemSelectedImage : @"subscribe_red",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{                                                  CYLTabBarItemTitle : @"我的",
                                                  CYLTabBarItemImage : @"home",
                                                  CYLTabBarItemSelectedImage : @"home_red"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       plusTabBarItemsAttributes ,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // Customize UITabBar height
    // 自定义 TabBar 高度
    // tabBarController.tabBarHeight = 50.f;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = kFense_Color;
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor blackColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    // UITabBar *tabBarAppearance = [UITabBar appearance];
    // [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    UITabBarController *tabBarController = [self cyl_tabBarController] ?: [[UITabBarController alloc] init];
    CGFloat tabBarHeight = tabBarController.tabBar.frame.size.height;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor redColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
