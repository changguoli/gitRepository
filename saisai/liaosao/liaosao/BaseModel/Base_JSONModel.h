//
//  Base_JSONModel.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Base_JSONModel : JSONModel
{
    NSMutableDictionary         *mDictionary;       // 服务端返回数据字典
}

@property(nonatomic, retain) NSMutableDictionary    *mDictionary;

// 基本公共返回字段
//@property (nonatomic,readonly)NSString              *respCode;
//@property (nonatomic,readonly)NSString              *respDesc;

// 用JSON对象初始化
-(id)initWithJsonObject:(id)aJson;
@end
