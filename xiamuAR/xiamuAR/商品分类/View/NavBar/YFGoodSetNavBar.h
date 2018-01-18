//
//  YFGoodSetNavBar.h
//  xiamuAR
//
//  Created by guopenglai on 2018/1/16.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFGoodSetNavBar : UIView


/** 搜索点击回调Block */
@property (nonatomic, copy) dispatch_block_t searchBtnBlock;
/** 返回 */
@property (nonatomic, copy) dispatch_block_t backBtnBlock;
/* 筛选 */
@property (nonatomic, copy) dispatch_block_t switchBtnBlock;

@end
