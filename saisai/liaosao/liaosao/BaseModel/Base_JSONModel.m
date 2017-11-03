//
//  Base_JSONModel.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Base_JSONModel.h"
@implementation Base_JSONModel
@synthesize mDictionary;

//设置所有的属性为可选(所有属性值可以为空)
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}


-(id)initWithJsonObject:(id)aJson {
    self = [super init];
    
    if ( self ) {
        if ( aJson && [aJson isKindOfClass:[NSDictionary class]] ) {
            self.mDictionary = [NSMutableDictionary dictionaryWithDictionary:aJson];
        }
    }
    
    return self;
}

// 返回公用字段数据
//- (NSString *)respCode {
//    return [mDictionary getString:@"respCode"];
//}
//
//- (NSString *)respDesc {
//    return [mDictionary getString:@"respDesc"];
//}
@end
