//
//  public_ENUM_Header.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/6.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#ifndef public_ENUM_Header_h
#define public_ENUM_Header_h

#define kCustomVersion @""
#define kCustomBundle  @""

//刷新类型
typedef NS_ENUM(int,YHRefreshType){
    YHRefreshType_LoadNew = 1,  //下拉刷新
    YHRefreshType_LoadMore      //上拉加载
};


//枚举
typedef  enum{
  
   a,
}test;


typedef NS_ENUM (NSInteger, UIViewAnimationTransitions){
    b,
};


//typedef NS_ENUM(NSInteger ,phoneCodeNumber) {
//    
//};


//****************************** 通知
#define postNotification(actionName, obj)				{NSNotification *notification = [NSNotification notificationWithName:actionName object:obj]; [[NSNotificationCenter defaultCenter]postNotification:notification]; }
#define addSelfAsNotificationObserver(actionName, SEL)	{[[NSNotificationCenter defaultCenter]addObserver:self selector:SEL name:actionName object:nil]; }
#define removeSelfNofificationObservers {[[NSNotificationCenter defaultCenter] removeObserver:self]; }

//****************************** 日志输出宏定义  gxyHONG
#ifdef DEBUG
#define GDBLog(...) NSLog(__VA_ARGS__)// 调试状态
#else
#define GDBLog(...)// 发布状态
#endif


//是否是模拟器运行
#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

//****************************** 弱引用 block
#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;

#define GDEFAULTS [NSUserDefaults standardUserDefaults]
//****************************** RGB

#define KRGBColor(r,g,b,a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
/*
 + (UIColor *)colorWithDisplayP3Red:(CGFloat)displayP3Red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha NS_AVAILABLE_IOS(10_0);
 - (UIColor *)initWithDisplayP3Red:(CGFloat)displayP3Red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha NS_AVAILABLE_IOS(10_0);
 */

//****************************** 字符串拼接 警告处理
#define kNumberToString(number) [NSString stringWithFormat:@"%ld",(long)number]
#define kNumberToString_string(number,string) [NSString stringWithFormat:@"%ld%@",(long)number,string]

//****************************** 判断系统版本
#define IOS7_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
#define IOS7            ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7)
#define IOS8            ([[[UIDevice currentDevice] systemVersion] integerValue] >= 8)
#define IOS9            ([[[UIDevice currentDevice] systemVersion] integerValue] >= 9)
#define IOS10            ([[[UIDevice currentDevice] systemVersion] integerValue] >= 10)
//获得UUID
#define  kCurrentUUID     [[[UIDevice currentDevice] identifierForVendor] UUIDString]
//获取设备版本号
#define kVersion_store  [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"]
#define kVersion_bundle [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"];



//****************************** 字体尺寸
#define KFon_S(fon) [UIFont systemFontOfSize:fon]
#define KFon_B(fon)[UIFont boldSystemFontOfSize:fon]
//adjustsFontForContentSizeCategory  更新字体变化
//adjustsFontSizeToFitWidth
/* NSDictionary *attrs = @{NSForegroundColorAttributeName : [UIColor redColor]};
 NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:label.text attributes:attrs];*/

//****************************** 通用尺寸
#define kScreenRect [UIScreen mainScreen].bounds
#define kScreenSize [UIScreen mainScreen].bounds.size
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width


//UI颜色控制
#define UIColorFromHexA(hexValue, a)     [UIColor colorWithRed:(((hexValue & 0xFF0000) >> 16))/255.0f green:(((hexValue & 0xFF00) >> 8))/255.0f blue:((hexValue & 0xFF))/255.0f alpha:a]
#define UIColorFromHex(hexValue)        UIColorFromHexA(hexValue, 1.0f)

#define kUIToneBackgroundColor UIColorFromHex(232427) //UI整体背景色调 与文字颜色一一对应
#define kUIToneTextColor white_color //UI整体文字色调 与背景颜色对应
#define kStatusBarStyle UIStatusBarStyleLightContent //状态栏样式
#define kViewBackgroundColor UIColorFromHex(0xf5f5f5) //界面View背景颜色

//常用颜色
#define black_color     [UIColor blackColor]
#define blue_color      [UIColor blueColor]
#define brown_color     [UIColor brownColor]
#define clear_color     [UIColor clearColor]
#define darkGray_color  [UIColor darkGrayColor]
#define darkText_color  [UIColor darkTextColor]
#define white_color     [UIColor whiteColor]
#define yellow_color    [UIColor yellowColor]
#define red_color       [UIColor redColor]
#define orange_color    [UIColor orangeColor]
#define purple_color    [UIColor purpleColor]
#define lightText_color [UIColor lightTextColor]
#define lightGray_color [UIColor lightGrayColor]
#define green_color     [UIColor greenColor]
#define gray_color      [UIColor grayColor]
#define magenta_color   [UIColor magentaColor]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
#define ImageNamed(name) [UIImage imageNamed:name]

// 判断字段时候为空的情况
#define IF_NULL_TO_STRING(x) ([(x) isEqual:[NSNull null]]||(x)==nil)? @"":TEXT_STRING(x)
// 转换为字符串
#define TEXT_STRING(x) [NSString stringWithFormat:@"%@",x]


//keywindow
#define kKeywindow [[UIApplication sharedApplication].windows lastObject]

//hud
//loading
#define kShowMessage_loding(message)  [MBProgressHUD showLoding:message]
//隐藏hud
#define kHidHUD_Loding  [MBProgressHUD hideHUD]
//提示toast
#define kShowMessage(message)     [MBProgressHUD showMessageOnWindow:message]

// tableview default
//s
#define kTableview_Frame CGRectMake(0, 0, kScreenWidth, kScreenHeight-49)
//detail
#define kTableviewDetail_Frame CGRectMake(0, 0, kScreenWidth, kScreenHeight)

#pragma mark -- 颜色标记

#define k16_Color(str)         [UIColor colorFromHexString:str]


#define kWhiteGay_Color     [UIColor groupTableViewBackgroundColor]


//- toolbar color -#eeeeee

//首页色值
#define kColor_37393d k16_Color(@"#37393d") //我的积分

#define kColor_1f2022 k16_Color(@"#1f2022") //我的积分



//通用布局尺寸
#define kSpace 10
#define kSpace_min 5
#define kSpace_middle 15
#define kSpace_max 20


#endif /* public_ENUM_Header_h */



