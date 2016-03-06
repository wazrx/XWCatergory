//
//  UIActivityIndicatorView+XWAdd.h
//  WxSelected
//
//  Created by YouLoft_MacMini on 15/12/23.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWConst.h"

#define indicatorColor color(203, 184, 112)

@interface UIActivityIndicatorView (XWAdd)
+ (void)xw_showAnimationInView:(UIView *)view;
+ (void)xw_stopAnimationInView:(UIView *)view;
@end
