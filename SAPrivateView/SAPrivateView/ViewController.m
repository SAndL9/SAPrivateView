//
//  ViewController.m
//  SAPrivateView
//
//  Created by 李磊 on 25/5/17.
//  Copyright © 2017年 李磊. All rights reserved.
//

#import "ViewController.h"
#import "LLProgressView.h"
@interface ViewController ()

@property (nonatomic, strong) LLProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testProgressView];
}

- (void)testProgressView{
    _progressView = [[LLProgressView alloc]initWithFrame:CGRectMake(20, 60, 200, 40)];
    _progressView.title = @"已售12345件";
    _progressView.progress = 0.33;
    [self.view addSubview:_progressView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.progressView playAnimation];
    self.progressView.title = @"已售23456件";
    _progressView.progress = 0.63;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
