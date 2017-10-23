//
//  publicURL_Header.h
//  liaosao
//
//  Created by guoxuyao on 2017/6/20.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#ifndef publicURL_Header_h
#define publicURL_Header_h

#define k_BASE_URL_https @"http://vpai.api.ha.cn"




#pragma mark ---登录注册
//登陆
/*
 login
 password

 */
#define klogin_URL @"api.php?mod=Oauth&act=authorize"

//退出登录
/*login*/
///Oauth/logout
#define kloginOUT_URL @"api.php?mod=Oauth&act=logout"

//获取验证码
/*1
 发送成功
 0
 用户没有绑定手机号码或者用户不存在
 -1
 发送短信发生了错误，具体看 message
*/
/*login*/
///Oauth/sendCodeByPhone
#define ksendCodeByPhone_URL @"api.php?mod=Oauth&act=sendCodeByPhone"

/*校验手机验证码是否正确
 login
 该字段可以是四个类型 1.UID，2.email，3.phone，4.uname
 code
 验证码
 */
///Oauth/checkCodeByPhone
#define kcheckCodeByPhone_URL @"api.php?mod=Oauth&act=checkCodeByPhone"


/*忘记密码
 login
 用户字段，支持 uid，email，phone，uname
 password
 要保存的用户密码
 code
 验证
 */
///Oauth/saveUserPasswordByPhone

#define ksaveUserPasswordByPhone_URL @"api.php?mod=Oauth&act=saveUserPasswordByPhone"

///Oauth/send_register_code  发送注册验证吗

///Oauth/register注册
/*
 
 */
#define kregister_URL @"api.php?mod=Oauth&act=register"


//首页Public/getSlideShow
#define kgetSlideShow_URL @"api.php?mod=Public&act=getSlideShow"



///Checkin/get_check_info  签到


//获取用户信息/Message/getUserInfo
/*
 uid
 用户 uid
*/

#define kgetUserInfo_URL @"api.php?mod=Message&act=getUserInfo"


//用户认证状态(进入认证页面时先请求此接口)/User/authenticate
#define kauthenticate_URL @"api.php?mod=User&act=authenticate"


//用户上传认证照片/User/uploadAuthenticateImg
#define kuploadAuthenticateImg_URL @"api.php?mod=User&act=uploadAuthenticateImg"


//提交认证/User/doAuthenticate
#define kdoAuthenticate_URL @"api.php?mod=User&act=doAuthenticate"





#endif /* publicURL_Header_h */
