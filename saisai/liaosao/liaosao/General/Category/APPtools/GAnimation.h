//
//  GAnimation.h
//  JiDuANTiA
//
//  Created by guoxuyao on 16/1/19.
//  Copyright © 2016年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>
//声音
#import "AudioToolbox/AudioToolbox.h"


typedef enum
{
    RotateX,
    RotateY,
    RotateZ
}RotatePos;

@interface GAnimation : NSObject
+(void) animationFlipFromLeft:(id)sender;//翻转
+(void) animationFlipFromRight:(id)sender;

+(void) animationCurViewDown:(id)sender;//掀起
+(void) animationCurViewUp:(id)sender;

+(void) animationExplosion:(id)sender;//爆炸

+ (void)animationShake:(id)sender;
+ (void)animationShake:(id)sender  repeatCount:(float)repeatCount;

+ (void)animationShakeBounce:(id)sender;//晃动
+ (void)shakeXWithOffset:(CGFloat)aOffset breakFactor:(CGFloat)aBreakFactor duration:(CGFloat)aDuration maxShakes:(NSInteger)maxShakes sender:(id)sender;

+(void)animationShow:(id)sender;
+(void)animationHidden:(id)sender;

+(void )animationMovepoint:(id)sender point:(CGPoint )point; //点移动
+(void)animationHeartbeat:(id)sender;
+(void)animationHeartbeat:(id)sender repeatCount:(float)repeatCount;
+(void)removeAllAnimation:(id)sender;

+(void)animationRotate:(id)sender rotatePos:(RotatePos)rotatePos;//旋转
+(void)animationRotate:(id)sender rotatePos:(RotatePos)rotatePos duration:(NSTimeInterval)duration  repeatCount:(float)repeatCount;

+(void)palySound:(NSString*)soundAct;
//伸缩效果
+ (void)animationShensuo:(id)sender;


@end
