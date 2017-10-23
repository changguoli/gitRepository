//
//  Home_YTKRequest.h
//  Youngs
//
//  Created by guoxuyao on 2017/4/1.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Base_YTKRequest.h"

@interface Home_YTKRequest : Base_YTKRequest
- (id) initwithFirst:(NSString *)first;
@end
//kgetSlideShow_URL

@interface GetSlideShow_YTKRequest : Base_YTKRequest
- (id) initWithGetSlideShow:(NSDictionary *)slideDic;
@end
