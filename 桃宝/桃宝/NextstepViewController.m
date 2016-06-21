//
//  NextstepViewController.m
//  一个购物的app
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//

#import "NextstepViewController.h"

@interface NextstepViewController ()
/**顶上的提示文字*/
@property (nonatomic,strong)UITextField *lbtop;
/**文本框*/
@property (nonatomic,strong)UILabel *leftBack;
@property (nonatomic,strong)UITextField *lbName;
@property (nonatomic,strong)UIButton *btnRight;
@property (nonatomic,strong)UIButton *btnLogon;
@property (nonatomic,strong)UIButton *btnREPLAY;

@end

@implementation NextstepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"验证手机号";
    self.view.backgroundColor = RGB(245, 245, 245);
    [self.view addSubview:self.lbtop];
    [self.view addSubview:self.leftBack];
    [self.view addSubview:self.lbName];
    [self.view addSubview:self.btnRight];
    [self.view addSubview:self.btnLogon];
    [self.view addSubview:self.btnREPLAY];
    [self methodMasonry];
}
-(void)methodMasonry{
    //创建约束条件
    __weak typeof(self)weakSelf = self;
    [self.lbtop mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.view.mas_top);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.height.mas_equalTo(35);
    }];
    [self.leftBack mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.lbtop.mas_bottom);
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.height.mas_equalTo(44);
    }];
    [self.lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.lbtop.mas_bottom);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-102);
        make.height.mas_equalTo(44);
    }];
    [self.btnRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lbtop.mas_bottom);
        make.left.mas_equalTo(weakSelf.lbName.mas_right);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.height.mas_equalTo(44);
    }];
    [self.btnLogon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lbName.mas_bottom).offset(16);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(16);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-16);
        make.height.mas_equalTo(35);
    }];
    [self.btnREPLAY mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.btnLogon.mas_bottom).offset(22);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(106, 20));
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITextField *)lbtop{
    if (!_lbtop) {
        _lbtop = [[UITextField alloc]init];
        _lbtop.textColor = RGB(107, 107, 107);
        _lbtop.userInteractionEnabled = NO;
        _lbtop.text = @"验证码已发送到+86";
    }
    return _lbtop;
}
-(UILabel *)leftBack{
    if (!_leftBack) {
        _leftBack = [[UILabel alloc]init];
        _leftBack.backgroundColor = [UIColor whiteColor];
        _leftBack.userInteractionEnabled = NO;
    }
    return _leftBack;
}
-(UITextField *)lbName{
    if (!_lbName) {
        _lbName = [[UITextField alloc]init];
        _lbName.backgroundColor = [UIColor whiteColor];
        _lbName.borderStyle = UITextBorderStyleNone;
        _lbName.placeholder = @"请输入验证码";
        
    }
    return _lbName;
}
-(UIButton *)btnRight{
    if (!_btnRight) {
        _btnRight = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btnRight setTitle:@"56秒后重试" forState:UIControlStateNormal];
        [_btnRight setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _btnRight.userInteractionEnabled = NO;
    }
    return _btnRight;
}
-(UIButton *)btnLogon{
    if (!_btnLogon) {
        _btnLogon = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btnLogon setTitle:@"注册" forState:UIControlStateNormal];
        _btnLogon.backgroundColor = RGB(232, 232, 232);
        [_btnLogon setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return _btnLogon;
}
-(UIButton *)btnREPLAY{
    if (!_btnREPLAY) {
        _btnREPLAY = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btnREPLAY setTitle:@"重新发送验证码" forState:UIControlStateNormal];
        [_btnREPLAY setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
    return _btnREPLAY;
}
@end
