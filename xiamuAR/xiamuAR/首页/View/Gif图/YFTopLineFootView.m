//
//  YFTopLineFootView.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/4.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "YFTopLineFootView.h"
// Controllers

// Models

// Views
#import "DCTitleRolling.h"
// Vendors

// Categories
#import <UIImageView+WebCache.h>
// Others
#import <FLAnimatedImageView.h>
@interface YFTopLineFootView ()<UIScrollViewDelegate,CDDRollingDelegate>

/* 滚动 */
@property (strong , nonatomic)DCTitleRolling *numericalScrollView;
/* 底部 */
@property (strong , nonatomic)UIView *bottomLineView;
/* 顶部广告宣传图片 */
@property (strong , nonatomic)FLAnimatedImageView *topAdImageView;

@end
@implementation YFTopLineFootView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
        
        [self setUpBase];
        
    }
    return self;
}

- (void)setUpUI
{
    /*
     Animated Images (GIF) support
     
     Starting with the 4.0 version, we rely on FLAnimatedImage to take care of our animated images.
     If you use cocoapods, add pod 'SDWebImage/GIF' to your podfile.
     To use it, simply make sure you use FLAnimatedImageView instead of UIImageView.
     Note: there is a backwards compatible feature, so if you are still trying to load a GIF into a UIImageView, it will only show the 1st frame as a static image.
     Important: FLAnimatedImage only works on the iOS platform. For OS X, use NSImageView with animates set to YES to show the entire animated images and NO to only show the 1st frame. For all the other platforms (tvOS, watchOS) we will fallback to the backwards compatibility feature described above
     */
    
    _topAdImageView = [[FLAnimatedImageView alloc] init];
    [_topAdImageView sd_setImageWithURL:[NSURL URLWithString:HomeBottomViewGIFImage]];
    _topAdImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_topAdImageView];
    
    //初始化
    _numericalScrollView = [[DCTitleRolling alloc] initWithFrame:CGRectMake(0, self.dc_height - 50, self.dc_width, 50) WithTitleData:^(CDDRollingGroupStyle *rollingGroupStyle, NSString *__autoreleasing *leftImage, NSArray *__autoreleasing *rolTitles, NSArray *__autoreleasing *rolTags, NSArray *__autoreleasing *rightImages, NSString *__autoreleasing *rightbuttonTitle, NSInteger *interval, float *rollingTime, NSInteger *titleFont, UIColor *__autoreleasing *titleColor, BOOL *isShowTagBorder) {
        
        *rollingTime = 0.25;
        *rolTags = @[@"冬季健康日",@"新手上路",@"年终内购会",@"GitHub星星走一波"];
        *rolTitles = @[@"先领券在购物，一元抢？",@"2000元热门手机推荐",@"好奇么？点进去哈",@"这套家具比房子还贵"];
        *leftImage = @"shouye_img_toutiao";
        *interval = 6.0;
        *titleFont = 14;
        *isShowTagBorder = YES;
        *titleColor = [UIColor darkGrayColor];
    }];
    
    _numericalScrollView.moreClickBlock = ^{
        NSLog(@"mall----more");
    };
    
    [_numericalScrollView dc_beginRolling];
    _numericalScrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_numericalScrollView];
    
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = LZColorBase;
    [self addSubview:_bottomLineView];
    _bottomLineView.frame = CGRectMake(0, self.dc_height - 8, ScreenW, 8);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_topAdImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.width.mas_equalTo(self);
        [make.bottom.mas_equalTo(self)setOffset:-50];
    }];
}

- (void)setUpBase
{
    self.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - Setter Getter Methods

#pragma mark - 滚动条点击事件

- (void)dc_RollingViewSelectWithActionAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%zd头条滚动条",index);
}
@end
