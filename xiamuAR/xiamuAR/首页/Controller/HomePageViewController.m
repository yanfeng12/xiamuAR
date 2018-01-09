//
//  HomePageViewController.m
//  xiamuAR
//
//  Created by guopenglai on 2017/12/29.
//  Copyright © 2017年 guopenglai. All rights reserved.
//

#import "HomePageViewController.h"
#import "YFNewWelfareCell.h"
#import "YFGoodsYouLikeCell.h"
#import "YFGoodsCountDownCell.h"
#import "YFGoodsSurplusCell.h"
#import "YFExceedApplianceCell.h"
#import "YFGoodsHandheldCell.h"
#import "KindsCollectionViewCell.h"

#import "YFTopLineFootView.h"
#import "YFScrollAdFootView.h"
#import "YFOverFootView.h"
#import "HomePageTittleView.h"
#import "YFSlideshowHeadView.h"
#import "YFCountDownHeadView.h"
#import "YFHomeRefreshGifHeader.h"
#import "YFNavSearchBarView.h"
#import "YFHomeTopToolView.h"

#import "YFKindsModel.h"
#import "YFRecommendItem.h"
#import <UIImageView+WebCache.h>
@interface HomePageViewController ()
/* 10个属性 */
@property (strong , nonatomic)NSMutableArray<YFKindsModel *> *gridItem;
/* 推荐商品属性 */
@property (strong , nonatomic)NSMutableArray<YFRecommendItem *> *youLikeItem;
/* 顶部view */
@property (nonatomic, strong) YFHomeTopToolView *topToolView;
@end
/* cell */
static NSString *const YFGoodsCountDownCellID = @"YFGoodsCountDownCell";
static NSString *const YFNewWelfareCellID = @"YFNewWelfareCell";
static NSString *const YFGoodsHandheldCellID = @"YFGoodsHandheldCell";
static NSString *const YFGoodsYouLikeCellID = @"YFGoodsYouLikeCell";
static NSString *const KindsCollectionViewCellID = @"KindsCollectionViewCell";
static NSString *const YFExceedApplianceCellID = @"YFExceedApplianceCell";
/* head */
static NSString *const YFSlideshowHeadViewID = @"YFSlideshowHeadView";
static NSString *const YFCountDownHeadViewID = @"YFCountDownHeadView";
static NSString *const HomePageTittleViewID = @"HomePageTittleView";
/* foot */
static NSString *const YFTopLineFootViewID = @"YFTopLineFootView";
static NSString *const YFOverFootViewID = @"YFOverFootView";
static NSString *const YFScrollAdFootViewID = @"YFScrollAdFootView";
@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    [self setUpBase];
    
    [self setUpNavTopView];
    
    [self setUpGoodsData];

    
    [self setUpGIFRrfresh];

}
-(void)setUpBase
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(YFNavigationHeight);
        make.left.right.and.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-YFTabBarHeight);
    }];
    [self.collectionView registerClass:[YFGoodsCountDownCell class] forCellWithReuseIdentifier:YFGoodsCountDownCellID];
    [self.collectionView registerClass:[YFGoodsHandheldCell class] forCellWithReuseIdentifier:YFGoodsHandheldCellID];
    [self.collectionView registerClass:[YFGoodsYouLikeCell class] forCellWithReuseIdentifier:YFGoodsYouLikeCellID];
    [self.collectionView registerClass:[KindsCollectionViewCell class] forCellWithReuseIdentifier:KindsCollectionViewCellID];
    [self.collectionView registerClass:[YFExceedApplianceCell class] forCellWithReuseIdentifier:YFExceedApplianceCellID];
    [self.collectionView registerClass:[YFNewWelfareCell class] forCellWithReuseIdentifier:YFNewWelfareCellID];
    
    
    [self.collectionView registerClass:[YFTopLineFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:YFTopLineFootViewID];
    [self.collectionView registerClass:[YFOverFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:YFOverFootViewID];
    [self.collectionView registerClass:[YFScrollAdFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:YFScrollAdFootViewID];
    
    [self.collectionView registerClass:[HomePageTittleView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HomePageTittleViewID];
    [self.collectionView registerClass:[YFSlideshowHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:YFSlideshowHeadViewID];
    [self.collectionView registerClass:[YFCountDownHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:YFCountDownHeadViewID];
}
#pragma mark - 设置头部header
- (void)setUpGIFRrfresh
{
    self.collectionView.mj_header = [YFHomeRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(setUpRecData)];
}

#pragma mark - 刷新
- (void)setUpRecData
{
    YFWeakSelf(ws)
    if (@available(iOS 10.0, *)) {
        //iPhone7以上的震动反馈
        UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleHeavy];
        [generator prepare];
        [generator impactOccurred];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ //手动延迟
        [ws.collectionView.mj_header endRefreshing];
    });
}


#pragma mark - 加载数据
- (void)setUpGoodsData
{
    _gridItem = [YFKindsModel mj_objectArrayWithFilename:@"GoodsGrid.plist"];
    _youLikeItem = [YFRecommendItem mj_objectArrayWithFilename:@"HomeHighGoods.plist"];
}

#pragma mark - 导航栏处理
- (void)setUpNavTopView
{
    _topToolView = [[YFHomeTopToolView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 64)];
    YFWeakSelf(ws)
    _topToolView.leftItemClickBlock = ^{
        NSLog(@"点击了首页扫一扫");
    };
    _topToolView.rightItemClickBlock = ^{
        NSLog(@"点击了首页分类");
    };
    _topToolView.rightRItemClickBlock = ^{
        NSLog(@"点击了首页购物车");
      
    };
    _topToolView.searchButtonClickBlock = ^{
        NSLog(@"点击了首页搜索");
    };
    _topToolView.voiceButtonClickBlock = ^{
        NSLog(@"点击了首页语音");
    };
    [self.view addSubview:_topToolView];
    
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 6;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) { //10属性
        return _gridItem.count;
    }
    if (section == 1 || section == 2 || section == 3) { //广告福利  倒计时  掌上专享
        return 1;
    }
    if (section == 4) { //推荐
        return GoodsHandheldImagesArray.count;
    }
    if (section == 5) { //猜你喜欢
        return _youLikeItem.count;
    }
    return 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0) {//10
        KindsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KindsCollectionViewCellID forIndexPath:indexPath];
        cell.KindsItem = _gridItem[indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];
        gridcell = cell;
        
    }else if (indexPath.section == 1) {//广告福利
        YFNewWelfareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YFNewWelfareCellID forIndexPath:indexPath];
        gridcell = cell;
    }
    else if (indexPath.section == 2) {//倒计时
        YFGoodsCountDownCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YFGoodsCountDownCellID forIndexPath:indexPath];
        gridcell = cell;
    }
    else if (indexPath.section == 3) {//掌上专享
        YFExceedApplianceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YFExceedApplianceCellID forIndexPath:indexPath];
        cell.goodExceedArray = GoodsRecommendArray;
        gridcell = cell;
        
    }
    else if (indexPath.section == 4) {//推荐
        YFGoodsHandheldCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YFGoodsHandheldCellID forIndexPath:indexPath];
        NSArray *images = GoodsHandheldImagesArray;
        cell.handheldImage = images[indexPath.row];
        gridcell = cell;
    }
    else {//猜你喜欢
        YFGoodsYouLikeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YFGoodsYouLikeCellID forIndexPath:indexPath];
        cell.lookSameBlock = ^{
            NSLog(@"点击了第%zd商品的找相似",indexPath.row);
        };
        cell.youLikeItem = _youLikeItem[indexPath.row];
        gridcell = cell;
    }
    return gridcell;
}
//设置区头区尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 0) {
            YFSlideshowHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:YFSlideshowHeadViewID forIndexPath:indexPath];
            headerView.imageGroupArray = GoodsHomeSilderImagesArray;
            reusableview = headerView;
        }else if (indexPath.section == 2){
            YFCountDownHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:YFCountDownHeadViewID forIndexPath:indexPath];
            reusableview = headerView;
        }else if (indexPath.section == 4){
            HomePageTittleView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HomePageTittleViewID forIndexPath:indexPath];
            [headerView.likeImageView sd_setImageWithURL:[NSURL URLWithString:@"http://gfs7.gomein.net.cn/T1WudvBm_T1RCvBVdK.png"]];
            reusableview = headerView;
        }else if (indexPath.section == 5){
            HomePageTittleView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HomePageTittleViewID forIndexPath:indexPath];
            [headerView.likeImageView sd_setImageWithURL:[NSURL URLWithString:@"http://gfs5.gomein.net.cn/T16LLvByZj1RCvBVdK.png"]];
            reusableview = headerView;
        }
        
    }
    if (kind == UICollectionElementKindSectionFooter) {
        if (indexPath.section == 0) {
            YFTopLineFootView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:YFTopLineFootViewID forIndexPath:indexPath];
            reusableview = footview;
        }else if (indexPath.section == 3){
            YFScrollAdFootView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:YFScrollAdFootViewID forIndexPath:indexPath];
            reusableview = footerView;
        }else if (indexPath.section == 5) {
            YFOverFootView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:YFOverFootViewID forIndexPath:indexPath];
            reusableview = footview;
        }
    }
    
    return reusableview;
}
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {//9宫格组
        return CGSizeMake(ScreenW/5 , ScreenW/5 + 10);
    }
    if (indexPath.section == 1) {//广告
        return CGSizeMake(ScreenW, 180);
    }
    if (indexPath.section == 2) {//计时
        return CGSizeMake(ScreenW, 150);
    }
    if (indexPath.section == 3) {//掌上
        return CGSizeMake(ScreenW,ScreenW * 0.35 + 120);
    }
    if (indexPath.section == 4) {//推荐组
        return [self layoutAttributesForItemAtIndexPath:indexPath].size;
    }
    if (indexPath.section == 5) {//猜你喜欢
        return CGSizeMake((ScreenW - 4)/2, (ScreenW - 4)/2 + 40);
    }
    return CGSizeZero;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            layoutAttributes.size = CGSizeMake(ScreenW, ScreenW * 0.38);
        }else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4){
            layoutAttributes.size = CGSizeMake(ScreenW * 0.5, ScreenW * 0.24);
        }else{
            layoutAttributes.size = CGSizeMake(ScreenW * 0.25, ScreenW * 0.35);
        }
    }
    return layoutAttributes;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return CGSizeMake(ScreenW, 230); //图片滚动的宽高
    }
    if (section == 2 || section == 4 || section == 5) {//猜你喜欢的宽高
        return CGSizeMake(ScreenW, 40);  //推荐适合的宽高
    }
    return CGSizeZero;
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(ScreenW, 180);  //Top头条的宽高
    }
    if (section == 3) {
        return CGSizeMake(ScreenW, 80); // 滚动广告
    }
    if (section == 5) {
        return CGSizeMake(ScreenW, 40); // 结束
    }
    return CGSizeZero;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 5) ? 4 : 0;
}
#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 5) ? 4 : 0;
}
#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _topToolView.hidden = (scrollView.contentOffset.y < 0) ? YES : NO;//判断顶部工具View的显示和隐形
    
    if (scrollView.contentOffset.y > 44) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        [[NSNotificationCenter defaultCenter]postNotificationName:SHOWTOPTOOLVIEW object:nil];
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        [[NSNotificationCenter defaultCenter]postNotificationName:HIDETOPTOOLVIEW object:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
