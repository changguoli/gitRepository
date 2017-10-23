//
//  HomeDetail_Scrollview.h
//  liaosao
//
//  Created by guoxuyao on 2017/4/12.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^tapAction) ();

@interface HomeDetail_Scrollview : UIScrollView
@property (nonatomic,assign) CGRect ImageFrame;
@property (nonatomic,strong) UIImageView *pictureImageView;



@property (nonatomic,copy) tapAction tapAction;
@end
