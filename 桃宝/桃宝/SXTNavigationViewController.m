//
//  SXTNavigationViewController.m
//  
//
//  Created by mac on 16/6/16.
//
//

#import "SXTNavigationViewController.h"

@interface SXTNavigationViewController ()

@end

@implementation SXTNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *navigation = [UINavigationBar appearance];
    [navigation setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance]setTitleTextAttributes:@{
                                                    
                                                          }];
//    UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
//    UIBarButtonItem *itme = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:nil action:nil];
//    self.navigationItem.rightBarButtonItem = itme;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
