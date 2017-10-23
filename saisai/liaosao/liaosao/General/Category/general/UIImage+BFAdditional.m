//
//  UIImage+BFAdditional.m
//  BFCategoryKit
//
//  Created by 蝴蝶 on 15/2/3.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "UIImage+BFAdditional.h"

@implementation UIImage (BFAdditional)

#pragma mark- Create A Image

/* 根据颜色生成图片 */
+ (UIImage *)imageFromColor:(UIColor *)color {
    return [UIImage imageFromColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/* 获取屏幕截图 */
+ (UIImage *)screenshot {
    
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    
//    if (NULL != UIGraphicsBeginImageContextWithOptions) {
//        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
//    } else {
//        UIGraphicsBeginImageContext(imageSize);
//    }
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen]) {
            CGContextSaveGState(context);
            
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            
            CGContextConcatCTM(context, [window transform]);
            
            CGContextTranslateCTM(context,
                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
            
            [[window layer] renderInContext:context];
            
            CGContextRestoreGState(context);
        }
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark- The Operation For Image

/* 缩放图片 */
- (UIImage*)scaleToSize:(CGSize)newSize {
    
    UIGraphicsBeginImageContext(newSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0, newSize.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, newSize.width, newSize.height), self.CGImage);
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

/* 裁剪图片 */
- (UIImage *)croppedImage:(CGRect)bounds {
    
    CGFloat scale = MAX(self.scale, 1.0f);
    
    CGRect scaledBounds = CGRectMake(bounds.origin.x * scale, bounds.origin.y * scale, bounds.size.width * scale, bounds.size.height * scale);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], scaledBounds);
    
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:UIImageOrientationUp];
    
    CGImageRelease(imageRef);
    
    return croppedImage;
}



@end
