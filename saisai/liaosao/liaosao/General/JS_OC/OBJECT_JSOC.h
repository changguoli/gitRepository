//
//  OBJECT_JSOC.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GocTojs_public <JSExport>
/*
//退出
- (void)exit;
// 返回用户信息
- (NSString *)userInfo;
//下载打开
- (void)downLoad:(NSString *)url;
 */
//传签名 senQianming
- (NSString *)senQianming;

//参考
/////< 对于JS代码是：nativeManager.doSomeThing(s1, s2)，JSExport协议根据JS方法，使用多个:进行分割
//- (void)doSomeThing:(NSString *)someThing :(NSString *)s2;
//
/////< 对于JS代码是：nativeManager.onePushSubmit(s1, s2)，JSExport协议根据JS方法中的大写字母进行方法分割
//- (void)onePush:(NSString *)s1 submit:(NSString *)s2;
//
/////< 对于JS代码是：buttonClick5(s1, s2, s3, s4) 使用JSExport的提供的宏JSExportAs来处理
//JSExportAs(morePraramters,
//           - (void)morePraramtersWithP1:(NSString *)p1 p2:(NSString *)p2 p3:(NSString *)p3 p4:(NSString *)p4
//           );

@end

@interface OBJECT_JSOC : NSObject <GocTojs_public>
@property (nonatomic,strong) UIViewController *obj;

@end
