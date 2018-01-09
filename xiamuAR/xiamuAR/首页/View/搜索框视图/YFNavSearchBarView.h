//
//  YFNavSearchBarView.h
//  xiamuAR
//
//  Created by guopenglai on 2018/1/3.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFNavSearchBarView : UIView
/* 语音按钮 */
@property (strong , nonatomic)UIButton *voiceImageBtn;
/* 占位文字 */
@property (strong , nonatomic)UILabel *placeholdLabel;

/** 语音点击回调Block */
@property (nonatomic, copy) dispatch_block_t voiceButtonClickBlock;
/** 搜索 */
@property (nonatomic, copy) dispatch_block_t searchViewBlock;


/**
 intrinsicContentSize
 */
@property(nonatomic, assign) CGSize intrinsicContentSize;

@end
