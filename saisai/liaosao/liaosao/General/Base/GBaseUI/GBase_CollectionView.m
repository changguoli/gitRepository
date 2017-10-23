//
//  GBase_CollectionView.m
//  liaosao
//
//  Created by guoxuyao on 2017/4/10.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "GBase_CollectionView.h"

@implementation GBase_CollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self =[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.showsVerticalScrollIndicator= NO;
        self.showsHorizontalScrollIndicator=NO;
        
    }
    return self;
}



#pragma mark - Private   MJrefresh

- (void)createHeaderView{
    
    if (!self.mj_header) {
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNew)];
    }
    
}

- (void)removeHeaderView{
    self.mj_header = nil;
}

- (void)creatFooterView{
    
    if (!self.mj_footer) {
        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    }
    
}

- (void)removeFooterView {
    self.mj_footer = nil;
}

- (void)didFinishLoadData {
    
}


#pragma mark - Public

- (void)loadBegin:(YHRefreshType)type{
    kShowMessage_loding(@"加载中...");
    switch (type)
    {
        case YHRefreshType_LoadNew:
        {
            [self createHeaderView];
        }
            break;
        case YHRefreshType_LoadMore:
        {
            [self creatFooterView];
        }
            break;
        default:
            break;
    }
}

- (void)loadFinish:(YHRefreshType)type{
    kHidHUD_Loding;
    switch (type)
    {
        case YHRefreshType_LoadNew:
        {
            [self.mj_header endRefreshing];
        }
            break;
        case YHRefreshType_LoadMore:
        {
            [self.mj_footer endRefreshing];
        }
            break;
        default:
            break;
    }
}

- (void)endRefreshingWithNoMoreData{
    
}



#pragma mark - Setter

- (void)setEnableLoadNew:(BOOL)enableLoadNew
{
    _enableLoadNew = enableLoadNew;
    if (_enableLoadNew) {
        [self createHeaderView];
    }
    else {
        [self removeHeaderView];
    }
}

- (void)setEnableLoadMore:(BOOL)enableLoadMore
{
    _enableLoadMore = enableLoadMore;
    if (_enableLoadMore) {
        [self creatFooterView];
    }
    else {
        [self removeFooterView];
    }
}


- (void)setNoData:(BOOL)noData{
    _noData = noData;
    kShowMessage(@"暂无数据");
    
}

- (void)setNoData:(BOOL)noData withText:(NSString *)tips{
    
    
}
- (void)setNoMoreData:(BOOL)noMoreData{
    _noMoreData = noMoreData;
    if (_noMoreData) {
        [self.mj_footer endRefreshingWithNoMoreData];
    }
    else{
        [self.mj_footer resetNoMoreData];
    }
}

#pragma mark - override  重写load

- (void)reloadData {
    [super reloadData];
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        if ([self.dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
            if ([self.dataSource numberOfSectionsInCollectionView:self] > 0 && [self.dataSource collectionView:self numberOfItemsInSection:0] > 0) {
                kHidHUD_Loding;
            }
        }
        else {
            
            if ( [self.dataSource collectionView:self numberOfItemsInSection:0] > 0 ) {
                kHidHUD_Loding;
                
            }
        }
        
    }
}


#pragma mark - MJRefresh delegate  YHRefreshTableViewDelegate

- (void)loadNew
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(refreshTableViewLoadNew:)]) {
        [self.delegate performSelector:@selector(refreshTableViewLoadNew:) withObject:self];
    }
}

- (void)loadMore
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(refreshTableViewLoadmore:)]) {
        [self.delegate performSelector:@selector(refreshTableViewLoadmore:) withObject:self];
    }
}


@end
