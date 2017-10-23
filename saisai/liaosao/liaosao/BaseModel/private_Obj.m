//
//  private_Obj.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "private_Obj.h"
#import "VC_HomePage.h"

@implementation private_Obj
/*私有加密*/
- (NSString *)getDIC:(NSDictionary*)dic{
    //去空格和换行符
    NSString *jsonStr = [[NSString dictionaryToJson:dic] trimmingWhitespaceAndNewlines];
    //通用51ygs.com
    
    NSInteger nowTime = [[NSDate date] timeIntervalSince1970];
    NSString *md5Result = [jsonStr stringByAppendingFormat:@"%ld%@",(long)nowTime,kSecretKey_YGS];
    
    
    return md5Result;
}

//URL拼接get
- (NSString *)getUrlJoin:(NSString *)rootURL joinDic:(NSDictionary *)dic {
    
    NSMutableString *urlString=[NSMutableString stringWithFormat:@"%@?",rootURL];
    NSArray *paraArray=[dic allKeys];
    for (NSString *key in paraArray) {
        [urlString appendFormat:@"%@=%@&",key,[dic objectForKey:key]];
 
    }
    [urlString deleteCharactersInRange:NSMakeRange([urlString length]-1, 1)];
   // [urlString substringToIndex:urlString.length-1];
    return  urlString;
    
}


/*
 
 */


@end
