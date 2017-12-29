//
//  Macros.h
//  xiamuAR
//
//  Created by guopenglai on 2017/12/29.
//  Copyright © 2017年 guopenglai. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define LZWeakSelf(ws) __weak typeof(self) ws = self;

/******************    颜色相关         *************/
// Hex色值
#define LZColorFromHex(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//R G B 颜色
#define LZColorFromRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define LZColorBase LZColorFromHex(0x0075a9)

/******************    TabBar          *************/
#define MallClassKey   @"rootVCClassString"
#define MallTitleKey   @"title"
#define MallImgKey     @"imageName"
#define MallSelImgKey  @"selectedImageName"

#endif /* Macros_h */
