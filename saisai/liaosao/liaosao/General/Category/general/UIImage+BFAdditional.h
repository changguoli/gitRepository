//
//  UIImage+BFAdditional.h
//  BFCategoryKit
//
//  Created by 蝴蝶 on 15/2/3.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BFAdditional)

#pragma mark- Create A Image

/* 根据颜色生成图片 */
+ (UIImage *)imageFromColor:(UIColor *)color;
+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size;

/* 获取屏幕截图 */
+ (UIImage *)screenshot;

#pragma mark- The Operation For Image

/* 缩放图片 */
- (UIImage*)scaleToSize:(CGSize)newSize;
/* 裁剪图片 */
- (UIImage *)croppedImage:(CGRect)bounds;




@end
