//
//  NSDictionary+Utill.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/15.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "NSDictionary+Utill.h"

@implementation NSDictionary (Utill)
- (BOOL)haveThisKey:(NSString*)currKey {
    //[dictionary allKeys]  containsObject: key]
    return [self objectForKey:currKey];
    
    
}
- (BOOL)haveThisKeyAndValueIsNotNULL:(NSString*)currKey {
    if(![self objectForKey:currKey]){
        return NO;
    }
    
    id obj = [self objectForKey:currKey];
    
    return ![obj isEqual:[NSNull null]];
    
    
    
}

@end
