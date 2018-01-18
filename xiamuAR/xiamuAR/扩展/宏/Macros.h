//
//  Macros.h
//  xiamuAR
//
//  Created by guopenglai on 2017/12/29.
//  Copyright © 2017年 guopenglai. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

//是否iPhoneX YES:iPhoneX屏幕 NO:传统屏幕
#define YFIs_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//灵活得到导航栏+状态栏的高度
#define kStatusBarAndNavigationBarHeight (YFIs_iPhoneX ? 88.f : 64.f)
//状态栏高度
#define kStatusBarHeight (YFIs_iPhoneX ? 44.f : 20.f)

#define YFWeakSelf(ws) __weak typeof(self) ws = self;

/** 屏幕高度 */
#define ScreenH [UIScreen mainScreen].bounds.size.height
/** 屏幕宽度 */
#define ScreenW [UIScreen mainScreen].bounds.size.width

/*****************  屏幕适配  ******************/
#define iphone6p (ScreenH == 763)
#define iphone6 (ScreenH == 667)
#define iphone5 (ScreenH == 568)
#define iphone4 (ScreenH == 480)

/******************    颜色相关         *************/
// Hex色值
#define LZColorFromHex(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//R G B 颜色
#define LZColorFromRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define LZColorBase LZColorFromHex(0x0075a9)
//全局背景色
//#define LZColorFromRGB(245,245,245)

/******************    TabBar          *************/
#define MallClassKey   @"rootVCClassString"
#define MallTitleKey   @"title"
#define MallImgKey     @"imageName"
#define MallSelImgKey  @"selectedImageName"

/******************    字体          *************/
#define PFR [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? @"PingFangSC-Regular" : @"PingFang SC"

#define PFR20Font [UIFont fontWithName:PFR size:20];
#define PFR18Font [UIFont fontWithName:PFR size:18];
#define PFR16Font [UIFont fontWithName:PFR size:16];
#define PFR15Font [UIFont fontWithName:PFR size:15];
#define PFR14Font [UIFont fontWithName:PFR size:14];
#define PFR13Font [UIFont fontWithName:PFR size:13];
#define PFR12Font [UIFont fontWithName:PFR size:12];
#define PFR11Font [UIFont fontWithName:PFR size:11];
#define PFR10Font [UIFont fontWithName:PFR size:10];
#define PFR9Font [UIFont fontWithName:PFR size:9];

/******************    数组          *************/
#define GoodsFooterImagesArray @[@"http://gfs5.gomein.net.cn/T1vpK_BCZT1RCvBVdK.jpg",@"http://gfs9.gomein.net.cn/T1cGK_BCZT1RCvBVdK.jpg",@"http://gfs6.gomein.net.cn/T1Kod_BCxT1RCvBVdK.jpg"]

#define HomeBottomViewGIFImage @"http://gfs8.gomein.net.cn/T1RbW_BmdT1RCvBVdK.gif"

#define GoodsNewWelfareImagesArray @[@"http://gfs6.gomein.net.cn/T1.iJvBXVT1RCvBVdK.jpg",@"http://gfs5.gomein.net.cn/T10_LvBjLv1RCvBVdK.jpg",@"http://gfs9.gomein.net.cn/T1ALVvBXZg1RCvBVdK.jpg"]

#define GoodsHandheldImagesArray  @[@"http://gfs8.gomein.net.cn/T1LnWvBsAg1RCvBVdK.jpg",@"http://gfs6.gomein.net.cn/T1CLLvBQbv1RCvBVdK.jpg",@"http://gfs6.gomein.net.cn/T1CCx_B5CT1RCvBVdK.jpg",@"http://gfs7.gomein.net.cn/T17QxvB7b_1RCvBVdK.jpg",@"http://gfs8.gomein.net.cn/T17CWsBmKT1RCvBVdK.jpg",@"http://gfs7.gomein.net.cn/T1nabsBCxT1RCvBVdK.jpg",@"http://gfs7.gomein.net.cn/T199_gBCDT1RCvBVdK.jpg",@"http://gfs7.gomein.net.cn/T1H.VsBKZT1RCvBVdK.jpg",@"http://gfs6.gomein.net.cn/T1JRW_BmLT1RCvBVdK.jpg"]

#define GoodsRecommendArray  @[@"http://gfs5.gomein.net.cn/T1blDgB5CT1RCvBVdK.jpg",@"http://gfs1.gomein.net.cn/T1loYvBCZj1RCvBVdK.jpg",@"http://gfs1.gomein.net.cn/T1w5bvB7K_1RCvBVdK.jpg",@"http://gfs1.gomein.net.cn/T1w5bvB7K_1RCvBVdK.jpg",@"http://gfs6.gomein.net.cn/T1L.VvBCxv1RCvBVdK.jpg",@"http://gfs9.gomein.net.cn/T1joLvBKhT1RCvBVdK.jpg",@"http://gfs5.gomein.net.cn/T1AoVvB7_v1RCvBVdK.jpg"]

#define GoodsHomeSilderImagesArray @[@"http://gfs5.gomein.net.cn/T1obZ_BmLT1RCvBVdK.jpg",@"http://gfs9.gomein.net.cn/T1C3J_B5LT1RCvBVdK.jpg",@"http://gfs5.gomein.net.cn/T1CwYjBCCT1RCvBVdK.jpg",@"http://gfs7.gomein.net.cn/T1u8V_B4ET1RCvBVdK.jpg",@"http://gfs7.gomein.net.cn/T1zODgB5CT1RCvBVdK.jpg"]


#endif /* Macros_h */
