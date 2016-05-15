//
//  UIImage+XWAdd.h
//  WxSelected
//
//  Created by YouLoft_MacMini on 15/12/29.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (XWAdd)

@property (nonatomic, readonly) BOOL hasAlphaChannel;

#pragma mark - image initailize (图片初始化相关)

+ (UIImage *)xwAdd_imageWithPDF:(id)dataOrPath;

+ (UIImage *)xwAdd_imageWithPDF:(id)dataOrPath size:(CGSize)size;

+ (UIImage *)xwAdd_imageWithEmoji:(NSString *)emoji size:(CGFloat)size;

/**尺寸默认1*1*/
+ (UIImage *)xwAdd_imageWithColor:(UIColor *)color;

+ (UIImage *)xwAdd_imageWithColor:(UIColor *)color size:(CGSize)size;

/**通过绘制block，绘制一张图片*/
+ (UIImage *)xwAdd_imageWithSize:(CGSize)size drawBlock:(void (^)(CGContextRef context))drawBlock;


/**
 *  根据颜色生成图片
 */
+ (UIImage *)xwAdd_imageWithColor:(UIColor *)color imageSize:(CGSize)size;

/**
 *  截图
 */
+ (UIImage *)xwAdd_captureWithView:(UIView *)view;

/**给图片加上高斯模糊效果*/
- (UIImage *)xwAdd_boxblurWithBlurNumber:(CGFloat)blur;
@end

NS_ASSUME_NONNULL_END