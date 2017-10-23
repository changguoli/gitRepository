//
//  YTKNetworkAgent+RTAgent.m
//  Youngs
//
//  Created by guoxuyao on 2017/4/13.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//
#import "objc/runtime.h"
#import "YTKNetworkAgent+RTAgent.h"

@implementation YTKNetworkAgent (RTAgent)

+(void)load{
    // 实现init 与 dt_init方法的交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL org_Selector = @selector(init);
        SEL dt_Selector  = @selector(dt_init);
        
        Method org_method = class_getInstanceMethod([self class], org_Selector);
        Method dt_method  = class_getInstanceMethod([self class], dt_Selector);
        
        BOOL isAdd = class_addMethod(self, org_Selector, method_getImplementation(dt_method), method_getTypeEncoding(dt_method));
        if (isAdd) {
            class_replaceMethod(self, dt_Selector, method_getImplementation(org_method), method_getTypeEncoding(org_method));
        }else{
            method_exchangeImplementations(org_method, dt_method);
        }
        
    });
}

-(instancetype)dt_init{
    [self dt_init];
    [self dt_class_copyIvarList:[self class]];
    return self;
}


- (void)dt_class_copyIvarList:(Class)class {
    unsigned int count;
    Ivar *ivarList = class_copyIvarList(class, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        // 获取成员属性名
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        //        NSString *value = object_getIvar(obj, ivar);
        if ([name isEqualToString:@"_manager"]) {
            AFHTTPSessionManager *dt_manager =  [AFHTTPSessionManager manager];
            dt_manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",nil];
            dt_manager.requestSerializer = [AFJSONRequestSerializer serializer];
            //  修改成员变量的值
            object_setIvar(self, ivar,dt_manager);
            AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
            [policy setAllowInvalidCertificates:YES];
            [policy setValidatesDomainName:NO];
            dt_manager.securityPolicy = policy;
            
        }
        
    }
    // 记得释放哦
    free(ivarList);
}
@end
