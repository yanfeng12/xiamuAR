//
//  YFNotificationCenterName.h
//  xiamuAR
//
//  Created by guopenglai on 2018/1/4.
//  Copyright © 2018年 guopenglai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFNotificationCenterName : NSObject
#pragma mark - 项目中所有通知

/** 登录成功选择控制器通知 */
UIKIT_EXTERN NSString *const LOGINSELECTCENTERINDEX;

/** 添加购物车或者立即购买通知 */
UIKIT_EXTERN NSString *const SELECTCARTORBUY;


/** 滚动到商品详情界面通知 */
UIKIT_EXTERN NSString *const SCROLLTODETAILSPAGE;
/** 滚动到商品评论界面通知 */
UIKIT_EXTERN NSString *const SCROLLTOCOMMENTSPAGE;

/** 展现顶部自定义工具条View通知 */
UIKIT_EXTERN NSString *const SHOWTOPTOOLVIEW;
/** 隐藏顶部自定义工具条View通知 */
UIKIT_EXTERN NSString *const HIDETOPTOOLVIEW;


/** 商品属性选择返回通知 */
UIKIT_EXTERN NSString *const SHOPITEMSELECTBACK;

/** 分享弹出通知 */
UIKIT_EXTERN NSString *const SHAREALTERVIEW;
@end
