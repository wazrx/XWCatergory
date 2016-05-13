//
//  UIAlertView+XWAdd.m
//  RedEnvelopes
//
//  Created by wazrx on 16/3/21.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UIAlertView+XWAdd.h"
#import <objc/runtime.h>

@implementation UIAlertView (XWAdd)

+(void)xwAdd_showAlertViewWith:(NSString *)title message:(NSString *)message leftButtonTitle:(NSString *)leftButtonTitle leftButtonClickedConfig:(alertViewXWAddBlock)leftBlock rightButtonTitle:(NSString *)rightButtonTitle rightButtonClickedConfig:(alertViewXWAddBlock)rightBlock{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:leftButtonTitle, rightButtonTitle, nil];
    alertView.delegate = alertView;
    objc_setAssociatedObject(alertView, "leftButtonClickedConfig", leftBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(alertView, "rightButtonClickedConfig", rightBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [alertView show];
}

+ (void)xwAdd_showOneAlertViewWith:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle buttonClickedConfig:(alertViewXWAddBlock)block{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:buttonTitle, nil];
    objc_setAssociatedObject(alertView, "leftButtonClickedConfig", block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    alertView.delegate = alertView;
    [alertView show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    alertViewXWAddBlock leftBlock = objc_getAssociatedObject(alertView, "leftButtonClickedConfig");
    alertViewXWAddBlock rightBlock = objc_getAssociatedObject(alertView, "rightButtonClickedConfig");
    if (leftBlock && buttonIndex == 0) {
        leftBlock();
        return;
    }
    if (rightBlock && buttonIndex == 1) {
        rightBlock();
        return;
    }
}

@end
