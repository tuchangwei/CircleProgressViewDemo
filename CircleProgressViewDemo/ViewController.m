//
//  ViewController.m
//  CircleProgressViewDemo
//
//  Created by tu on 2/7/14.
//  Copyright (c) 2014 tu changwei. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
	CircleProgressView *progressView = [[CircleProgressView  alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 70, 70)];
    progressView.center = self.view.center;
    [progressView startAnimating];
    [self.view addSubview:progressView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
