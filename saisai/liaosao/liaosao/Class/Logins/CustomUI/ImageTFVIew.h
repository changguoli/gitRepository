//
//  ImageTFVIew.h
//  liaosao
//
//  Created by guoxuyao on 2017/6/21.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageTFVIew : GBaseView
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UITextField *rightTextFiled;

- (void)setImage:(NSString *)imageStr textFieldText:(NSString *)textStr;


@end


@interface ImageTFRightBT : ImageTFVIew
@property (nonatomic,strong) UIButton *rightT;

@end
