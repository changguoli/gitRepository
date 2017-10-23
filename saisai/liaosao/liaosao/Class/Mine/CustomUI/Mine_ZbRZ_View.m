//
//  Mine_ZbRZ_View.m
//  liaosao
//
//  Created by guoxuyao on 2017/7/2.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "Mine_ZbRZ_View.h"

#define ktopText @"认证说明："

#define kbottomtext @"认证说明:\n1.请模仿实例动作，否则不会通过认证\n2.认证照片仅供系统审核，任何人不可见\n3.认证照片需要五官清晰,无遮挡物\n4.认证者仅限女性，须具有一定颜值\n5.请确保头像真实性\n6.认证前请确保基本资料已填写完毕"

#define kmargin_middle 20
#define kpicWidth  (kScreenWidth - 2*kSpace_middle - kmargin_middle)/2.0
#define kpicheight  kpicWidth /5.0 *9.0
@implementation Mine_ZbRZ_View
{
    UILabel *_topLabel;//头部标题
    
    UIImageView *_LeftImageView;
    
    UIButton *_rightBT;//右侧上传图片标示
    
    UIButton *_bottomBT;//确定上传图片
    
    UILabel *_bottomLabel; //底部解释
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutAllSubViews];
    }
   
    return self;
    
    
}
#define kstringText @"认证成功后获得标示"

- (void)layoutAllSubViews {
    self.backgroundColor = white_color;
    _topLabel = [[UILabel alloc] init];
    _topLabel.attributedText = [NSString stringWithUIImage:kstringText];
    _topLabel.textAlignment = NSTextAlignmentCenter;
    
    _LeftImageView = [[UIImageView alloc] init];
    _LeftImageView.image = ImageNamed(@"upload");
    _LeftImageView.contentMode= UIViewContentModeScaleAspectFit;

    _rightBT = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightBT setImage:ImageNamed(@"upload") forState:UIControlStateNormal];
    _rightBT.imageView.contentMode= UIViewContentModeScaleAspectFit;
    
    _bottomBT = [UIButton buttonWithType:UIButtonTypeCustom];
    _bottomLabel = [[UILabel alloc] init];
    _bottomLabel.text = kbottomtext;
    _bottomLabel.numberOfLines = 0;
    [self addSubview:_topLabel];
    [self addSubview:_LeftImageView];
    [self addSubview:_rightBT];
    [self addSubview:_bottomBT];
    [self addSubview:_bottomLabel];
    [_bottomBT setBackgroundColor:kFense_Color];
    [_bottomBT setTitle:@"上传认证" forState:UIControlStateNormal];
    
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenWidth);
        make.top.left.equalTo(self);
        make.height.mas_equalTo(60);
    }];
 
    
    [_LeftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topLabel.mas_bottom).offset(kSpace_middle);
        make.left.equalTo(self).offset(kSpace_middle);
        make.size.mas_equalTo(CGSizeMake(kpicWidth, kpicheight));
        
    }];
    
    [_rightBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topLabel.mas_bottom).offset(kSpace_middle);
        make.left.equalTo(_LeftImageView.mas_right).offset(kmargin_middle);
        make.size.mas_equalTo(CGSizeMake(kpicWidth, kpicheight));
        
    }];
    
    [_bottomBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_LeftImageView.mas_bottom).offset(15);
        make.left.equalTo(self).offset(kSpace_middle);
        make.width.mas_equalTo(kScreenWidth-kSpace_middle *2);
        make.height.mas_equalTo(50);
        
    }];
    
    
    [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bottomBT.mas_bottom).offset(15);
        make.left.equalTo(self).offset(kSpace_middle);
        make.width.mas_equalTo(kScreenWidth-kSpace_middle *2);
        make.bottom.equalTo(self).offset(-kSpace_middle);
    }];
    
    
    
}




@end
