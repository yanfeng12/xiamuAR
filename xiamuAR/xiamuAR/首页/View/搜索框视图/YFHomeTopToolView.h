//
//  YFHomeTopToolView.h
//  xiamuAR
//
//  Created by guopenglai on 2018/1/3.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFHomeTopToolView : UIView

/** 左边Item点击 */
@property (nonatomic, copy) dispatch_block_t leftItemClickBlock;
/** 右边Item点击 */
@property (nonatomic, copy) dispatch_block_t rightItemClickBlock;
/** 右边第二个Item点击 */
@property (nonatomic, copy) dispatch_block_t rightRItemClickBlock;

/** 搜索按钮点击点击 */
@property (nonatomic, copy) dispatch_block_t searchButtonClickBlock;
/** 语音按钮点击点击 */
@property (nonatomic, copy) dispatch_block_t voiceButtonClickBlock;


@end
