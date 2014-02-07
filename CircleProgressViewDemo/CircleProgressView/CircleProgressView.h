//
//  CircleProgressView.h
//  CircleProgressViewDemo
//
//  Created by tu on 2/7/14.
//  Copyright (c) 2014 tu changwei. All rights reserved.
//

#import <UIKit/UIKit.h>
@import QuartzCore;
@interface CircleProgressView : UIView

@property(assign, nonatomic) float progress;

- (void)startAnimating;

- (void)stopAnimating;

@end
