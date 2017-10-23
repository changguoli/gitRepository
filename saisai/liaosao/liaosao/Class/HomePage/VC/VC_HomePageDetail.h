//
//  VC_HomePageDetail.h
//  liaosao
//
//  Created by guoxuyao on 2017/4/12.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBaseViewController.h"
#import "RedBookModel.h"
#import "MKJAnimator.h"
@interface VC_HomePageDetail : GBaseViewController <MKJAnimatorDelegate>
- (void)refreshData:(RedBookDetails *)details destinationRec:(CGRect)destinationRec;


@end
