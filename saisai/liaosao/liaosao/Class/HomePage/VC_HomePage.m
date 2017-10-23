//
//  VC_HomePage.m
//  Youngs
//
//  Created by guoxuyao on 2017/3/27.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import "VC_HomePage.h"

#import "Header_HomePage.h"


static NSString *const MyCellIdentifier = @"Home_cell" ;
@interface VC_HomePage ()
@property (nonatomic,strong) NSArray *lists;
@end

@implementation VC_HomePage

- (void)viewDidLoad {
    [super viewDidLoad];

    
   
}
- (void)setupNa {
    [self setLeftSild];

    [self setRightItemWithTitle:@"ALL" selector:@selector(tapRightAction:)];
    
}

- (void)tapRightAction:(id)sender {
    UIButton *button = (UIButton *)sender;
    button.selected = !button.selected;
    button.selected ? [button setTitle:@"woow22222" forState:UIControlStateNormal] :[button setTitle:@"ALL" forState:UIControlStateNormal];
    CGSize titleSize = [@"woow22222" ex_sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(kScreenWidth, MAXFLOAT)];
    float leight = titleSize.width;
    [button setFrame:CGRectMake(0, 0, leight, 30)];

}


- (void)setupUI {
    self.customLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
    self.collectionView = [[GBase_CollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.customLayout];
    
    self.customLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    // sectionHeader高度
    //    self.customLayout.headerHeight = 80;
    // sectionFooterHeight
    //    self.CHTLayout.footerHeight = 10;
    // 间距
    self.customLayout.minimumColumnSpacing = 10;
    self.customLayout.minimumInteritemSpacing = 10;
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    
    [self.collectionView registerClass:[Home_CollectionCell class] forCellWithReuseIdentifier:MyCellIdentifier];
    
    self.view = self.collectionView;
    self.collectionView.delegate = self;
    self.collectionView.dataSource =self;
    
    
    [self refreshData];
    

    
}


- (void)refreshData
{
    __weak typeof(self)weakSelf = self;
    [[MKJParseHelper shareHelper] requestData:^(id obj, NSError *error) {
        
        weakSelf.lists = (NSArray *)obj;
        [weakSelf.collectionView reloadData];
        
        
    } failure:^(id obj, NSError *error) {
        
    }];
}



#pragma mark - collectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.lists.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    Home_CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MyCellIdentifier forIndexPath:indexPath];
    [self configCell:cell indexpath:indexPath];
    return cell;
}



- (void)configCell:(Home_CollectionCell *)cell indexpath:(NSIndexPath *)indexpath
{
    RedBookDetails *bookDetail = self.lists[indexpath.item];
    __weak typeof(cell)weakCell = cell;
    [cell.pictureView sd_setImageWithURL:[NSURL URLWithString:bookDetail.img] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image && cacheType == SDImageCacheTypeNone) {
            weakCell.pictureView.alpha = 0;
            [UIView animateWithDuration:2.0 animations:^{
                
                weakCell.pictureView.alpha = 1.0f;
                
            }];
        }
        else
        {
            weakCell.pictureView.alpha = 1.0f;
        }
    }];


    
    
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RedBookDetails *bookDetail = self.lists[indexPath.item];
    if ([bookDetail.h floatValue] > [bookDetail.w floatValue]) {
            CGFloat rate = [bookDetail.h floatValue] / [bookDetail.w floatValue];
            rate = ((kScreenWidth - 30) / 2 * rate + 120 )  / ((kScreenWidth - 30) / 2);
            return CGSizeMake(1,rate);
            
        }
        else
        {
            CGFloat rate = ((kScreenWidth - 30) / 2 + 120 )  / ((kScreenWidth - 30) / 2);
            return CGSizeMake(1, rate);
        }

    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumColumnSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    RedBookDetails *bookDetail = self.lists[indexPath.item];
    CGFloat rate = [bookDetail.h floatValue] / [bookDetail.w floatValue];
    CGFloat height = kScreenWidth * rate;
    CGFloat ViewH = CGRectGetHeight(self.view.frame);
    CGFloat y = (kScreenHeight - height)/2 ;
    
    
    
    CGRect descRec = CGRectMake(0, y, kScreenWidth, kScreenWidth * rate);
    CGRect originalRec;
    UIImageView *imageView = nil;
    Home_CollectionCell *firstCell = (Home_CollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
  
        originalRec = [firstCell.pictureView convertRect:firstCell.pictureView.frame toView:nil];
    
        imageView = firstCell.pictureView;
    
    
    VC_HomePageDetail *secondVC = [[VC_HomePageDetail alloc] init];
    [secondVC refreshData:bookDetail destinationRec:descRec];
    MKJNavigationViewController *mkjNvc = (MKJNavigationViewController *)self.navigationController;
    mkjNvc.navigationBar.hidden = YES;
    [mkjNvc pushViewController:secondVC imageView:imageView desRec:descRec original:originalRec deleagte:secondVC isRight:YES];

}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
