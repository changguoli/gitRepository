//
//  UserDefaultsUtils.h
//  liaosao
//
//  Created by guoxuyao on 2017/6/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsUtils : NSObject

/*
 * 保存数据到NSUserDefaults
 * @param value  要保存的数据
 * @param key
 */
+ (void)saveValue:(id) value forKey:(NSString *)key;

/*
 * 从NSUserDefaults读取数据
 * @param key
 */
+ (id)valueWithKey:(NSString *)key;

/*
 * 保存布尔值到NSUserDefaults
 * @param value  要保存的布尔值
 * @param key
 */
+ (void)saveBoolValue:(BOOL)value withKey:(NSString *)key;

/*
 * 从NSUserDefaults读取布尔值数据
 * @param key
 */
+ (BOOL)boolValueWithKey:(NSString *)key;

/*
 * 从NSUserDefaults删除数据
 * @param key
 */
+ (void)removeObjectForKey:(NSString *)key;

/*
 * 保存整形值到NSUserDefaults
 * @param value  要保存的整形
 * @param key
 */
+ (void)saveIntegerValue:(NSInteger)value withKey:(NSString *)key;

/*
 * 从NSUserDefaults读取整形值数据
 * @param key
 */
+ (NSInteger)IntegerWithKey:(NSString *)key;



/*
 * 保存浮点型形值到NSUserDefaults
 * @param value  要保存的浮点型
 * @param key
 */
+ (void)saveFloatValue:(CGFloat)value withKey:(NSString *)key;

/*
 * 从NSUserDefaults读取服点值数据
 * @param key
 */
+ (CGFloat)floatWithKey:(NSString *)key;






/*
 * 在控制台输出所有NSUserDefaults保存的数据
 */
+ (void)print;


@end
