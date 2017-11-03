//
//  Mine_model.h
//  liaosao
//
//  Created by guoxuyao on 2017/4/14.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Base_JSONModel.h"
//我的model
@interface Mine_model : Base_JSONModel

@end
//我的详情
@interface MineDetail_model : Base_JSONModel
@property (nonatomic,readonly) NSString  *following_count;
@property (nonatomic,readonly) NSString  *location;
@property (nonatomic,readonly) NSString  *uname;
@property (nonatomic,readonly) NSString  *sex;
@property (nonatomic,readonly) NSString  *level_src;
@property (nonatomic,readonly) NSString  *weibo_count;
@property (nonatomic,readonly) NSString  *uid;
@property (nonatomic,readonly) NSString  *is_admin;
@property (nonatomic,readonly) NSString  *avatar;
@property (nonatomic,readonly) NSString  *photo_count;
@property (nonatomic,readonly) NSString  *is_in_blacklist;
@property (nonatomic,readonly) NSString  *gift_count;
@end
