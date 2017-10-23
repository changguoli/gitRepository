//
//  Logins_Model.h
//  liaosao
//
//  Created by guoxuyao on 2017/6/23.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Base_JSONModel.h"
/*{"oauth_token":"6f5bdd59f58dfd1e21f80f84b80e54d1","oauth_token_secret":"d85d5e7e019813b61385f9eeddc32ce4","uid":2,"status":1}*/
@interface Logins_Model : Base_JSONModel
@property (nonatomic,copy) NSString *oauth_token_secret;
@property (nonatomic,copy) NSString *oauth_token;
@property (nonatomic,copy) NSString *uid;
@end
