//
//  UITextField+BFShake.m
//  BFCategoryKit
//
//  Created by 蝴蝶 on 15/2/3.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "UITextField+BFShake.h"

@implementation UITextField (BFShake)

- (void)shake:(int)times withDelta:(CGFloat)delta
{
    [self shake:times withDelta:delta completion:nil];
}

- (void)shake:(int)times withDelta:(CGFloat)delta completion:(void(^)())handler
{
    [self _shake:times direction:1 currentTimes:0 withDelta:delta andSpeed:0.03 shakeDirection:BFTextFieldShakeDirectionHorizontal completion:handler];
}

- (void)shake:(int)times withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval
{
    [self shake:times withDelta:delta speed:interval completion:nil];
}

- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void(^)())handler
{
    [self _shake:times direction:1 currentTimes:0 withDelta:delta andSpeed:interval shakeDirection:BFTextFieldShakeDirectionHorizontal completion:handler];
}

- (void)shake:(int)times withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval shakeDirection:(BFTextFieldShakeDirection)shakeDirection
{
    [self shake:times withDelta:delta andSpeed:interval shakeDirection:shakeDirection completion:nil];
}

- (void)shake:(int)times withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval shakeDirection:(BFTextFieldShakeDirection)shakeDirection completion:(void(^)())handler
{
    [self _shake:times direction:1 currentTimes:0 withDelta:delta andSpeed:interval shakeDirection:shakeDirection completion:handler];
}

- (void)_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval shakeDirection:(BFTextFieldShakeDirection)shakeDirection completion:(void(^)())handler
{
    [UIView animateWithDuration:interval animations:^{
        self.transform = (shakeDirection == BFTextFieldShakeDirectionHorizontal) ? CGAffineTransformMakeTranslation(delta * direction, 0) : CGAffineTransformMakeTranslation(0, delta * direction);
    } completion:^(BOOL finished) {
        if(current >= times) {
            [UIView animateWithDuration:interval animations:^{
                self.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                if (handler) {
                    handler();
                }
            }];
            return;
        }
        [self _shake:(times - 1)
           direction:direction * -1
        currentTimes:current + 1
           withDelta:delta
            andSpeed:interval
      shakeDirection:shakeDirection completion:handler];
    }];
}

@end
