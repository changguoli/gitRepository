//
//  LoginViews.h
//  liaosao
//
//  Created by guoxuyao on 2017/6/21.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBaseView.h"
#import "ImageTFVIew.h"

@protocol LoginS_Delegate <NSObject>

- (void)loginActionButton:(UIButton *)button;

@end


@interface LoginViews : GBaseView

@property (nonatomic,strong)ImageTFVIew *phoneView;
@property (nonatomic,strong)ImageTFVIew *passWordView;

@property (nonatomic,strong) UIButton *bottomBT;

@property (nonatomic,weak)id <LoginS_Delegate> loginDelegate;





@end


@interface RegisterView : GBaseView

@property (nonatomic,strong)ImageTFVIew *phoneView;
@property (nonatomic,strong)ImageTFRightBT *codeView;

@property (nonatomic,strong)ImageTFVIew *passWordView;
@property (nonatomic,strong) UIButton *bottomBT;

@property (nonatomic,weak)id <LoginS_Delegate> loginDelegate;




@end


@interface ForgetView : GBaseView

@property (nonatomic,strong)ImageTFVIew *phoneView;
@property (nonatomic,strong)ImageTFRightBT *codeView;

@property (nonatomic,strong)ImageTFVIew *passWordView;

@property (nonatomic,strong) UIButton *bottomBT;


@property (nonatomic,weak)id <LoginS_Delegate> loginDelegate;



@end

