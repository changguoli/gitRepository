//
//  CommonHeader.h
//  liaosao
//
//  Created by cgl on 2017/10/27.
//  Copyright © 2017年 changguoli. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

#define RGBACOLOR(_r, _g, _b, _a) [UIColor colorWithRed:(_r)/255.0 green:(_g)/255.0 blue:(_b)/255.0 alpha:(_a)]

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

///按钮色值
#define KBtnColor UIColorFromRGB(#cd462c)
//我的积分底部颜色
#define KMyScoreColor UIColorFromRGB(#37393d)


#define ImageWithContentsOfFile(x) ([UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:x]])

#define kUserDefaults [NSUserDefaults standardUserDefaults]

#define kSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#define KaNibController(TARGET) [[NSClassFromString(TARGET) alloc] initWithNibName:(TARGET) bundle:nil]
///公共请求接口投
#define KURL_API(x) [NSString stringWithFormat:@"http://www.yz2szy.top/api.php?mod=Oauth&act=%@", x]
#define KURL_API_two(x, y) [NSString stringWithFormat:@"http://www.yz2szy.top/api.php?mod=%@&act=%@", x, y]
#endif /* CommonHeader_h */
