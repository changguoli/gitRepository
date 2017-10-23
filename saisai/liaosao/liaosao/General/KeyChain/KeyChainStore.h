//
//  KeyChainStore.h
//  Youngs
//
//  Created by guoxuyao on 2017/4/1.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainStore : NSObject
+ (void)save:(NSString *)service data:(id)data;

+ (id)load:(NSString *)service;

+ (void)deleteKeyData:(NSString *)service;
@end
