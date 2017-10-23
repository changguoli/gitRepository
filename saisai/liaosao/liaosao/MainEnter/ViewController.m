//
//  ViewController.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/6.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Common.h"
#import "NSString+BFExtension.h"

#import <QuartzCore/QuartzCore.h>


@interface ViewController ()

@end

@implementation ViewController
//截取屏幕
- (UIImage *)getCurrtImage {
    UIGraphicsBeginImageContext(self.view.bounds.size);     //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    UIGraphicsEndImageContext();//移除栈顶的基于当前位图的图形上下文
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);//然后将该图片保存到图片图
    return viewImage;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"郭旭垚";
    [self getCurrtImage];
    
    NSDictionary *dic = @{@"learnlogID":@"bggausydgyu  gsuagu %^^&8 郭旭垚  (*((* 6^*/n/r"};
    
    NSString *str = [NSString dictionaryToJson:dic];
//    NSString *strUrl = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
//     NSString *strUrls = [strUrl stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSLog(@"%@",str);
//    NSLog(@"%@",strUrls);
//    NSLog(@"郭旭垚%@郭",[NSString md5String:strUrls]);
    
    NSString *a=@"1234";

    
    NSString *result = [NSString stringWithFormat:@"%@%@%@",str,a,@"51ygs.com"];
    
//    NSLog(@"====%@=====",[self decodeFromPercentEscapeString:result]);
//    NSLog(@"郭%@",[self decodeFromPercentEscapeString:result]);
    NSString *res = [NSString md5String:result];
    
    
////    NSLog(@"result=%@   [NSString md5String:result]=====  %@  str=======%@  [NSString md5String:a]==== %@",result,[NSString md5String:result],str,[NSString md5String:a]);
//    
    NSLog(@"%@",res);
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
