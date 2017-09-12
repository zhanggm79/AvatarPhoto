//
//  GMPhotoHelper.m
//  YYQ
//
//  Created by Z on 2017/9/7.
//  Copyright © 2017年 Z. All rights reserved.
//

#import "GMPhotoHelper.h"
#import <MobileCoreServices/MobileCoreServices.h>


#pragma mark - GMPhotoDelegateHelper
@interface GMPhotoDelegateHelper: NSObject <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,copy) GMPhotoHelperBlock selectImageBlock;

@end

@implementation GMPhotoDelegateHelper

#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    
    [picker setNavigationBarHidden:YES];
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
 
    if ([mediaType isEqualToString:( NSString *)kUTTypeImage]) {
        // 图片
        UIImage *image = nil;
        if ([picker allowsEditing]) {
            // 允许修改
            image = [info objectForKey:UIImagePickerControllerEditedImage];
            
        } else {
            // 不允许修改
            image = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        if (_selectImageBlock) {
            _selectImageBlock(image);
        }
    } else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
        // 视频
        NSURL *mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
        if (_selectImageBlock) {
            _selectImageBlock(mediaURL);
        }
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end



@interface GMPhotoHelper ()

@property (nonatomic,strong) GMPhotoDelegateHelper * delegateHelper;

@end

@implementation GMPhotoHelper

/**
 *  @param sourceType       类型
 */
+ (instancetype)creatWithSourceType:(UIImagePickerControllerSourceType)sourceType config:(GMPhotoConfig *)config {
    // 创建
    GMPhotoHelper *imagePicker = [[GMPhotoHelper alloc] init];
    imagePicker.delegateHelper = [[GMPhotoDelegateHelper alloc] init];
    imagePicker.delegate = imagePicker.delegateHelper;
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
    } else {
        
        imagePicker.sourceType = sourceType;
    }
    
    // 配置
    UIColor *navBarTintColor  = nil;
    UIColor *navBarBgColor    = nil;
    UIColor *navBarTitleColor = nil;
    
    navBarTintColor = config && config.navBarTintColor ?  config.navBarTintColor : [UIColor colorWithRed:0.21 green:0.57 blue:0.98 alpha:1.0];
    navBarBgColor = config && config.navBarBgColor ? config.navBarBgColor : [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0];
    navBarTitleColor = config && config.navBarTitleColor ? config.navBarTitleColor : [UIColor blackColor];
    
    //图片是否可编辑
    imagePicker.allowsEditing = YES;
    [imagePicker.navigationBar setBarTintColor:navBarBgColor];
    [imagePicker.navigationBar setTranslucent:NO];
    [imagePicker.navigationBar setTintColor:navBarTintColor];
    [imagePicker.navigationBar setBackgroundColor:navBarBgColor];
    // 设置字体颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = navBarTitleColor;
    [imagePicker.navigationBar setTitleTextAttributes:attrs];
    
    return imagePicker;
}

/**
 *  选择照片后回调
 */
- (void)getSourceWithSelectImageBlock:(GMPhotoHelperBlock)selectImageBlock {

    
    self.delegateHelper.selectImageBlock = selectImageBlock;
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:self animated:YES completion:nil];
}



@end

@implementation GMPhotoConfig

@end
