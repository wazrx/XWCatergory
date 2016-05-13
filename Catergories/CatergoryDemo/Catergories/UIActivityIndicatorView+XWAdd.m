//
//  UIActivityIndicatorView+XWAdd.m
//  WxSelected
//
//  Created by YouLoft_MacMini on 15/12/23.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import "UIActivityIndicatorView+XWAdd.h"
#import "UIView+FrameChange.h"
#import <objc/runtime.h>


@implementation UIActivityIndicatorView (XWAdd)

+ (void)xwAdd_showAnimationInView:(UIView *)view{
    UIActivityIndicatorView *indicator = objc_getAssociatedObject(view, @"currentIndicator");
    if (!indicator) {
        indicator = [UIActivityIndicatorView new];
        indicator.color = indicatorColor;
        indicator.center = CGPointMake(view.width / 2.0f, view.height / 2.0f);
        [view addSubview:indicator];
        objc_setAssociatedObject(view, @"currentIndicator", indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    if (!indicator.isAnimating) {
        [indicator startAnimating];
    }
}

+ (void)xwAdd_stopAnimationInView:(UIView *)view{
    UIActivityIndicatorView *indicator = objc_getAssociatedObject(view, @"currentIndicator");
    if (indicator) {
        [indicator stopAnimating];
        [indicator removeFromSuperview];
        objc_removeAssociatedObjects(view);
    }
}

@end