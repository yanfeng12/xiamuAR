//
//  YFKindsModel.h
//  xiamuAR
//
//  Created by guopenglai on 2018/1/4.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFKindsModel : NSObject
/** 图片  */
@property (nonatomic, copy ,readonly) NSString *iconImage;
/** 文字  */
@property (nonatomic, copy ,readonly) NSString *iconTitle;
/** tag  */
@property (nonatomic, copy ,readonly) NSString *iconTag;
/** tag颜色  */
@property (nonatomic, copy ,readonly) NSString *iconColor;
@end
