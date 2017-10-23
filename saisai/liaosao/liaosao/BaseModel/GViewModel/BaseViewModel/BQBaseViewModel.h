//
//  BQBaseViewModel.h
//  DevelopFramework
//
//  Created by momo on 15/12/5.
//  Copyright © 2015年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface BQBaseViewModel : NSObject

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, strong) NSMutableArray *dataArrayList;
@property (nonatomic,strong) NSDictionary *dataDic;

//@property (strong, nonatomic) ReturnValueBlock returnBlock;
//@property (strong, nonatomic) ErrorCodeBlock errorBlock;
//@property (strong, nonatomic) FailureBlock failureBlock;


+ (instancetype)modelWithViewController:(UIViewController *)viewController;

/**
 *  返回指定indexPath的item
 */
- (instancetype)modelAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  显示多少组 (当tableView为Group类型时设置可用)
 */
- (NSUInteger)numberOfSections;

/**
 *  每组中显示多少行 (用于tableView)
 */
- (NSUInteger)numberOfRowsInSection:(NSUInteger)section;

/**
 *  每组中显示多少个 (用于collectionView)
 */
- (NSUInteger)numberOfItemsInSection:(NSUInteger)section;

/**
 *  分离加载首页控制器内容 (内部使用)
 */
- (void)getDataList:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSArray *array))success failure:(void (^)(NSError *error))failure;

/**
 *  用来判断是否加载成功,方便外部根据不同需求处理 (外部使用)
 */
- (void)getDataListSuccess:(void (^)( ))success failure:(void (^)( ))failure;

/*
 其他调用 暂时不用
 */
//-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
//                 WithErrorBlock: (ErrorCodeBlock) errorBlock
//               WithFailureBlock: (FailureBlock) failureBlock;

/*
 通用数据处理
 */


@end
