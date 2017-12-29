//
//  YFTabBarViewController.m
//  xiamuAR
//
//  Created by guopenglai on 2017/12/28.
//  Copyright © 2017年 guopenglai. All rights reserved.
//

#import "YFTabBarViewController.h"
#import "YFNavigationViewController.h"
#import "YFTabBar.h"
#import "YFBaseViewController.h"
@interface YFTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation YFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate=self;
    [self makeTabbar];
    
    [self addChildViewContorller];
}
-(void)makeTabbar
{
    YFTabBar *tabBar = [[YFTabBar alloc] init];
    tabBar.backgroundColor = [UIColor whiteColor];
    //KVC把系统换成自定义
    [self setValue:tabBar forKey:@"tabBar"];
}
- (void)addChildViewContorller
{
    NSArray *childArray = @[
                            @{MallClassKey  : @"HomePageViewController",
                              MallTitleKey  : @"首页",
                              MallImgKey    : @"Firstunselected",
                              MallSelImgKey : @"Firstselected"},
                            
                            @{MallClassKey  : @"DiscoveryViewController",
                              MallTitleKey  : @"发现",
                              MallImgKey    : @"Thirdunselected",
                              MallSelImgKey : @"Thirdselected"},
                            
                            @{MallClassKey  : @"MessageViewController",
                              MallTitleKey  : @"消息",
                              MallImgKey    : @"Secondunselected",
                              MallSelImgKey : @"Secondselected"},
                            
                            @{MallClassKey  : @"MineViewController",
                              MallTitleKey  : @"我的",
                              MallImgKey    : @"Fourthunselected",
                              MallSelImgKey : @"Fourthselected"},
                            
                            ];
    [childArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        YFBaseViewController *vc = [NSClassFromString(dict[MallClassKey]) new];
        //        vc.navigationItem.title = ([dict[MallTitleKey] isEqualToString:@"首页"] || [dict[MallTitleKey] isEqualToString:@"分类"]) ? nil : dict[MallTitleKey];
        YFNavigationViewController *nav = [[YFNavigationViewController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        
        item.image = [UIImage imageNamed:dict[MallImgKey]];
        // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
        item.selectedImage = [[UIImage imageNamed:dict[MallSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
        NSDictionary *dictHome = [NSDictionary dictionaryWithObject:LZColorFromRGB(31,185,235) forKey:NSForegroundColorAttributeName];
        item.title = [NSString stringWithFormat:@"%@",dict[MallTitleKey]];
        [item setTitleTextAttributes:dictHome forState:UIControlStateSelected];
//        item.imageInsets = UIEdgeInsetsMake(6, 0,-6, 0);//（当只有图片的时候）需要自动调整
        [self addChildViewController:nav];
        
    }];
}
#pragma mark - <UITabBarControllerDelegate>
#pragma mark - 控制器跳转拦截
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    if(viewController == [tabBarController.viewControllers objectAtIndex:3]){
        
//        if (![[DCObjManager dc_readUserDataForKey:@"isLogin"] isEqualToString:@"1"]) {
//
//            DCLoginMeViewController *dcLoginVc = [DCLoginMeViewController new];
//            [self presentViewController:dcLoginVc animated:YES completion:nil];
//            return NO;
//        }
    }
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //点击tabBarItem动画
    [self tabBarButtonClick:[self getTabBarButton]];
    
}
- (UIControl *)getTabBarButton{
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    
    return tabBarButton;
}
#pragma mark - 点击动画
- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据自己需求改动
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}


#pragma mark - 禁止屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;//只支持这一个方向(正常的方向)
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
