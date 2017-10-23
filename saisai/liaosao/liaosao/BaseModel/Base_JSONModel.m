//
//  Base_JSONModel.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Base_JSONModel.h"

@implementation Base_JSONModel
//设置所有的属性为可选(所有属性值可以为空)
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end
