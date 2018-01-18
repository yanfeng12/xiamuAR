//
//  YFCustionButton.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/16.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "YFCustionButton.h"

@implementation YFCustionButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
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
    self.titleLabel.font = PFR14Font;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
    
    //计算完加一个艰巨
    self.dc_width += YFMargin;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.dc_x = self.dc_width * 0.3;
    self.imageView.dc_x = CGRectGetMaxX(self.titleLabel.frame) + YFMargin;
}
@end
