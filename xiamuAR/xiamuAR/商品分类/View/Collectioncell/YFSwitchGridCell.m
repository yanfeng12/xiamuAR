//
//  YFSwitchGridCell.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/17.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "YFSwitchGridCell.h"
#import "YFRecommendItem.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface YFSwitchGridCell ()
/* 优惠套装 */
@property (strong , nonatomic)UIImageView *freeSuitImageView;
/* 商品图片 */
@property (strong , nonatomic)UIImageView *gridImageView;
/* 商品标题 */
@property (strong , nonatomic)UILabel *gridLabel;
/* 自营 */
@property (strong , nonatomic)UIImageView *autotrophyImageView;
/* 价格 */
@property (strong , nonatomic)UILabel *priceLabel;
/* 评价数量 */
@property (strong , nonatomic)UILabel *commentNumLabel;
@end
@implementation YFSwitchGridCell
#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    _freeSuitImageView = [[UIImageView alloc] init];
    _freeSuitImageView.image = [UIImage imageNamed:@"taozhuang_tag"];
    [self addSubview:_freeSuitImageView];
    
    _autotrophyImageView = [[UIImageView alloc] init];
    [self addSubview:_autotrophyImageView];
    _autotrophyImageView.image = [UIImage imageNamed:@"detail_title_ziying_tag"];
    
    _gridImageView = [[UIImageView alloc] init];
    _gridImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_gridImageView];
    
    _gridLabel = [[UILabel alloc] init];
    _gridLabel.font = PFR14Font;
    _gridLabel.numberOfLines = 1;
    [self addSubview:_gridLabel];
    
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.font = PFR15Font;
    _priceLabel.textColor = [UIColor redColor];
    [self addSubview:_priceLabel];
    
    _commentNumLabel = [[UILabel alloc] init];
    NSInteger pNum = arc4random() % 10000;
    _commentNumLabel.text = [NSString stringWithFormat:@"%zd人已评价",pNum];
    _commentNumLabel.font = PFR10Font;
    _commentNumLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:_commentNumLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_gridImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self)setOffset:YFMargin];
        make.size.mas_equalTo(CGSizeMake(self.dc_width * 0.8, self.dc_width * 0.8));
    }];
    
    [_autotrophyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self)setOffset:YFMargin];
        [make.top.mas_equalTo(_gridImageView.mas_bottom)setOffset:YFMargin];
    }];
    
    [_gridLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.centerY.mas_equalTo(_autotrophyImageView);
        [make.right.mas_equalTo(self)setOffset:-YFMargin];
    }];
    
    [_freeSuitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_autotrophyImageView);
        [make.top.mas_equalTo(_gridLabel.mas_bottom)setOffset:2];
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_autotrophyImageView);
        [make.top.mas_equalTo(_freeSuitImageView.mas_bottom)setOffset:2];
    }];
    
    [_commentNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_autotrophyImageView);
        [make.top.mas_equalTo(_priceLabel.mas_bottom)setOffset:2];
    }];
    
    
}

#pragma mark - Setter Getter Methods
- (void)setYouSelectItem:(YFRecommendItem *)youSelectItem
{
    _youSelectItem = youSelectItem;
    [_gridImageView sd_setImageWithURL:[NSURL URLWithString:youSelectItem.image_url]];
    _priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[youSelectItem.price floatValue]];
    _gridLabel.text = youSelectItem.main_title;
    //首行缩进
    [DCSpeedy dc_setUpLabel:_gridLabel Content:youSelectItem.main_title IndentationFortheFirstLineWith:_gridLabel.font.pointSize * 3.5];
}


@end
