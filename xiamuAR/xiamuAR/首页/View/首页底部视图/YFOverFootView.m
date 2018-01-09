//
//  YFOverFootView.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/4.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "YFOverFootView.h"
@interface YFOverFootView ()


/* label */
@property (strong , nonatomic)UILabel *overLabel;

@end
@implementation YFOverFootView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    _overLabel = [[UILabel alloc] init];
    _overLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_overLabel];
    _overLabel.font = PFR16Font;
    _overLabel.textColor = [UIColor darkGrayColor];
    _overLabel.text = @"看完喽，下次在逛吧";
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_overLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
}
@end
