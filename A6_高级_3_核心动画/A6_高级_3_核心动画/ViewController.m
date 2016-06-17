//
//  ViewController.m
//  A6_高级_3_核心动画
//
//  Created by Bo on 16/5/11.
//  Copyright © 2016年 Simple. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *viewAnimation;
///记录basicAnimation  终点位置
@property (assign, nonatomic) CGPoint endPoint;
///记录basicAnimation  起点位置
@property (assign, nonatomic) CGPoint startPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIView的动画效果
    
    //CAAnimation动画效果
    [self creatBtns];
    //获取basicAnimation终点位置
    self.endPoint = self.viewAnimation.layer.position;
}
- (void)creatBtns{
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setFrame:CGRectMake(100, 100, 175, 50)];
    
    [btn1 setTitle:@"UIView动画" forState:UIControlStateNormal];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setFrame:CGRectMake(100, 200, 175, 50)];
    [btn2 setTitle:@"核心动画" forState:UIControlStateNormal];
    //让两个按钮分别关联各自的方法
    [btn1 addTarget:self action:@selector(runViewAnimation) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(runCAAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:self.viewAnimation];
    //帧动画按钮
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3 setFrame:CGRectMake(100, 300, 175, 50)];
    [btn3 setTitle:@"晃动动画" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(shakeAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    //动画组按钮
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn4 setFrame:CGRectMake(100, 400, 175, 50)];
    [btn4 setTitle:@"Group动画" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(groupAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    //压栈操作按钮
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn5 setFrame:CGRectMake(100, 500, 175, 50)];
    [btn5 setTitle:@"压栈" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(pushMyViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
}
//完成压栈
- (void)pushMyViewController{
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    
    CATransition *trans = [CATransition animation];
    //subType   type
    trans.type =  @"cameraIrisHollowOpen";//3D效果
    trans.duration = 2.0;
    trans.subtype = @"fromleft";
    [self.navigationController pushViewController:secondVC animated:YES];
    [self.navigationController.view.layer addAnimation:trans forKey:nil];
}



- (void)groupAnimation{
    //1.旋转动画
    CABasicAnimation *rotatAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotatAnimation.fromValue = @0;
    rotatAnimation.toValue = @(M_PI * 2 * 10);
    rotatAnimation.removedOnCompletion = YES;
    //2.曲线路径动画
    CAKeyframeAnimation *curePathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //使用贝塞尔路径
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    [bPath moveToPoint:CGPointMake(0, 0)];
    [bPath addQuadCurveToPoint:CGPointMake(0, 500) controlPoint:CGPointMake(300, 300)];
    curePathAnimation.path = bPath.CGPath;
    curePathAnimation.removedOnCompletion = YES;
    
    //3.将两个动画放入动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:rotatAnimation,curePathAnimation, nil];
    //4.设置动画组的时间，重复次数
    group.duration = 2.0;
    group.repeatCount = MAXFLOAT;
    //5.加入到指定的layer
    [self.viewAnimation.layer addAnimation:group forKey:@"group"];
}


/*
 晃动动画(使用帧动画来完成)
 */
- (void)shakeAnimation{
    //1.创建帧动画对象
    //CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //2.设置帧动画的组成帧(values)
//    NSArray *array = @[@(M_PI_4 * 0.1),@(-M_PI_4 * 0.1),@(M_PI_4 * 0.1)];
//    shakeAnimation.values = array;
//    //3.设置持续时间
//    shakeAnimation.duration = 0.1;
//    //4.设置重复次数
//    shakeAnimation.repeatCount = MAXFLOAT;
    
    //如何创建一个路径？
    /*
     上下文
     贝塞尔路径
     */
    //使用贝塞尔路径完成动画
//    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//     shakeAnimation.duration = 2.0;
//    UIBezierPath *bPath = [UIBezierPath bezierPath];
//    //
//    [bPath moveToPoint:CGPointMake(150, 0)];
//    //
//    [bPath addLineToPoint:CGPointMake(150, 600)];
//    [bPath addLineToPoint:CGPointMake(150, 0)];
//    // 设置成上下无限重复
//    shakeAnimation.repeatCount = MAXFLOAT;
//    // 设置动画的路径
//    shakeAnimation.path = bPath.CGPath;
//    //5.将动画加入到指定的layer
////    [self.viewAnimation.layer addAnimation:shakeAnimation forKey:nil];
////    //设置动画制定完之后，viewAnimation的位置
////    self.viewAnimation.layer.position = CGPointMake(150, 0);
//    
//    //使用上下文或者是贝塞尔路径  完成 viewAnimaiton绕self.view四周 无限循环的动画
//    
//    
//    //矩形路径的动画
//    CAKeyframeAnimation *keyAniamtion2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    
//    keyAniamtion2.duration = 2.0;
//    
//    //
//    UIBezierPath *bPath2 = [UIBezierPath bezierPathWithRect:self.view.frame];
//    
//    keyAniamtion2.path = bPath2.CGPath;
//    
//    keyAniamtion2.repeatCount = MAXFLOAT;
//    [self.viewAnimation.layer addAnimation:keyAniamtion2 forKey:nil];
//    //设置动画制定完之后，viewAnimation的位置
//    self.viewAnimation.layer.position = CGPointMake(0, 0);
//    
    CAKeyframeAnimation *keyAniamtion3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //使用上下文获取路径
    //直接创建一个空的路径(CG-ARC 释放不了)
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, 0);
    CGPathAddLineToPoint(path, nil, 200, 600);
    keyAniamtion3.path  = path;
    [self.viewAnimation.layer addAnimation:keyAniamtion3 forKey:nil];
    self.viewAnimation.layer.position = CGPointMake(200, 600);
    //CG对象的释放
    CGPathRelease(path);
}

- (void)runViewAnimation{
    
    __weak typeof(self)weakSelf = self;
    
    //使用UIView动画，实现viewAnimation的移动
    [UIView animateWithDuration:2.0 animations:^{
        __strong typeof(weakSelf)strongSelf = weakSelf;
        //动画体
        [strongSelf.viewAnimation setFrame:CGRectMake(100, CGRectGetHeight(strongSelf.view.frame) - CGRectGetHeight(strongSelf.viewAnimation.frame), 173, 30)];
        // 记录basicAnimation 的起点
        strongSelf.startPoint = strongSelf.viewAnimation.layer.position;
    }];
}
- (void)runCAAnimation{
    //CAAnimation
    //使用CAAnimation实现视图的移动
//    CAAnimation *animation = [CAAnimation animation];
//    animation.duration = 2;
//    animation.repeatCount = 1;
//    [self.viewAnimation setFrame:CGRectMake(100, 20, 175, 30)];
//    
//    //添加动画方法
//    [self.viewAnimation.layer addAnimation:animation forKey:@"animaiton"];
    
    //CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //path ：CALayer中的一个属性(需要修改的属性)
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    //将起点转化成对应的value值
    NSValue *valueFrom = [NSValue valueWithCGPoint:self.startPoint];
    CGPoint endPoint = self.endPoint;
    NSValue *valeTo = [NSValue valueWithCGPoint:endPoint];
    basicAnimation.fromValue = valueFrom;
    basicAnimation.toValue = valeTo;
    //设置动画的持续时间
    basicAnimation.duration = 2.0;
    //beginTime（动画开始的时间）
    basicAnimation.beginTime = CACurrentMediaTime() + 2;
    
    //控制动画速率
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//@"easeOut";
    //[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //将动画添加到指定的图层
    basicAnimation.delegate = self;
    [self.viewAnimation.layer addAnimation:basicAnimation forKey:@"animation"];
}
//动画结束时候回调的方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.viewAnimation.frame = CGRectMake(100, 20, 175, 30);
}

/*
 动画组的实现
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //旋转动画的实现(CABasicAniamtion  transform)
    //创建一个动画对象(keyPath:支持动画的属性)
    CABasicAnimation *bAniamtion = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //起点
    bAniamtion.fromValue = @(0);
    //终点
    bAniamtion.toValue = @(M_PI*2 * 10);
    //缩放动画
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];
    //是否在动画完成之后移除原先的状态(通常移除)
    scaleAnim.removedOnCompletion = YES;
    //贝塞尔曲线路径
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:CGPointMake(10.0, 10.0)];
    [movePath addQuadCurveToPoint:CGPointMake(100, 300) controlPoint:CGPointMake(300, 100)];
    //关键帧动画（位置）
    CAKeyframeAnimation * posAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    posAnim.path = movePath.CGPath;
    posAnim.removedOnCompletion = YES;
    //透明动画
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"alpha"];
    opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnim.toValue = [NSNumber numberWithFloat:0.1];
    opacityAnim.removedOnCompletion = YES;
    
    CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.fromValue= @(1);
    opacity.toValue= @(0);
    opacity.duration= 1;
    opacity.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations= [NSArray arrayWithObjects:posAnim,scaleAnim,opacity,bAniamtion,nil];
    animGroup.duration= 1;
    animGroup.repeatCount= HUGE;
    [self.viewAnimation.layer addAnimation:animGroup forKey:nil];

}


- (UIView *)viewAnimation{
    if (!_viewAnimation) {
        _viewAnimation = [[UIView alloc]initWithFrame:CGRectMake(100, 20, 175, 30)];
        _viewAnimation.backgroundColor = [UIColor redColor];
    }
    return _viewAnimation;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
