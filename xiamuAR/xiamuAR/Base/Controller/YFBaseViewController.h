//
//  YFBaseViewController.h
//  xiamuAR
//
//  Created by guopenglai on 2017/12/28.
//  Copyright © 2017年 guopenglai. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^lzButtonBlock)(UIButton* button);
@interface YFBaseViewController : UIViewController
//导航栏自定义
@property (nonatomic,strong)UIButton *leftButon;
@property (nonatomic,strong)UIButton *rightButton;
@property (nonatomic,strong)UILabel *customTitleLabel;
@property (nonatomic,strong)UIView *customNavigationView;
@property (nonatomic,copy)NSString *flog;
/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;
/* tableView */
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *dataSource;
-(void)registerCellWithNib:(NSString *)nibName tableView:(UITableView *)tableView;

-(void)registerCellWithClass:(NSString *)className tableView:(UITableView *)tableView;

-(int)getRandomNumber:(int)from to:(int)to;


- (void)lzSetNavigationTitle:(NSString*)title;
- (void)lzSetLeftButtonWithTitle:(NSString*)title
selectedImage:(NSString*)selectImageName
                     normalImage:(NSString*)normalImage
                     actionBlock:(lzButtonBlock)block;

- (void)lzSetRightButtonWithTitle:(NSString*)title
                    selectedImage:(NSString*)selectImageName
                      normalImage:(NSString*)normalImage
                      actionBlock:(lzButtonBlock)block;

- (void)lzHiddenNavigationBar:(BOOL)hidden;
@end

