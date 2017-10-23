//
//  UIColor+BFExtension.h
//  BFCategories
//
//  Created by 蝴蝶 on 15/7/3.
//  Copyright (c) 2015年 butterfly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BFExtension)


/***************************************************************************************/
/*--Hex Color--*/
/***************************************************************************************/


/**
 *  Creates a UIColor from a Hex representation string
 *
 *  @param    hexString   Hex string that looks like @"#FF0000" or @"FF0000",@"0x800000"
 *
 *  @return   UIColor
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString;

/**
 *  Creates a Hex representation from a UIColor
 *
 *  @return   NSString
 */
- (NSString *)hexString;


/***************************************************************************************/
/*--RGB Color--*/
/***************************************************************************************/


/**
 *  Creates a UIColor With R,G,B,A
 *
 *  @param    red 0-255
 *  @param    green 0-255
 *  @param    blue 0-255
 *  @param    alpha 0-1
 *
 *  @return   UIColor
 */
+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha;


/**
 *  Creates a UIColor With R,G,B(alpha = 1.0f)
 *
 *  @param    red 0-255
 *  @param    green 0-255
 *  @param    blue 0-255
 *
 *  @return   UIColor
 */
+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue;


/***************************************************************************************/
/*--Random Color--*/
/***************************************************************************************/


/**
 *  Creates a random color
 *
 *  @return   UIColor
 */
+ (UIColor *)randomColor;


/***************************************************************************************/
/*--Modify--*/
/***************************************************************************************/


/**
 *  Creates either [UIColor whiteColor] or [UIColor blackColor]
 *  depending on if the color this method is run on is dark or light.
 *
 *  @return    UIColor
 */
- (UIColor *)blackOrWhiteContrastingColor;

/**
 *  Creates a opposite color.
 *  
 *  @return   UIColor(反转)
 */
- (UIColor *)oppositeColor;

/**
 *  Creates a translucency color.
 *
 *  @return   UIColor(透明)
 */
- (UIColor *)colorForTranslucency;

/**
 *  Creates a color by lighten.
 *
 *  @param    lighten  亮度
 *
 *  @return   UIColor
 */
- (UIColor *)lightenColor:(CGFloat)lighten;

/**
 *  Creates a color by darken.
 *
 *  @param    darken  暗度
 *
 *  @return   UIColor
 */
- (UIColor *)darkenColor:(CGFloat)darken;


/***************************************************************************************/
/*--Gradient Color--*/
/***************************************************************************************/


/**
 *  creates a gradient color by two color
 *
 *  @param    firstColor  first color
 *  @param    secondColor second color
 *
 *  @return   UIColor  a gradient color
 */
+ (UIColor *)gradientFromColor:(UIColor*)firstColor
                       toColor:(UIColor*)secondColor
                    withHeight:(NSInteger)height;


//随机几种固定的颜色
+ (UIColor *)randomColor_Custom;




@end
