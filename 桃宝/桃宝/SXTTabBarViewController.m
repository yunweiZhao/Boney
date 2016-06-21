//
//  SXTTabBarViewController.m
//  一个购物的app
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Bonway. All rights reserved.
//

#import "SXTTabBarViewController.h"
#import "SXTNavigationViewController.h"
@interface SXTTabBarViewController ()
/**加载plist文件中的数据*/
@property (nonatomic,strong)NSArray *array;
@end

@implementation SXTTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**存储视图的数组*/
    NSMutableArray *viewArray = [NSMutableArray arrayWithCapacity:self.array.count];
    [self.array enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        Class ViewControllerClass = NSClassFromString(dic[@"ViewController"]);
        UIViewController *viewVC = [[ViewControllerClass alloc]init];
        /**设置tabbar的字体*/
        viewVC.title = dic[@"Title"];
        if ([dic[@"Title"] isEqualToString:@"购物车"]) {
            viewVC.tabBarItem.badgeValue = @"1";
        }
        
        /**设置tabbar的图片*/
        viewVC.tabBarItem.image = [[UIImage imageNamed:dic[@"tabbarItemImage"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        /**设置tabbar的选中图片*/
        viewVC.tabBarItem.selectedImage = [[UIImage imageNamed:dic[@"tabbarItemSelectImage"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        SXTNavigationViewController *navVc = [[SXTNavigationViewController alloc]initWithRootViewController:viewVC];
        [viewArray addObject:navVc];
    }];
    /**设置tabbar的自定义字体*/
    [[UITabBarItem appearance]setTitleTextAttributes:@{
                                                      NSFontAttributeName:[UIFont systemFontOfSize:10],
                                            NSForegroundColorAttributeName:
                                                          [UIColor grayColor]
    }forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:@{
                                                      NSFontAttributeName:
                                                          [UIFont systemFontOfSize:10.0],
                                                      NSForegroundColorAttributeName:[UIColor colorWithRed:65.0/255.0  green:179.0/255.0 blue:241.0/255.0 alpha:1.0]
                                                      } forState:UIControlStateSelected];
    self.viewControllers = viewArray;
    self.selectedIndex = 0;
    
}

#pragma mark
#pragma mark 懒加载
-(NSArray *)array{
    if (!_array) {
        _array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TabBarController" ofType:@"plist"]];
    }
    return _array;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
