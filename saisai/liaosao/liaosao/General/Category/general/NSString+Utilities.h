//
//  NSString+Utilities.h
//

#import <UIKit/UIKit.h>

@interface NSString (Utilities)
#pragma mark -----字符串常用
/**判断字符串是否为空，如果字符串为空格也会判断为空
 */
+ (BOOL)isEmpty:(NSString*) str;

/**判断字符串是否为空,字符串可以为空格
 */
+ (BOOL)isNull:(NSString*) str;

/* 去除空格 */
- (NSString *)trimWhitespace;

/* 包含的字符个数 */
- (NSUInteger)numberOfWords;


/* 将字符串倒序 */
- (NSString *)reverseString;


/* 是否包含某个字符串 */
- (BOOL)containsString:(NSString *)subString;
/* 是否以某个字符串开头 */
- (BOOL)isBeginsWith:(NSString *)string;
/* 是否以某个字符串结束 */
- (BOOL)isEndssWith:(NSString *)string;


/* 用新字符串替换旧的字符串 */
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;
/* 获取中间某段字符串 */
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;
/* 拼接字符串 */
- (NSString *)addString:(NSString *)string;
/* 移除子字符串 */
- (NSString *)removeSubString:(NSString *)subString;



/* 是否只包含字母 */
- (BOOL)containsOnlyLetters;
/* 是否只包含数字 */
- (BOOL)containsOnlyNumbers;
/* 是否只包含数字和字母 */
- (BOOL)containsOnlyNumbersAndLetters;



/* 将NSString转换成NSData,采用NSUTF8StringEncoding编码 */
- (NSData *)convertToData;
/* 将NSData转换成NSString */
+ (NSString *)getStringFromData:(NSData *)data;

/* 是否是邮箱地址 */
- (BOOL)isEmail;
/* 是否是电话号码 */
- (BOOL)isPhoneNumber;



/**中文编码
 */
+ (NSString*)encodeStr:(NSString *)str;

/*
 对指定的参数进行url编码
 入参sourceString 是希望进行编码的字符串
 返回值是编码后的字符串,此方法对!*'();:@&=+$,/?%#[]都做了编码
 */
+ (NSString*)URLencode:(NSString *)originalString stringEncoding:(NSStringEncoding)stringEncoding;
+ (NSString *)encodeUrlStr:(NSString *)sourceString;

/**判断是不是纯数字
 */
- (BOOL)isNumText;

/**提取字符串中的首个数字范围
 */


/**第一个字符
 */
- (char)firstCharacter;

/**百度搜索链接
 */
+ (NSString*)baiduURLForKey:(NSString*) key;

/**获取字符串所占位置大小
 *@param font 字符串要显示的字体
 *@param width 每行最大宽度
 *@return 字符串大小
 */
- (CGSize)stringSizeWithFont:(UIFont*) font contraintWith:(CGFloat) width;

#pragma mark- md5

- (NSString *) md5;

#pragma mark- 验证合法性

/**判断是否是是手机号码
 */
- (BOOL)isMobileNumber;

/**特殊字符验证
 */
- (BOOL)isIncludeSpecialCharacter;

/**邮政编码验证
 */
- (BOOL)isZipCode;

/**验证固定电话
 */
- (BOOL)isTelPhoneNumber;


/**是否是身份证号码
 */
- (BOOL)isCardId;

/**是否是网址
 */
- (BOOL)isURL;

/**判断是否是整数
 */
- (BOOL)isPureInt;

/**判断是否为浮点数
 */
- (BOOL)isPureFloat;

@end

@interface NSMutableString (Utilities)

/**移除最后一个字符
 */
- (void)removeLastCharacter;

/**通过给定字符串，移除最后一个字符串
 */
- (void)removeLastStringWithString:(NSString*) str;

@end
