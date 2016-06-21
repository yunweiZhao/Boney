//
//  LandingViewController.m
//  一个购物的app
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Bonway. All rights reserved.
//

#import "LandingViewController.h"

#import "LogonViewController.h"
#import "UMSocial.h"
@interface LandingViewController ()
/**底的label*/
@property (nonatomic,strong)UILabel *leftBack;
/**两个textfield中间*/
@property (nonatomic,strong)UILabel *passTop;
/**账号密码*/
@property (nonatomic,strong)UITextField *lbName;
@property (nonatomic,strong)UITextField *lbPassword;
/**登陆  注册*/
@property (nonatomic,strong)UIButton *landBtn;
@property (nonatomic,strong)UIButton *logonBtn;
/**一键登录分割线*/
@property (nonatomic,strong)UILabel *lbCutting;
@property (nonatomic,strong)UIButton *btnOnekey;
/**第三方登陆*/
@property (nonatomic,strong)UIButton *btnQQ;
@property (nonatomic,strong)UIButton *btnWeChat;
@property (nonatomic,strong)UIButton *btnWeiBo;
@end

@implementation LandingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(245, 245, 245);
    
    self.navigationItem.title = @"登录";
    
    [self.view addSubview:self.leftBack];
    [self.view addSubview:self.passTop];
    [self.view addSubview:self.lbPassword];
    [self.view addSubview:self.lbName];
    [self.view addSubview:self.landBtn];
    [self.view addSubview:self.logonBtn];
    [self.view addSubview:self.lbCutting];
    [self.view addSubview:self.btnOnekey];
    [self.view addSubview:self.btnQQ];
    [self.view addSubview:self.btnWeChat];
    [self.view addSubview:self.btnWeiBo];
    
    [self methodMasonry];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)methodMasonry{
    //创建约束条件
    __weak typeof(self)weakSelf = self;
    [self.leftBack mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(15);
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.height.mas_equalTo(88);
    }];
    [self.passTop mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.leftBack.mas_top).offset(44);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-15);
        make.height.mas_equalTo(1);
    }];
    [self.lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.leftBack.mas_top);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-15);
        make.height.mas_equalTo(44);
    }];
    [self.lbPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.leftBack.mas_top).offset(45);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-15);
        make.height.mas_equalTo(43);
    }];
    [self.landBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.leftBack.mas_bottom).offset(15);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(16);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-16);
        make.height.mas_equalTo(35);
    }];
    [self.logonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.landBtn.mas_bottom).offset(17);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-14);
        make.size.mas_equalTo(CGSizeMake(100, 25));
    }];
    [self.lbCutting mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.landBtn.mas_bottom).offset(53);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(16);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-16);
        make.height.mas_equalTo(1);
    }];
    [self.btnOnekey mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.lbCutting.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.lbCutting.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 25));
        
    }];
    [self.btnQQ mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.btnOnekey.mas_bottom).offset(20);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(60);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
    [self.btnWeChat mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.btnOnekey.mas_bottom).offset(20);
        make.left.mas_equalTo(weakSelf.btnQQ.mas_right).offset(60);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
    [self.btnWeiBo mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.btnOnekey.mas_bottom).offset(20);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-60);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
    //更新约束
//    [self.leftBack mas_updateConstraints:^(MASConstraintMaker *make) {}];
    //在这些是把之前的约束移除  再添加新的约束
//    [self.leftBack mas_remakeConstraints:^(MASConstraintMaker *make) {}]
    
}

#pragma mark
#pragma mark 懒加载
-(UILabel *)leftBack{
    if (!_leftBack) {
        _leftBack = [[UILabel alloc]init];
        _leftBack.backgroundColor = [UIColor whiteColor];
        _leftBack.userInteractionEnabled = NO;
    }
    return _leftBack;
}
-(UILabel *)passTop{
    if (!_passTop) {
        _passTop = [[UILabel alloc]init];
        _passTop.backgroundColor = [UIColor lightGrayColor];
        _passTop.userInteractionEnabled = NO;
    }
    return _passTop;
}
-(UITextField *)lbName{
    if (!_lbName) {
        _lbName = [[UITextField alloc]init];
        _lbName.backgroundColor = [UIColor whiteColor];
        _lbName.borderStyle = UITextBorderStyleNone;
        _lbName.keyboardType = UIKeyboardTypeNumberPad;
        _lbName.placeholder = @"请输入手机号码";
        
    }
    return _lbName;
}
-(UITextField *)lbPassword{
    if (!_lbPassword) {
        _lbPassword = [[UITextField alloc]init];
        _lbPassword.borderStyle = UITextBorderStyleNone;
        _lbPassword.backgroundColor = [UIColor whiteColor];
        _lbPassword.placeholder = @"请输入密码";
    }
    return _lbPassword;
}
-(UIButton *)landBtn{
    if (!_landBtn) {
        _landBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_landBtn setImage:[[UIImage imageNamed:@"登录界面登录按钮"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_landBtn addTarget:self action:@selector(loginButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    }
    return _landBtn;
}
-(UIButton *)logonBtn{
    if (!_logonBtn) {
        _logonBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_logonBtn setTitle:@"立即注册" forState:UIControlStateNormal];
        [_logonBtn setTitleColor:RGB(67, 182, 245) forState:UIControlStateNormal];
        
        [_logonBtn addTarget:self action:@selector(methodToLogonView) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _logonBtn;
}
-(UILabel *)lbCutting{
    if (!_lbCutting) {
        _lbCutting = [[UILabel alloc]init];
        _lbCutting.backgroundColor = [UIColor lightGrayColor];
        _lbCutting.userInteractionEnabled = NO;
    }
    return _lbCutting;
}
-(UIButton *)btnOnekey{
    if (!_btnOnekey) {
        _btnOnekey = [UIButton buttonWithType:UIButtonTypeSystem];
        
        _btnOnekey.backgroundColor = RGB(245, 245, 245);
        [_btnOnekey setTitle:@"一键登录" forState:UIControlStateNormal];
        [_btnOnekey setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _btnOnekey.userInteractionEnabled = NO;
    }
    return _btnOnekey;
}
-(UIButton *)btnQQ{
    if (!_btnQQ) {
        _btnQQ = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btnQQ setImage:[[UIImage imageNamed:@"登录界面qq登陆"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_btnQQ addTarget:self action:@selector(QQLogon) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _btnQQ;
}
-(UIButton *)btnWeChat{
    if (!_btnWeChat) {
        _btnWeChat = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btnWeChat setImage:[[UIImage imageNamed:@"登录界面微信登录"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_btnWeChat addTarget:self action:@selector(weiChat) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _btnWeChat;
}
-(UIButton *)btnWeiBo{
    if (!_btnWeiBo) {
        _btnWeiBo = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btnWeiBo setImage:[[UIImage imageNamed:@"登陆界面微博登录"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    return _btnWeiBo;
}
- (void)loginButtonMethod{
    if (_loginBlock) {
        _loginBlock(@{@"LoginName":_lbName.text,@"Lpassword":_lbPassword.text});
    }
}
- (void)landingButtonMethod{
    if (_landingBlock) {
        _landingBlock();
    }
}
-(void)methodToLogonView{
    LogonViewController *logon = [[LogonViewController alloc]init];
    [self.navigationController pushViewController:logon animated:NO];
    
}
-(void)QQLogon{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            NSLog(@"dict:%@",dict);
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
}
-(void)weiChat{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            NSLog(@"dict:%@",dict);
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }
        
    });
}

@end
