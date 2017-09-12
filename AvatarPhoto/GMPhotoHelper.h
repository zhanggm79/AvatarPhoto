//
//  GMPhotoHelper.h
//  YYQ
//
//  Created by Z on 2017/9/7.
//  Copyright © 2017年 Z. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GMPhotoConfig;

//data可能是image对象，也可能是视频的NSURL
typedef void(^GMPhotoHelperBlock)(id data);


@interface GMPhotoHelper : UIImagePickerController

/**
 *  @param sourceType  类型
 */
+ (instancetype)creatWithSourceType:(UIImagePickerControllerSourceType)sourceType config:(GMPhotoConfig *)config;

/**
 *  选择照片后回调
 */
- (void)getSourceWithSelectImageBlock:(GMPhotoHelperBlock)selectImageBlock;


@end


#pragma mark - GMPhotoConfig

@interface GMPhotoConfig: NSObject
/** 导航条颜色 */
@property (nonatomic,strong) UIColor *navBarBgColor;

/** item的tintcolor */
@property (nonatomic,strong) UIColor *navBarTintColor;

/** titleView的字体颜色 */
@property (nonatomic,strong) UIColor *navBarTitleColor;


@end
