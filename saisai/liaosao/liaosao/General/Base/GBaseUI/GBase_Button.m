//
//  GBase_Button.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/22.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBase_Button.h"

@implementation GBase_Button

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    return [super titleRectForContentRect:contentRect];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    return [super imageRectForContentRect:contentRect];
}



//创建imagebutton
+ (GBase_Button *)imageButtonWithTarget:(id)target action:(SEL)action image:(NSString *)image highLightImage:(NSString *)highLightImage {
    GBase_Button *btn=[[GBase_Button alloc]init];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highLightImage] forState:UIControlStateHighlighted];
    CGSize size=btn.currentBackgroundImage.size;
    btn.frame=CGRectMake(0, 0, size.width, size.height);
    return btn;
}





//创建titlebutton
+ (GBase_Button *)titleButtonWithTarget:(id)target action:(SEL)action  title:(NSString *)title {
    GBase_Button *btn=[[GBase_Button alloc]init];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    CGSize size=btn.currentBackgroundImage.size;
    btn.frame=CGRectMake(0, 0, size.width, size.height);
    return btn;
}




//创建imagetitlebutton
+ (GBase_Button *)titleButtonWithTarget:(id)target action:(SEL)action image:(NSString *)image highLightImage:(NSString *)highLightImage title:(NSString *)title imageRect:(CGRect)imageRect titleRect:(CGRect)titleRect{
    
    GBase_Button *btn=[[GBase_Button alloc]init];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highLightImage] forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    
    btn.titleRect = titleRect;
    btn.imageRect = imageRect;
    
    
    CGSize size=btn.currentBackgroundImage.size;
    btn.frame=CGRectMake(0, 0, size.width, size.height);
    return btn;
}


//创建imagetitlebutton
+ (GBase_Button *)systomTitleButtonWithTarget:(id)target action:(SEL)action image:(NSString *)image highLightImage:(NSString *)highLightImage title:(NSString *)title {
    
    GBase_Button *btn=[[GBase_Button alloc]init];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image]  forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highLightImage] forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    
    
    
    CGSize size=btn.currentBackgroundImage.size;
    btn.frame=CGRectMake(0, 0, size.width, size.height);
    return btn;
}



@end
