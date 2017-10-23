//
//  Logins_Model.m
//  liaosao
//
//  Created by guoxuyao on 2017/6/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Logins_Model.h"

@implementation Logins_Model
- (void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject:self.oauth_token forKey:@"oauth_token"];
    [coder encodeObject:self.uid forKey:@"uid"];
    [coder encodeObject:self.oauth_token_secret forKey:@"oauth_token_secret"];
    
}

- (id) initWithCoder: (NSCoder *) coder
{
    self.oauth_token_secret = [[coder decodeObjectForKey:@"oauth_token_secret"] copy];
    self.oauth_token = [[coder decodeObjectForKey:@"oauth_token"] copy];
    self.uid = [[coder decodeObjectForKey:@"uid"] copy];
    
    return self;
}

@end
