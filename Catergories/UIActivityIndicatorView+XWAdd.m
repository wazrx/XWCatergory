//
//  UIActivityIndicatorView+XWAdd.m
//  WxSelected
//
//  Created by YouLoft_MacMini on 15/12/23.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import "UIActivityIndicatorView+XWAdd.h"
#import "XWConst.h"
#import <objc/runtime.h>


@implementation UIActivityIndicatorView (XWAdd)

+ (void)xw_showAnimationInView:(UIView *)view{
    UIActivityIndicatorView *indicator = objc_getAssociatedObject(view, @"currentIndicator");
    if (!indicator) {
        indicator = [UIActivityIndicatorView new];
        indicator.color = indicatorColor;
        indicator.center = view.center;
        [view addSubview:indicator];
        objc_setAssociatedObject(view, @"currentIndicator", indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    if (!indicator.isAnimating) {
        [indicator startAnimating];
    }
}

+ (void)xw_stopAnimationInView:(UIView *)view{
    UIActivityIndicatorView *indicator = objc_getAssociatedObject(view, @"currentIndicator");
    if (indicator) {
        [indicator stopAnimating];
        [indicator removeFromSuperview];
        objc_removeAssociatedObjects(view);
    }
}

@end
