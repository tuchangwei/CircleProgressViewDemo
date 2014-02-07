//
//  CircleProgressView.m
//  CircleProgressViewDemo
//
//  Created by tu on 2/7/14.
//  Copyright (c) 2014 tu changwei. All rights reserved.
//

#import "CircleProgressView.h"

@interface CircleProgressView ()

@end
@implementation CircleProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initialize];
    }
    return self;
}

- (void)initialize {
    
    self.backgroundColor = [UIColor clearColor];
    CAShapeLayer *loadingLayer = [CAShapeLayer layer];
    CGFloat lineWidth = 8.0;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2-1*lineWidth startAngle:0 endAngle:1.5*M_PI clockwise:YES];
    loadingLayer.path = path.CGPath;
    loadingLayer.strokeColor = [[UIColor whiteColor]CGColor];
    loadingLayer.fillColor = [[UIColor clearColor]CGColor];
    loadingLayer.lineWidth = lineWidth;
    loadingLayer.lineCap = kCALineCapRound;
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.startPoint = CGPointMake(1,.5);
    gradientLayer.endPoint = CGPointMake(0.5,0.5);
    gradientLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    NSMutableArray *colors = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [colors addObject:(id)[[UIColor colorWithWhite:1 alpha:.1*(i+1)] CGColor]];
    }
    gradientLayer.colors = colors;
    [gradientLayer setMask:loadingLayer];
    [self.layer addSublayer:gradientLayer];
    
}

- (void)startAnimating {
    
    self.hidden = NO;
    [self ratateLayer];
    
}

- (void)stopAnimating {
    
   
    self.hidden = YES;
    
}

- (void)ratateLayer {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.duration = 1.0;
    animation.fromValue = [self.layer valueForKeyPath:@"transform.rotation.z"];
    animation.toValue = @(((NSNumber *)[self.layer valueForKeyPath:@"transform.rotation.z"]).floatValue+M_PI*2);
    [self.layer addAnimation:animation forKey:@"transform.rotation.z"];
    [self.layer setValue:animation.toValue  forKeyPath:@"transform.rotation.z"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (self.hidden == NO)
    {
        [self ratateLayer];
    }
    
    
}
@end
