//
//  MKJNavigationViewController.h
//  liaosao
//
//  Created by guoxuyao on 2017/4/12.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKJAnimator.h"

@interface MKJNavigationViewController : UINavigationController
- (void)pushViewController:(UIViewController *)viewController imageView:(UIImageView *)imageView desRec:(CGRect)desRec original:(CGRect)originalRec deleagte:(id<MKJAnimatorDelegate>)delegate isRight:(BOOL)isRight;
@end
