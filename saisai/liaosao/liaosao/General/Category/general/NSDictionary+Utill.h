//
//  NSDictionary+Utill.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/15.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Utill)
//dic是否存在某个key
- (BOOL)haveThisKey:(NSString*)currKey;

//判断key存在 value不为空
- (BOOL)haveThisKeyAndValueIsNotNULL:(NSString*)currKey;


@end
