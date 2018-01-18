//
//  YFGoodSetNavBar.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/16.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "YFGoodSetNavBar.h"
@interface YFGoodSetNavBar()
/* 搜索按钮 */
@property (strong , nonatomic)UIButton *searchBtn;
/* 返回按钮 */
@property (strong , nonatomic)UIButton *backBtn;
/*筛选按钮*/
@property (strong , nonatomic)UIButton *switchBtn;
@end
@implementation YFGoodSetNavBar

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
    }
    return self;
}
-(void)setUpUI
{
    self.backgroundColor = LZColorFromRGB(245,245,245);
    _switchBtn = ({
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"flzq_nav_jiugongge"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"flzq_nav_list"] forState:UIControlStateSelected];
        button.frame = CGRectMake(0, 0, 44, 44);
        [button addTarget:self action:@selector(switchBtnClick) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    _searchBtn = ({
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"group_home_search_gray"] forState:UIControlStateNormal];

        [button setTitle:@"搜索商品/店铺" forState:0];
        [button setTitleColor:[UIColor lightGrayColor] forState:0];
        button.titleLabel.font = PFR13Font;
        [button adjustsImageWhenHighlighted];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 2 * YFMargin, 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, YFMargin, 0, 0);
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
        [button.layer setBorderWidth:2.0]; //边框宽度
        [button.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];//边框颜色
        [button addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    _backBtn = ({
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 44, 44);
        [button addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    [self addSubview:_switchBtn];
    [self addSubview:_searchBtn];
    [self addSubview:_backBtn];
}
#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    YFWeakSelf(ws)
    [_switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(kStatusBarHeight);
        make.right.equalTo(ws.mas_right).offset(-10);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
    
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_switchBtn.mas_centerY);
        make.left.equalTo(ws.mas_left).offset(10);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
    [_searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_switchBtn.mas_centerY);
        make.centerX .equalTo(ws);
        make.height.equalTo(@44);
        make.width.equalTo(@200);
    }];
}
#pragma 自定义switchItem点击
- (void)switchBtnClick {
    !_switchBtnBlock ? : _switchBtnBlock();
}

#pragma 自定义搜索Item点击
- (void)searchBtnClick {
    
    !_searchBtnBlock ? : _searchBtnBlock();
}

#pragma 自定义返回Item点击
- (void)backBtnClick {
    
    !_backBtnBlock ? : _backBtnBlock();
}
@end
