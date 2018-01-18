//
//  YFGoodsSetViewController.m
//  xiamuAR
//
//  Created by guopenglai on 2018/1/16.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import "YFGoodsSetViewController.h"
#import "YFGoodSetNavBar.h"
#import "YFCustionHeadView.h"
#import "YFListGridCell.h"
#import "YFSwitchGridCell.h"


#import "YFRecommendItem.h"
@interface YFGoodsSetViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


/**
 0：列表视图，1：格子视图
 */
@property (nonatomic, assign) BOOL isSwitchGrid;

/* 具体商品数据 */
@property (strong , nonatomic)NSMutableArray<YFRecommendItem *> *setItem;
/* Nav */
@property (strong , nonatomic)YFGoodSetNavBar *Nav;
@end

static NSString *const YFCustionHeadViewID = @"YFCustionHeadView";
static NSString *const YFSwitchGridCellID = @"YFSwitchGridCell";
static NSString *const YFListGridCellID = @"YFListGridCell";

@implementation YFGoodsSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavigationView removeFromSuperview];

    


    [self setNav];
    [self setCollection];
    [self setUpColl];
    [self setUpData];
}

#pragma mark - initialize
-(void)setCollection
{
    [self.collectionView registerClass:[YFListGridCell class] forCellWithReuseIdentifier:YFListGridCellID];
    [self.collectionView registerClass:[YFSwitchGridCell class] forCellWithReuseIdentifier:YFSwitchGridCellID];
    [self.collectionView registerClass:[YFCustionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:YFCustionHeadViewID];
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = CGRectMake(0, kStatusBarAndNavigationBarHeight, ScreenW, ScreenH-kStatusBarAndNavigationBarHeight);
    [self.view addSubview:self.collectionView];
}
-(void)setNav
{
    YFGoodSetNavBar *nav = [[YFGoodSetNavBar alloc]initWithFrame:CGRectMake(0, 0, ScreenW, kStatusBarAndNavigationBarHeight)];
    // 默认列表视图
    _isSwitchGrid = NO;
    
    YFWeakSelf(ws)
    nav.backBtnBlock = ^{
        [ws.navigationController popViewControllerAnimated:YES];
    };
    nav.switchBtnBlock = ^{
        _isSwitchGrid = !_isSwitchGrid;
        NSLog(@"切换布局");
        [self.collectionView reloadData];
    };
    [self.view addSubview:nav];
}
- (void)setUpColl
{
    // 默认列表视图
    _isSwitchGrid = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = LZColorFromRGB(245,245,245);
    self.collectionView.backgroundColor = self.view.backgroundColor;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}
#pragma mark - 加载数据
- (void)setUpData
{
    _setItem = [YFRecommendItem mj_objectArrayWithFilename:_goodPlisName];
    [self.collectionView reloadData];
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _setItem.count;
}
#pragma mark - <UICollectionViewDelegate>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YFListGridCell *cell = nil;
    //切换
    cell = (_isSwitchGrid) ? [collectionView dequeueReusableCellWithReuseIdentifier:YFListGridCellID forIndexPath:indexPath] : [collectionView dequeueReusableCellWithReuseIdentifier:YFSwitchGridCellID forIndexPath:indexPath];
    cell.youSelectItem = _setItem[indexPath.row];
    
    __weak typeof(self) weakSelf = self;
    if (_isSwitchGrid) { //列表Cell
//        __weak typeof(cell)weakCell = cell;
//        cell.colonClickBlock = ^{ // 冒号点击
//            __strong typeof(weakSelf)strongSelf = weakSelf;
//            [strongSelf setUpColonInsView:weakCell];
//            [strongSelf.colonView setUpUI]; // 初始化
//            strongSelf.colonView.collectionBlock = ^{
//                NSLog(@"点击了收藏%zd",indexPath.row);
//            };
//            strongSelf.colonView.addShopCarBlock = ^{
//                NSLog(@"点击了加入购物车%zd",indexPath.row);
//            };
//            strongSelf.colonView.sameBrandBlock = ^{
//                NSLog(@"点击了同品牌%zd",indexPath.row);
//            };
//            strongSelf.colonView.samePriceBlock = ^{
//                NSLog(@"点击了同价格%zd",indexPath.row);
//            };
//        };
    }
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){

        YFCustionHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:YFCustionHeadViewID forIndexPath:indexPath];
//        YFWeakSelf(ws)
//        headerView.filtrateClickBlock = ^{//点击了筛选
//            [ws filtrateButtonClick];
//        };
        reusableview = headerView;
    }
    return reusableview;
}
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return (_isSwitchGrid) ? CGSizeMake(ScreenW, 120) : CGSizeMake((ScreenW - 4)/2, (ScreenW - 4)/2 + 60);//列表、网格Cell
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(ScreenW, 40); //头部
}

#pragma mark - 边间距属性默认为0
#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 4;
    
}
#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return (_isSwitchGrid) ? 0 : 4;
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
