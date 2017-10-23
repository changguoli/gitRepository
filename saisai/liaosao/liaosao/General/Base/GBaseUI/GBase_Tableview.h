//
//  GBase_Tableview.h
//  liaosao
//
//  Created by guoxuyao on 2017/4/10.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <UIKit/UIKit.h>



@class GBase_Tableview;

@protocol YHRefreshTableViewDelegate <NSObject>

- (void)refreshTableViewLoadNew:(GBase_Tableview*)view;
- (void)refreshTableViewLoadmore:(GBase_Tableview*)view;

@end

@interface GBase_Tableview : UITableView
@property (nonatomic,assign )   IBInspectable   BOOL enableLoadNew;
@property (nonatomic, assign)  IBInspectable   BOOL enableLoadMore;
@property (nonatomic, assign)   BOOL noData;            //无数据
@property (nonatomic, assign)   BOOL noMoreData;//上拉加载无更多数据

//开始加载
- (void)loadBegin:(YHRefreshType)type;
//结束加载
- (void)loadFinish:(YHRefreshType)type;



@end
