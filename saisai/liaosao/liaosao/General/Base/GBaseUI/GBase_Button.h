//
//  GBase_Button.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/22.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBase_Button : UIButton
@property (nonatomic,assign) CGRect titleRect;
@property (nonatomic,assign) CGRect imageRect;


+ (GBase_Button *)imageButtonWithTarget:(id)target action:(SEL)action image:(NSString *)image highLightImage:(NSString *)highLightImage;

//创建titlebutton
+ (GBase_Button *)titleButtonWithTarget:(id)target action:(SEL)action  title:(NSString *)title;
//创建imagetitlebutton
+ (GBase_Button *)titleButtonWithTarget:(id)target action:(SEL)action image:(NSString *)image highLightImage:(NSString *)highLightImage title:(NSString *)title imageRect:(CGRect)imageRect titleRect:(CGRect)titleRect;

//创建imagetitlebutton
+ (GBase_Button *)systomTitleButtonWithTarget:(id)target action:(SEL)action image:(NSString *)image highLightImage:(NSString *)highLightImage title:(NSString *)title;

@end
