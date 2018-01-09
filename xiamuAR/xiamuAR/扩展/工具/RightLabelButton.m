//
//  RightLabelButton.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/4.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "RightLabelButton.h"

@implementation RightLabelButton
#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置lable
    self.titleLabel.dc_x = 0;
    self.titleLabel.dc_centerY = self.dc_centerY;
    [self.titleLabel sizeToFit];
    
    //设置图片位置
    self.imageView.dc_x = CGRectGetMaxX(self.titleLabel.frame) + 5;
    self.imageView.dc_centerY = self.dc_centerY;
    [self.imageView sizeToFit];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
