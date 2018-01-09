//
//  YFNavSearchBarView.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/3.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "YFNavSearchBarView.h"

//只有20%的iOS程序员能看懂：详解intrinsicContentSize 及 约束优先级／content Hugging／content Compression Resistance
//http://blog.csdn.net/hard_man/article/details/50888377
static bool closeIntrinsic = false;//Intrinsic的影响

@implementation YFNavSearchBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(searchClick)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}
/**
 通过覆盖intrinsicContentSize函数修改自定义View的Intrinsic的大小
 @return CGSize
 */
-(CGSize)intrinsicContentSize
{
    if (closeIntrinsic) {
        return CGSizeMake(UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric);
    } else {
        return CGSizeMake(self.dc_width, self.dc_height);
    }
}
-(void)setUpUI
{
    self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
    
    _placeholdLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _placeholdLabel.font = PFR14Font;
    _placeholdLabel.textColor = [UIColor whiteColor];
    
    _voiceImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_voiceImageBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
    [_voiceImageBtn addTarget:self action:@selector(voiceButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self addSubview:_placeholdLabel];
    [self addSubview:_voiceImageBtn];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _placeholdLabel.frame = CGRectMake(10, 0, self.dc_width - 50, self.dc_height);
    
    [_placeholdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.equalTo(self)setOffset:10];
        make.top.equalTo(self);
        make.height.equalTo(self);
        
    }];
    [_voiceImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.equalTo(self)setOffset:-10];
        make.top.equalTo(self);
        make.height.equalTo(self);
    }];
    
    //设置边角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(2, 2)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

#pragma mark - Setter Getter Methods

- (void)searchClick
{
    !_searchViewBlock ?: _searchViewBlock();
}

#pragma mark - 语音点击回调
- (void)voiceButtonClick {
    !_voiceButtonClickBlock ? : _voiceButtonClickBlock();
}
@end
