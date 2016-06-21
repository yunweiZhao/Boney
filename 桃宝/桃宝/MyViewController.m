//
//  MyViewController.m
//  一个购物的app
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Bonway. All rights reserved.
//

#import "MyViewController.h"
#import "LandingViewController.h"
#import "LogonViewController.h"
#import "MyViewCellModel.h"
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
/**登陆注册按钮跟背景*/
@property (nonatomic,strong)UIButton *landingbtn;
@property (nonatomic,strong)UIButton *logonBtn;
@property (nonatomic,strong)UIImageView *imageView;

/**tableView*/
@property (nonatomic,strong)NSArray *arrData;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(244, 244, 244);
    [self.view addSubview:self.imageView];
    [self.imageView addSubview:self.landingbtn];
    [self.imageView addSubview:self.logonBtn];
    [self.view addSubview:self.tableView];
    
    
    [self methodMesonry];
   
}
-(void)methodMesonry{
    __weak typeof(self)weakSelf = self;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top);
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.height.mas_equalTo(125);
    }];
    [self.landingbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(68);
        make.top.mas_equalTo(weakSelf.imageView.mas_top).offset(55);
        make.left.mas_equalTo(weakSelf.imageView.mas_left).offset(100);
        make.bottom.mas_equalTo(weakSelf.imageView.mas_bottom).offset(-55);
    }];
    [self.logonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(68);
        make.top.mas_equalTo(weakSelf.imageView.mas_top).offset(55);
        make.right.mas_equalTo(weakSelf.imageView.mas_right).offset(-100);
        make.bottom.mas_equalTo(weakSelf.imageView.mas_bottom).offset(-55);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.imageView.mas_bottom).offset(35);
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.height.mas_equalTo(264);
    }];
}
#pragma mark
#pragma mark 懒加载
-(UIButton *)landingbtn{
    if (!_landingbtn) {
        _landingbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_landingbtn setTitle:@"登陆" forState:UIControlStateNormal];
        [_landingbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_landingbtn addTarget:self action:@selector(methodToLandingView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _landingbtn;
}
-(UIButton *)logonBtn{
    if (!_logonBtn) {
        _logonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logonBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_logonBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_logonBtn addTarget:self action:@selector(methodToLogonView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logonBtn;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"我的背景"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        _imageView.userInteractionEnabled = YES;
    }
    return _imageView;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 160, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
    
        _tableView.alwaysBounceVertical = NO;
        
    }
    return _tableView;
}
-(NSArray *)arrData{
    if (!_arrData) {
        _arrData = [NSArray array];
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mycellData" ofType:@"plist"]];
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:_arrData.count];
        for (NSDictionary *dic in arr) {
            MyViewCellModel *model = [MyViewCellModel myViewcellFromDictionary:dic];
            [array addObject:model];
        }_arrData = array;
    }
    return _arrData;
}
/**点击事件关联方法*/
-(void)methodToLandingView{
    LandingViewController *lanVC = [[LandingViewController alloc]init];
    [self.navigationController pushViewController:lanVC animated:NO];
}
-(void)methodToLogonView{
    LogonViewController *logon = [[LogonViewController alloc]init];
    [self.navigationController pushViewController:logon animated:NO];
    
}


#pragma mark
#pragma mark 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"ID";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    MyViewCellModel *model = self.arrData[indexPath.row];
    cell.textLabel.text = model.title;
    cell.imageView.frame = CGRectMake(15, 12, 20, 20);
    cell.imageView.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@",model.image]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if ([model.title isEqualToString:@"客服热线"]) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 110, 44)];
        lab.font = [UIFont systemFontOfSize:15.0];
        lab.textColor = [UIColor lightGrayColor];
        lab.textAlignment = NSTextAlignmentRight;
        lab.text = model.rightImage;
        cell.accessoryView = lab;
    }
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
