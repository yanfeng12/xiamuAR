//
//  YFTittleButton.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/4.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "YFTittleButton.h"

@implementation YFTittleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    self.titleLabel.dc_centerX = self.dc_width * 0.55;
    self.imageView.dc_x = self.titleLabel.dc_x - self.imageView.dc_width - 5;
}

@end
