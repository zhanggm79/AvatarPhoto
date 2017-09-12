//
//  GMNavigationController.m
//  YYQ
//
//  Created by Z on 16/11/7.
//  Copyright © 2016年 Z. All rights reserved.
//

#import "GMNavigationController.h"

@interface GMNavigationController ()

@property (strong,nonatomic) UIBarButtonItem * backButton;
@property (strong,nonatomic) UIBarButtonItem * editButton;

@end

@implementation GMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置navBar背景色
    [self.navigationBar setBarTintColor:GM_RGBColor(48, 50, 57)];
    //文字颜色设置
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //设置状态栏
    //self.navigationBar.barStyle = UIBarStyleBlack;
    //半透明状态设置为NO
    [self.navigationBar setTranslucent:NO];
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    if (self.viewControllers.count > 0) {

//        //设置标题是空格当占位符
//        self.backButton = [UIBarButtonItem itemWithImageName:@"backArrow" title:@"    " target:self action:@selector(back)];
//        self.editButton = [UIBarButtonItem itemWithImageName:@"backHome" title:nil target:self action:@selector(backHome)];
//        NSArray * btnArr = @[_backButton,_editButton];
//        //左边的barButtonItems
//        viewController.navigationItem.leftBarButtonItems = btnArr;
//
//    }else{
    
    
    viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"返回" target:self action:@selector(back)];
    }
    //viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"预约" target:self action:@selector(rightItemClick)];
    [super pushViewController:viewController animated:animated];
}




- (void)back {
    [self popViewControllerAnimated:YES];
    
}

- (void)backHome {
    [self popToRootViewControllerAnimated:YES];
}


- (void)rightItemClick {
  
}

@end
