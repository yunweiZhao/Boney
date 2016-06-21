//
//  LandingViewController.h
//  一个购物的app
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Bonway. All rights reserved.
//

#import <UIKit/UIKit.h>
/**登陆时回传的数据*/
typedef void(^loginBlock)(NSDictionary *dic);
typedef void(^landingBlock)();
@interface LandingViewController : UIViewController
/**登陆block*/
@property (copy, nonatomic) loginBlock loginBlock;
/**去注册block*/
@property (copy, nonatomic) landingBlock landingBlock;
@end
