//
//  YFExceedApplianceCell.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/5.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "YFExceedApplianceCell.h"
// Controllers

// Models

// Views
#import "YFGoodsHandheldCell.h"
// Vendors
#import <UIImageView+WebCache.h>
// Categories

// Others

@interface YFExceedApplianceCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;
/* 头部ImageView */
@property (strong , nonatomic)UIImageView *headImageView;
/* 图片数组 */
@property (strong , nonatomic)NSArray *imagesArray;

@end

static NSString *const YFGoodsHandheldCellID = @"YFGoodsHandheldCell";
@implementation YFExceedApplianceCell
#pragma mark - lazyload
/*
 懒加载:
 
 也被成为延迟加载,可以做到用到时再加载
 加载过了就不会再次加载,节约了系统资源
 对于实际开发中可能会遇到的一些顺序问题,懒加载也能很好的解决
 
 懒加载的实现思路:
 
 1.在类扩展中创建一个属性
 2.重写这个属性对应的getter,将要实现的逻辑放到这个getter中
 3.考虑到懒加载只加载一次,那么在实现逻辑之前应该判断一下这个属性是否为空,为空才执行逻辑,否则直接返回这个属性

 */
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:_collectionView];
        _collectionView.frame = CGRectMake(0, ScreenW * 0.35 + 10, ScreenW, 100);
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[YFGoodsHandheldCell class] forCellWithReuseIdentifier:YFGoodsHandheldCellID];
    }
    return _collectionView;
}


#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = self.backgroundColor;
    
    _headImageView = [[UIImageView alloc] init];
    [self addSubview:_headImageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(ScreenW * 0.32);
    }];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imagesArray.count - 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YFGoodsHandheldCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YFGoodsHandheldCellID forIndexPath:indexPath];
    cell.handheldImage = _imagesArray[indexPath.row + 1];
    return cell;
}


#pragma mark - Setter Getter Methods
- (void)setGoodExceedArray:(NSArray *)goodExceedArray
{
    _goodExceedArray = goodExceedArray;
    _imagesArray = goodExceedArray;
    
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:goodExceedArray[0]]];
}

@end
