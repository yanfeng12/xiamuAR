//
//  YFBaseViewController.m
//  xiamuAR
//
//  Created by guopenglai on 2017/12/28.
//  Copyright © 2017年 guopenglai. All rights reserved.
//

#import "YFBaseViewController.h"

@interface YFBaseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *customNavigationView;
@property (nonatomic,copy)lzButtonBlock leftButtonAction;
@property (nonatomic,copy)lzButtonBlock rightButtonAction;
@end

@implementation YFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createCustomView];
}
- (void)createCustomView {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = LZColorBase;
    [self.view addSubview:bgView];
    self.customNavigationView = bgView;
    
    LZWeakSelf(ws)
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.mas_equalTo(ws.view);
        make.height.mas_equalTo(64);
    }];
    
    //    UIView *line = [UIView new];
    //    line.backgroundColor = [UIColor blackColor];
    //    [bgView addSubview:line];
    //
    //    [line mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.right.and.bottom.mas_equalTo(bgView);
    //        make.height.mas_equalTo(@1);
    //    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:titleLabel];
    self.customTitleLabel = titleLabel;
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(bgView.mas_centerX);
        make.centerY.mas_equalTo(bgView.mas_centerY).offset(10);
    }];
    [titleLabel sizeToFit];
}
- (void)lzSetNavigationTitle:(NSString*)title {
    
    self.customTitleLabel.text = title;
    
    [self.customTitleLabel sizeToFit];
}

- (void)lzSetLeftButtonWithTitle:(NSString*)title selectedImage:(NSString*)selectImageName normalImage:(NSString*)normalImage actionBlock:(lzButtonBlock)block {
    if (self.leftButon == nil) {
        self.leftButon = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftButon.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.leftButon setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.leftButon addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.customNavigationView addSubview:self.leftButon];
        
        LZWeakSelf(ws)
        [self.leftButon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws.customNavigationView).offset(10);
            make.top.mas_equalTo(ws.customNavigationView).offset(20);
            make.bottom.mas_equalTo(ws.customNavigationView);
            make.width.mas_equalTo(@44);
        }];
    }
    
    [self.leftButon setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [self.leftButon setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    [self.leftButon setTitle:title forState:UIControlStateNormal];
    self.leftButtonAction = block;
}

- (void)leftButtonClick:(UIButton*)button {
    button.selected = !button.selected;
    if (self.leftButtonAction != nil) {
        self.leftButtonAction(button);
    }
}

- (void)lzSetRightButtonWithTitle:(NSString*)title selectedImage:(NSString*)selectImageName normalImage:(NSString*)normalImage actionBlock:(lzButtonBlock)block {
    
    if (self.rightButton == nil) {
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.customNavigationView addSubview:self.rightButton];
        
        LZWeakSelf(ws)
        [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(ws.customNavigationView).offset(-10);
            make.top.mas_equalTo(ws.customNavigationView).offset(20);
            make.bottom.mas_equalTo(ws.customNavigationView);
            make.width.mas_equalTo(@44);
        }];
    }
    
    [self.rightButton setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    [self.rightButton setTitle:title forState:UIControlStateNormal];
    self.rightButtonAction = block;
}

- (void)rightButtonClick:(UIButton*)button {
    
    if (self.rightButtonAction != nil) {
        self.rightButtonAction(button);
    }
}

- (void)lzHiddenNavigationBar:(BOOL)hidden {
    
    self.customNavigationView.hidden = hidden;
}
-(NSMutableArray *)dataSource{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

-(void)registerCellWithNib:(NSString *)nibName tableView:(UITableView *)tableView{
    [tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:nibName];
}

-(void)registerCellWithClass:(NSString *)className tableView:(UITableView *)tableView{
    [tableView registerClass:NSClassFromString(className) forCellReuseIdentifier:className];
}
#pragma mark
#pragma mark TableView delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}

-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    
    NSLog(@"%@--dealloc",NSStringFromClass([self class]));
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
