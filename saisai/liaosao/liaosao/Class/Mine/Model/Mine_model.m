//
//  Mine_model.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/14.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Mine_model.h"

@implementation Mine_model

@end


@implementation MineDetail_model
-(NSString *)following_count{
    return [mDictionary objectForKey:@"following_count"];
}

-(NSString *)location{
    return [mDictionary objectForKey:@"location"];
}

-(NSString *)uname{
    return [mDictionary objectForKey:@"uname"];
}

-(NSString *)sex{
    return [mDictionary objectForKey:@"sex"];
}

-(NSString *)level_src{
    return [mDictionary objectForKey:@"level_src"];
}

-(NSString *)weibo_count{
    return [mDictionary objectForKey:@"weibo_count"];
}

-(NSString *)uid{
    return [mDictionary objectForKey:@"uid"];
}

-(NSString *)is_admin{
    return [mDictionary objectForKey:@"is_admin"];
}

-(NSString *)avatar{
    return [mDictionary objectForKey:@"avatar"];
}

-(NSString *)photo_count{
    return [mDictionary objectForKey:@"photo_count"];
}

-(NSString *)is_in_blacklist{
   return [mDictionary objectForKey:@"is_in_blacklist"];
}

-(NSString *)gift_count{
   return [mDictionary objectForKey:@"gift_count"];
}
@end
