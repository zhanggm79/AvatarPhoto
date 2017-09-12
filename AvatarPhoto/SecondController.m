//
//  SecondController.m
//  AvatarPhoto
//
//  Created by Z on 2017/9/12.
//  Copyright © 2017年 Z. All rights reserved.
//

#import "SecondController.h"
#import "GMPhotoHelper.h"

@interface SecondController ()

@property (nonatomic,strong) UIImageView * iconImage;

@end

@implementation SecondController
#pragma mark - Lazy loading           懒加载


#pragma mark - LifeCyle               生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择头像";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createViews];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    GMSharedApplication.statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}


- (void)dealloc {
    NSLog(@"%@--->释放了",self.class);
}



#pragma mark - Initial control        初始化控件
- (void)createViews {
    
    _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 200, 200)];
    GM_BorderRadius(_iconImage, 100, 1, [UIColor redColor]);
    _iconImage.backgroundColor = [UIColor redColor];
    _iconImage.centerX = self.view.centerX;
    _iconImage.centerY = self.view.centerY;
    _iconImage.userInteractionEnabled = YES;
    [_iconImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconImageClick:)]];
    [self.view addSubview:_iconImage];
    
}

#pragma mark - Action  Method         控件事件
- (void)iconImageClick:(UITapGestureRecognizer *)sender {
    
    [self callCamera];
    
}

#pragma mark - Private Method         私有方法
- (void)callCamera {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"相机");
        [self getSourceWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"相册");
        [self getSourceWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)getSourceWithSourceType:(UIImagePickerControllerSourceType)sourceType {
    
    GMPhotoConfig * config = [[GMPhotoConfig alloc] init];
    config.navBarTintColor = [UIColor whiteColor];
    config.navBarBgColor = [UIColor colorWithRed:48/255.0 green:50/255.0 blue:57/255.0 alpha:1];
    config.navBarTitleColor = [UIColor whiteColor];
    
    [[GMPhotoHelper creatWithSourceType:sourceType config:config] getSourceWithSelectImageBlock:^(id data) {
        
        if ([data isKindOfClass:[UIImage class]]) {
            // 图片
            [self.iconImage setImage:(UIImage *)data];
        } else {
            NSLog(@"所选内容非图片对象");
        }
    }];
}

#pragma mark - Set/Get Methods        重写设值/取值

#pragma mark - External Delegate      外部代理

#pragma mark - Notification           通知方法

#pragma mark - UITableView            代理方法

#pragma mark - OtherMethods           其他方法


@end
