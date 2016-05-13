//
//  UIImage+XWAdd.h
//  WxSelected
//
//  Created by YouLoft_MacMini on 15/12/29.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XWAdd)
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
