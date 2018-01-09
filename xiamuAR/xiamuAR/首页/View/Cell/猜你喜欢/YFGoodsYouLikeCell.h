//
//  YFGoodsYouLikeCell.h
//  xiamuAR
//
//  Created by guopenglai on 2018/1/9.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFRecommendItem.h"
@interface YFGoodsYouLikeCell : UICollectionViewCell
/* 推荐数据 */
@property (strong , nonatomic)YFRecommendItem *youLikeItem;
/* 相同 */
@property (strong , nonatomic)UIButton *sameButton;

/** 找相似点击回调 */
@property (nonatomic, copy) dispatch_block_t lookSameBlock;

@end
