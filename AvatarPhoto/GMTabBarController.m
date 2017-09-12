//
//  GMTabBarController.m
//  YYQ
//
//  Created by Z on 16/11/7.
//  Copyright © 2016年 Z. All rights reserved.
//

#import "GMTabBarController.h"
#import "ViewController.h"
#import "GMNavigationController.h"

@interface GMTabBarController ()

@end

@implementation GMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    ViewController * homeCtrl = [[ViewController alloc] init];
    [self addChildViewController:homeCtrl title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
  
}


- (void)addChildViewController:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置文字的样式
    [self.tabBar setTintColor: [UIColor orangeColor]];

    GMNavigationController * nav = [[GMNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}
@end
