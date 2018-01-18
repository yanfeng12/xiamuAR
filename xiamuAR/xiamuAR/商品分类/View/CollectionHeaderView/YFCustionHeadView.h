//
//  YFCustionHeadView.h
//  xiamuAR
//
//  Created by guopenglai on 2018/1/16.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFCustionHeadView : UICollectionReusableView

/** 筛选点击回调 */
@property (nonatomic, copy) dispatch_block_t filtrateClickBlock;
@end
