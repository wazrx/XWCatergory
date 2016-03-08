//
//  UIImage+XWAdd.m
//  WxSelected
//
//  Created by YouLoft_MacMini on 15/12/29.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import "UIImage+XWAdd.h"

@implementation UIImage (XWAdd)

+ (UIImage *)xwAdd_imageWithColor:(UIColor *)color imageSize:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)xwAdd_captureWithView:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
