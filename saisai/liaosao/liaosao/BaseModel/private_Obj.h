//
//  private_Obj.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface private_Obj : NSObject
/*私有加密*/
- (NSString *)getDIC:(NSDictionary*)dic ;

//URL拼接
- (NSString *)getUrlJoin:(NSString *)rootURL joinDic:(NSDictionary *)dic;


@end
