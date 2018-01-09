//
//  YFNewWelfareCell.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/9.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "YFNewWelfareCell.h"
#import "DCNewWelfareLayout.h"
#import "YFGoodsHandheldCell.h"
@interface YFNewWelfareCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,DCNewWelfareLayoutDelegate>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

@end
static NSString *const YFGoodsHandheldCellID = @"YFGoodsHandheldCell";
@implementation YFNewWelfareCell

#pragma mark - lazyload
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        DCNewWelfareLayout *dcLayout = [DCNewWelfareLayout new];
        dcLayout.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:dcLayout];
        _collectionView.frame = self.bounds;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self addSubview:_collectionView];
        
        [_collectionView registerClass:[YFGoodsHandheldCell class] forCellWithReuseIdentifier:YFGoodsHandheldCellID];
        
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderReusableView"]; //注册头部
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterReusableView"]; //注册尾部
    }
    return _collectionView;
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpBase];
    }
    return self;
}


#pragma mark - initialize
- (void)setUpBase
{
    self.backgroundColor = [UIColor clearColor];
    self.collectionView.backgroundColor = self.backgroundColor;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YFGoodsHandheldCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YFGoodsHandheldCellID forIndexPath:indexPath];
    NSArray *images = GoodsNewWelfareImagesArray;
    cell.handheldImage = images[indexPath.row];
    return cell;
    
}

// 返回每一组的头部或尾部视图
// 会自动的在每一组的头部和尾部加上这个视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderReusableView" forIndexPath:indexPath];
        return headerView;
        
    } else if (kind == UICollectionElementKindSectionFooter) {
        
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FooterReusableView" forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor clearColor];
        return footerView;
    }
    
    return [UICollectionReusableView new];
}


#pragma mark - item点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"第%zd个item",indexPath.row);
    
}


#pragma mark - DCItemSortLayoutDelegate
#pragma mark - 底部高度
-(CGFloat)dc_HeightOfSectionFooterForIndexPath:(NSIndexPath *)indexPath {
    return 10;
}
#pragma mark - 头部高度
-(CGFloat)dc_HeightOfSectionHeaderForIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

@end
