//
//  UIActivityIndicatorView+XWAdd.h
//  WxSelected
//
//  Created by YouLoft_MacMini on 15/12/23.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

#define color(r,g,b,a) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:(a)]

#define indicatorColor color(203, 184, 112, 1)

@interface UIActivityIndicatorView (XWAdd)
+ (void)xwAdd_showAnimationInView:(UIView *)view;
+ (void)xwAdd_stopAnimationInView:(UIView *)view;
@end
