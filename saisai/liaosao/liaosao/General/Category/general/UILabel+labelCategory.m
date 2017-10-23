//
//  UILabel+labelCategory.m
//  liaosao
//
//  Created by guoxuyao on 2017/7/7.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "UILabel+labelCategory.h"

@implementation UILabel (labelCategory)
- (void)setLabelFont:(UIFont *)font color:(UIColor *)color text:(NSString *)text {
    self.text = text;
    self.font = font;
    self.textColor = color;
    
    
}
@end
