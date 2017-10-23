//
//  UserDefaultsUtils.m
//  liaosao
//
//  Created by guoxuyao on 2017/6/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "UserDefaultsUtils.h"

@implementation UserDefaultsUtils

+ (void)saveValue:(id) value forKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

+ (id)valueWithKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

+ (BOOL)boolValueWithKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:key];
}

+ (void)saveBoolValue:(BOOL)value withKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:value forKey:key];
    [userDefaults synchronize];
}

/*
 * 保存整形值到NSUserDefaults
 * @param value  要保存的布尔值
 * @param key
 */
+ (void)saveIntegerValue:(NSInteger)value withKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:value forKey:key];
    [userDefaults synchronize];
}

/*
 * 从NSUserDefaults读取整形值数据
 * @param key
 */
+ (NSInteger)IntegerWithKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults integerForKey:key];
}

/*
 * 保存浮点型形值到NSUserDefaults
 * @param value  要保存的浮点型
 * @param key
 */
+ (void)saveFloatValue:(CGFloat)value withKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:value forKey:key];
    [userDefaults synchronize];
}

/*
 * 从NSUserDefaults读取服点值数据
 * @param key
 */
+ (CGFloat)floatWithKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults floatForKey:key];
}




+ (void)removeObjectForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

+ (void)print {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults dictionaryRepresentation];
    NSLog(@"%@",dic);
}

@end
