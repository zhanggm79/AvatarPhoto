//
//  ViewController.m
//  AvatarPhoto
//
//  Created by Z on 2017/9/12.
//  Copyright © 2017年 Z. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    GMSharedApplication.statusBarStyle = UIStatusBarStyleLightContent;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 60)];
    btn.centerX = self.view.centerX;
    [btn setTitle:@"Push到下一界面" forState:0];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}


- (void)btnClick:(UIButton *)sender {
    
    SecondController * secondCtrl = [[SecondController alloc] init];
    [self.navigationController pushViewController:secondCtrl animated:YES];
}



@end
