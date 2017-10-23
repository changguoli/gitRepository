//
//  MineViews.h
//  liaosao
//
//  Created by guoxuyao on 2017/4/24.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBaseView.h"
//其他
@interface MineViews : GBaseView

@end

//猪排认证
@interface MineViews_Approve : GBaseView

@end

// gongong
@interface MineViews_Public : GBaseView
@property (nonatomic,strong) NSArray *labelArr;




@end

//我的积分

@interface MineViews_MindeTotal : GBaseView
@property (nonatomic,strong) GBaseLabel *leftLabel;
@property (nonatomic,strong) GBaseLabel *middleLabel;

@property (nonatomic,strong) GBaseLabel *rightLabel;




@end

//我的积分下边的View
@interface MineViews_MindeTotal_BottomView : GBaseView
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;
@property (nonatomic,strong)UILabel *totalLabel;


@end



