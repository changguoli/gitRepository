//
//  NSString+BFExtension.h
//  BFCategories
//
//  Created by 蝴蝶 on 15/7/3.
//  Copyright (c) 2015年 butterfly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BFExtension)


/***************************************************************************************/
/*--JSON--*/
/***************************************************************************************/


/**
 *  将json字符串转换成字典(转换失败则返回:nil)
 *
 *  @return   NSDictionary
 */
- (NSDictionary *)dictionaryValue;

//字典转json
+(NSString *)dictionaryToJson:(NSDictionary *)dic;


/***************************************************************************************/
/*--常用字符串操作--*/
/***************************************************************************************/


/**
 *  获取字符数量
 *
 *  @return   NSInteger 字符个数
 */
- (NSInteger)wordsCount;


/**
 *  反转字符串,如:@"abcdefg" -> @"gfedcba"
 *
 *  @return   NSSting
 */
- (NSString *)reverseString;


/**
 *  去除空格,如:@"abcd defg  hig" -> @"abcdefghig"
 *
 *  @return   NSSting
 */
- (NSString *)trimmingWhitespace;


/**
 *  去除空格和换行符
 *
 *  @return   NSSting
 */
- (NSString *)trimmingWhitespaceAndNewlines;


/**
 *  Unicode编码的字符串转成NSString
 *
 *  @return   NSSting
 */
- (NSString *)makeUnicodeToString;


/***************************************************************************************/
/*--常用字符串验证--*/
/***************************************************************************************/


/**
 *  是否包含空格
 *
 *  @return   包含返回YES,不包含返回NO
 */
- (BOOL)isContainBlank;


/**
 *  判断URL中是否包含中文
 *
 *  @return   包含返回YES,不包含返回NO
 */
- (BOOL)isContainChinese;


/**
 *  判断是否是纯汉字
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)isValidChinese;


/**
 *  判断是否是手机号码
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)isMobileNumber;


/**
 *  判断是否是手机号码,分电信、联通、移动和小灵通
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)isMobileNumberClassification;


/**
 *  判断邮箱的有效性
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)isEmailAddress;


/**
 *  简单的身份证有效性
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)simpleVerifyIDCardNumber;


/**
 *  精确的身份证号码有效性检测
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)accurateVerifyIDCardNumber;


/**
 *  判断车牌号的有效性
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)isCarNumber;


/**
 *  判断银行卡的有效性
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)bankCardluhmCheck;


/**
 *  判断IP地址有效性
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)isIPAddress;


/**
 *  判断Mac地址有效性
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)isMacAddress;


/**
 *  判断网址有效性
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)isValidUrl;


/**
 *  判断是否是邮政编码
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)isValidPostalcode;


/**
 *  判断是否是工商税号
 *
 *  @return   是返回YES,不是返回NO
 */
- (BOOL)isValidTaxNo;


/**
 *  是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 *
 *  @param     minLenth 账号最小长度
 *  @param     maxLenth 账号最长长度
 *  @param     containChinese 是否包含中文
 *  @param     firstCannotBeDigtal 首字母不能为数字
 *
 *  @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;


/**
 *  是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 *
 *  @param     minLenth 账号最小长度
 *  @param     maxLenth 账号最长长度
 *  @param     containChinese 是否包含中文
 *  @param     containDigtal   包含数字
 *  @param     containLetter   包含字母
 *  @param     containOtherCharacter   其他字符
 *  @param     firstCannotBeDigtal 首字母不能为数字
 *
 *  @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;


@end
