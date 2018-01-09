//
//  KindsCollectionViewCell.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/4.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "KindsCollectionViewCell.h"

// Controllers

// Models
#import "YFKindsModel.h"
// Views

// Vendors
#import <UIImageView+WebCache.h>
// Categories
#import "UIView+DCRolling.h"
#import "UIColor+DCColorChange.h"
// Others

@interface KindsCollectionViewCell ()

/* imageView */
@property (strong , nonatomic)UIImageView *KindsImageView;
/* gridLabel */
@property (strong , nonatomic)UILabel *KindsLabel;
/* tagLabel */
@property (strong , nonatomic)UILabel *tagLabel;

@end
@implementation KindsCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
        
    }
    return self;
}

- (void)setUpUI
{
    _KindsImageView = [[UIImageView alloc] init];
    _KindsImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_KindsImageView];
    
    _KindsLabel = [[UILabel alloc] init];
    _KindsLabel.font = PFR13Font;
    _KindsLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_KindsLabel];
    
    _tagLabel = [[UILabel alloc] init];
    _tagLabel.font = [UIFont systemFontOfSize:8];
    _tagLabel.backgroundColor = [UIColor whiteColor];
    _tagLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_tagLabel];
    
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_KindsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self)setOffset:10];
        if (iphone5) {
            make.size.mas_equalTo(CGSizeMake(38, 38));
        }else{
            make.size.mas_equalTo(CGSizeMake(45, 45));
        }
        make.centerX.mas_equalTo(self);
    }];
    
    [_KindsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(_KindsImageView.mas_bottom)setOffset:5];
    }];
    
}

#pragma mark - Setter Getter Methods
- (void)setKindsItem:(YFKindsModel *)KindsModel
{
    _KindsItem = KindsModel;
    
    
    _KindsLabel.text = KindsModel.iconTitle;
    _tagLabel.text = KindsModel.iconTag;
    
    CGSize tagSize = [self labelAutoCalculateRectWith:KindsModel.iconTag FontSize:8 MaxSize:CGSizeMake(MAXFLOAT, 30)];
    
    
    [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_KindsImageView.mas_centerX);
        make.top.mas_equalTo(_KindsImageView);
        make.size.mas_equalTo(CGSizeMake(tagSize.width + 4, tagSize.height + 4));
    }];
    
    _tagLabel.textColor = [UIColor dc_colorWithHexString:KindsModel.iconColor];
    [DCSpeedy dc_chageControlCircularWith:_tagLabel AndSetCornerRadius:5 SetBorderWidth:1 SetBorderColor:_tagLabel.textColor canMasksToBounds:YES];
    
    
    if (_KindsItem.iconImage.length == 0) return;
    if ([[_KindsItem.iconImage substringToIndex:4] isEqualToString:@"http"]) {
        
        [_KindsImageView sd_setImageWithURL:[NSURL URLWithString:KindsModel.iconImage]placeholderImage:[UIImage imageNamed:@"default_49_11"]];
    }else{
        _KindsImageView.image = [UIImage imageNamed:_KindsItem.iconImage];
    }
}
@end
