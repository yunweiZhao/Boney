//
//  CusView.m
//  A6_ 高级_2_ 核心动画
//
//  Created by Bo on 16/5/8.
//  Copyright © 2016年 Simple. All rights reserved.
//

#import "CusView.h"

@interface CusView ()

@property (strong, nonatomic) UIBezierPath *path;
@property (strong, nonatomic) NSMutableArray *array;

@end


@implementation CusView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    CGPoint point = [pan locationInView:self];
    if (pan.state == UIGestureRecognizerStateBegan) {
        _path = [UIBezierPath bezierPath];
        [_path moveToPoint:point];
        [self.array addObject:_path];
    }
    [_path addLineToPoint:point];
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect{
    for (UIBezierPath *path in self.array){
        [path stroke];
    }
}

- (NSMutableArray *)array{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}


@end
