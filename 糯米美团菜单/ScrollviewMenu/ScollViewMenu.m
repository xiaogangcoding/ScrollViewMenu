//
//  ScollViewMenu.m
//  糯米美团菜单
//
//  Created by wg on 16/4/6.
//  Copyright © 2016年 ubetween. All rights reserved.
//

#import "ScollViewMenu.h"
#import "Header.h"
#import "UIView+MJExtension.h"

@interface ScollViewMenu () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,retain) UIPageControl *pageCtrl;
@property (nonatomic,assign) NSUInteger pageCount;


@end

static NSString *reuseIdentifier = @"cell";
@implementation ScollViewMenu

- (instancetype)initWithFrame:(CGRect)frame ModelArray:(NSArray *)array
{
    if (self = [super initWithFrame:frame]) {

        _dataArray = [NSMutableArray arrayWithArray:array];
        _pageCount = _dataArray.count%8 == 0 ? _dataArray.count/8 : _dataArray.count/8 + 1;
        [self initView];
    }
    return self;
}

- (void)initView
{

    UICollectionViewFlowLayout * flowLayOut =[[UICollectionViewFlowLayout alloc]init];
    flowLayOut.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    flowLayOut.itemSize = CGSizeMake(cellW,cellH);
    flowLayOut.minimumInteritemSpacing = 0;
    flowLayOut.minimumLineSpacing = 0;

    _collectionView =[[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayOut];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.pagingEnabled = YES;
    [_collectionView registerClass:[MenuItemCell class] forCellWithReuseIdentifier:reuseIdentifier];

    [self addSubview:_collectionView];

    _pageCtrl =[[UIPageControl alloc]initWithFrame:CGRectMake((DeviceWidth-200)/2.0,self.mj_h - 5, 200, 5)];
    _pageCtrl.userInteractionEnabled = NO;
    _pageCtrl.hidesForSinglePage = YES;//只有一页时默认不显示pageCtrl
    _pageCtrl.pageIndicatorTintColor = [UIColor colorWithRed:0.815 green:0.811 blue:0.817 alpha:1.000];
    _pageCtrl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.124 green:0.353 blue:0.075 alpha:1.000];
    [_pageCtrl setCurrentPage:0];
    _pageCtrl.numberOfPages = _pageCount;
    [self addSubview:_pageCtrl];




}

#pragma mark - 代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    //为了能够分页显示,创建假的单元格,让内容为空,点击为no
    return  _dataArray.count + (_dataArray.count%totalCount == 0 ? 0 : totalCount - _dataArray.count%totalCount);

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    MenuItemCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.block = ^(MenuItemModel *model){
        if (self.menuItemSelectedBlock) {
            self.menuItemSelectedBlock(model);
        }
    };
    cell.model = [[MenuItemModel alloc] init];
//    cell.backgroundColor = RandomColor;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


}
#pragma mark - layout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(margin, 0, margin, 0);
}


#pragma mark - scrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    int pageNum = (scrollView.contentOffset.x + DeviceWidth * 0.5)/DeviceWidth;
    int index = pageNum % _pageCount;
    _pageCtrl.currentPage = index;
}


@end
