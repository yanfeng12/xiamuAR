//
//  YFHomeRefreshGifHeader.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/4.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "YFHomeRefreshGifHeader.h"
@interface YFHomeRefreshGifHeader ()

@property (nonatomic , strong) UIImageView *refreshImage;

@end
@implementation YFHomeRefreshGifHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)prepare{
    
    [super prepare];
    
    self.automaticallyChangeAlpha = YES;
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<= 60; i++) {
        UIImage *image = [UIImage imageNamed:@"icon_refresh_1"];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i < 3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_refresh_%zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    self.stateLabel.textColor = [UIColor lightGrayColor];
    self.lastUpdatedTimeLabel.hidden = YES;
    [self setTitle:@"上拉加载数据" forState:MJRefreshStateIdle];
    [self setTitle:@"帮您加载数据" forState:MJRefreshStatePulling];
    [self setTitle:@"数据加载中" forState:MJRefreshStateRefreshing];
    self.refreshImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"refresh"]];
    [self addSubview:self.refreshImage];
}

@end
