//
//  public_Str_Header.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#ifndef public_Str_Header_h
#define public_Str_Header_h

#define kSecretKey_YGS @"51ygs.com" 
//融云appkey
#define kRong_AppKey @"sfci50a7sogbi"


#pragma mark --网络请求参数

#define kCode_request @"status"
#define kMessage_request @"message"
#define kData_request @"data"

#define kDataError_request @"数据异常"
#define kRequestFaile_request @"网络异常，请检查网络"

#define kRequestFaile_500 @"服务器错误"
#define kRequestFaile_404 @"资源请求失败"
#define kRequestFaile_other @"网络异常"

#pragma mark ---color
#define k16x_Color(str) [UIColor colorFromHexString:str]

#define kFense_Color   k16x_Color(@"ecb1ac")  //粉色 1
#define kHuise_Color  k16x_Color(@"232427")  //灰色
//#define kHuise_Color  k16x_Color(@"#333333")  //白色

#define kQingse_Color  k16x_Color(@"4c827e")  //藏青色
#define kShenFS_Color  k16x_Color(@"ff6725")  //深粉色



#define kMiddle_Font  [UIFont systemFontOfSize:13]
#define kMin_Font  [UIFont systemFontOfSize:10]

#define kMax_Font  [UIFont systemFontOfSize:16]


//图片宏
#define kVipRed_Pic @"authentication_red"
#define kVipYellow_Pic @"authentication_yellow"  //vip

#define kTime_Pic @"time"  // 时间
#define kLove_Pic @"favorite_hl" //  xin

#define kMiddleSpace 10

#define kMMiddleSpace 15

#define kMaxiddleSpace 20


#endif /* public_Str_Header_h */
