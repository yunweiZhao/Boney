//
//  ViewController.m
//  A6_ 高级_2_ 核心动画
//
//  Created by Bo on 16/5/8.
//  Copyright © 2016年 Simple. All rights reserved.
//

#import "ViewController.h"
#import "CusView.h"

@interface ViewController ()

@property(strong, nonatomic) UIImageView *tempView;
@property (strong, nonatomic) UIBezierPath *path;

@property (strong, nonatomic) CusView *cusView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tempView];
    
    [self.tempView.layer addAnimation:[self animation1] forKey:@"ani"];

    
    self.cusView = [[CusView alloc]initWithFrame:CGRectMake(0, 300, 375, 375)];
    self.cusView.backgroundColor = [UIColor greenColor];
    //[self.view addSubview:self.cusView];
   
   
}

//
- (CAAnimation *)animation1{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    [basicAnimation setFromValue:0];
    [basicAnimation setToValue:@(2*M_PI)];
    basicAnimation.repeatCount = MAXFLOAT;
    basicAnimation.duration = 1.0;
    [basicAnimation setRemovedOnCompletion:NO];
    //return basicAnimation;
    
    CAKeyframeAnimation *keyFrameAniamtion = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAniamtion.duration = 1;
    keyFrameAniamtion.repeatCount = MAXFLOAT;
    self.tempView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    //通过设置values实现
    CGPoint point1 = CGPointMake(0, 0);
    NSValue *value1 = [NSValue valueWithCGPoint:point1];
    CGPoint point2 = CGPointMake(375, 50);
    NSValue *value2 = [NSValue valueWithCGPoint:point2];
   keyFrameAniamtion.values = @[value1,value2,value1];
    
    //往返路径动画(通过设置path实现)
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(0, 0)];
    [path1 addLineToPoint:CGPointMake(375, 600)];
    [path1 addLineToPoint:CGPointMake(0, 0)];
    //矩形路径动画
    keyFrameAniamtion.path = path1.CGPath;
    keyFrameAniamtion.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 375, 600)].CGPath;
    return keyFrameAniamtion;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)tempView{
    if (!_tempView) {
        _tempView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 175, 175)];
        //_tempView.backgroundColor = [UIColor redColor];
        _tempView.image = [UIImage imageNamed:@"1"];
        _tempView.contentMode = UIViewContentModeScaleToFill;
    }
    return _tempView;
}

@end
