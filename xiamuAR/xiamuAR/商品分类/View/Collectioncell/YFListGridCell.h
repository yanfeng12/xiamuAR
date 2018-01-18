//
//  YFListGridCell.h
//  xiamuAR
//
//  Created by guopenglai on 2018/1/17.
//  Copyright © 2018年 guopenglai. All rights reserved.
//
//切换成竖列排布
#import <UIKit/UIKit.h>
@class YFRecommendItem;
@interface YFListGridCell : UICollectionViewCell
/* 推荐数据 */
@property (strong , nonatomic)YFRecommendItem *youSelectItem;

/** 冒号点击回调 */
@property (nonatomic, copy) dispatch_block_t colonClickBlock;
@end
