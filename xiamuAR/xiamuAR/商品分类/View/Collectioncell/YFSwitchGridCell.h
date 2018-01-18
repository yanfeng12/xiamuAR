//
//  YFSwitchGridCell.h
//  xiamuAR
//
//  Created by guopenglai on 2018/1/17.
//  Copyright © 2018年 guopenglai. All rights reserved.
//
//切换成流水排布
#import <UIKit/UIKit.h>
@class YFRecommendItem;

@interface YFSwitchGridCell : UICollectionViewCell
/* 推荐数据 */
@property (strong , nonatomic)YFRecommendItem *youSelectItem;
@end
