//
//  UIColor+BFExtension.m
//  BFCategories
//
//  Created by 蝴蝶 on 15/7/3.
//  Copyright (c) 2015年 butterfly. All rights reserved.
//

#import "UIColor+BFExtension.h"

@implementation UIColor (BFExtension)


#pragma mark- Hex Color

// Creates a UIColor from a Hex representation string
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    
    if ([hexString rangeOfString:@"#"].location == 0 &&
        [hexString rangeOfString:@"#"].length != 0) {
        
        NSMutableString *tempStr = [NSMutableString stringWithString:hexString];
        hexString =  [tempStr stringByReplacingOccurrencesOfString:@"#" withString:@"0x"];
        
    }else if ([hexString rangeOfString:@"#"].length == 0 ||
              [hexString rangeOfString:@"0x"].length == 0) {
        
        NSMutableString *tempStr = [NSMutableString stringWithString:hexString];
        [tempStr insertString:@"0x" atIndex:0];
        hexString = [NSString stringWithFormat:@"%@", tempStr];
    }
    
    unsigned int value;
    [[NSScanner scannerWithString:hexString] scanHexInt:&value];
    
    UIColor *color = [UIColor colorWithRed:((value >> 16) & 0xff) / 255.0 green:((value >> 8) & 0xff) / 255.0 blue:(value & 0xff) / 255.0 alpha:1.0];
    
    return color;
}

// Creates a Hex representation from a UIColor
- (NSString *)hexString {
    
    NSArray *colorArray	= [self rgbaArray];
    int r = [colorArray[0] floatValue] * 255;
    int g = [colorArray[1] floatValue] * 255;
    int b = [colorArray[2] floatValue] * 255;
    NSString *red = [NSString stringWithFormat:@"%02x", r];
    NSString *green = [NSString stringWithFormat:@"%02x", g];
    NSString *blue = [NSString stringWithFormat:@"%02x", b];
    
    return [NSString stringWithFormat:@"#%@%@%@", red, green, blue];
}

/***************************************************************************************/
/*--RGB Color--*/
/***************************************************************************************/

// Creates a UIColor With R,G,B,A
+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha {
    
    return [UIColor colorWithRed:red/255.f
                           green:green/255.f
                            blue:blue/255.f
                           alpha:alpha];
}


// Creates a UIColor With R,G,B(alpha = 1.0f)
+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue {
    
    return [self colorWithWholeRed:red
                             green:green
                              blue:blue
                             alpha:1.0f];
}

#pragma mark- Random Color

// Creates a random color
+ (UIColor *)randomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    
    return randColor;
}

#pragma mark- Modify

/*Creates either [UIColor whiteColor] or [UIColor blackColor] 
  depending on if the color this method is run on is dark or 
 light.*/
- (UIColor *)blackOrWhiteContrastingColor {
    NSArray *rgbaArray = [self rgbaArray];
    double a = 1 - ((0.299 * [rgbaArray[0] doubleValue]) + (0.587 * [rgbaArray[1] doubleValue]) + (0.114 * [rgbaArray[2] doubleValue]));
    return a < 0.5 ? [UIColor blackColor] : [UIColor whiteColor];
}

// Creates a opposite color.
- (UIColor *)oppositeColor {
    const CGFloat *componentColors = CGColorGetComponents(self.CGColor);
    
    UIColor *oppositeColor = [[UIColor alloc] initWithRed:(1.0 - componentColors[0])
                                                    green:(1.0 - componentColors[1])
                                                     blue:(1.0 - componentColors[2])
                                                    alpha:componentColors[3]];
    return oppositeColor;
}

// Creates a translucency color.
- (UIColor *)colorForTranslucency {
    CGFloat hue = 0, saturation = 0, brightness = 0, alpha = 0;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return [UIColor colorWithHue:hue saturation:saturation*1.158 brightness:brightness*0.95 alpha:alpha];
}

// Creates a color by lighten.
- (UIColor *)lightenColor:(CGFloat)lighten {
    
    CGFloat hue = 0, saturation = 0, brightness = 0, alpha = 0;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    return [UIColor colorWithHue:hue
                      saturation:saturation*(1-lighten)
                      brightness:brightness*(1+lighten)
                           alpha:alpha];
}

//Creates a color by darken.
- (UIColor *)darkenColor:(CGFloat)darken {
    CGFloat hue = 0, saturation = 0, brightness = 0, alpha = 0;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    return [UIColor colorWithHue:hue
                      saturation:saturation*(1+darken)
                      brightness:brightness*(1-darken)
                           alpha:alpha];
}

#pragma mark- Gradient Color

// creates a gradient color by two color
+ (UIColor *)gradientFromColor:(UIColor *)firstColor
                       toColor:(UIColor *)secondColor
                    withHeight:(NSInteger)height {
    CGSize size = CGSizeMake(1, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray* colors = [NSArray arrayWithObjects:(id)firstColor.CGColor, (id)secondColor.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
    
}

#pragma mark- Helper

- (NSArray *)rgbaArray {
    CGFloat r=0,g=0,b=0,a=0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    }else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    
    return @[@(r),@(g),@(b),@(a)];
}


//随机几种固定的颜色
+ (UIColor *)randomColor_Custom {
    int randomIndex = arc4random() % 5;
    switch (randomIndex) {
        case 0:
            return [UIColor groupTableViewBackgroundColor];
            break;
        case 1:
            return [UIColor grayColor];
            break;
        case 2:
            return [UIColor brownColor];
            break;
        case 3:
            return [UIColor lightGrayColor];
            break;
        case 4:
            return [UIColor lightTextColor];
            break;

            
        default:
            break;
    }
    return [UIColor groupTableViewBackgroundColor];
    
    
}

@end
