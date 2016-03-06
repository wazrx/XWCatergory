//
//  UICollectionView+XWAdd.m
//  XWCurrencyExchange
//
//  Created by YouLoft_MacMini on 16/1/31.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UICollectionView+XWAdd.h"
#import "XWConst.h"

@implementation UICollectionView (XWAdd)

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (((UINavigationController *)RootTabBarVC.selectedViewController).viewControllers.count == 1) {
        return [super hitTest:point withEvent:event];
    }
    if ([self convertPoint:point toView:[UIApplication sharedApplication].keyWindow].x < 30) {
        return RootTabBarVC.selectedViewController.view;
    }else{
        return [super hitTest:point withEvent:event];
    }
}

@end
