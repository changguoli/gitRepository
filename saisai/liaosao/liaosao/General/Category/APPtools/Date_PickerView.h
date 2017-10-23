//
//  Date_PickerView.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/30.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LGLDatePickerrMode) {
    LGLDatePickerModeTime,           // 选择时间
    LGLDatePickerModeDate,           // 日期
    LGLDatePickerModeDateAndTime,    // 日期和时间
    LGLDatePickerModeCountDownTimer, // 可以用于倒计时
};

/** 回调Block*/
typedef void(^DateSelectBlock)(NSString * date);

@interface Date_PickerView : NSObject

@property (nonatomic, copy) DateSelectBlock block;
+ (instancetype)shareDatePiker;
- (void)datePikerShowWithMode:(LGLDatePickerrMode)mode  setMAXTime:(BOOL)maxTime; //默认设置当前日期 maxTime :设置当前时间为最大时间最大时间
- (void)dateCallBackSelectBlock:(DateSelectBlock)block;

@end
