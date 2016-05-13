//
//  UIAlertView+XWAdd.h
//  RedEnvelopes
//
//  Created by wazrx on 16/3/21.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^alertViewXWAddBlock)();

@interface UIAlertView (XWAdd)<UIAlertViewDelegate>

+(void)xwAdd_showAlertViewWith:(NSString *)title message:(NSString *)message leftButtonTitle:(NSString *)leftButtonTitle leftButtonClickedConfig:(alertViewXWAddBlock)leftBlock rightButtonTitle:(NSString *)rightButtonTitle rightButtonClickedConfig:(alertViewXWAddBlock)rightBlock;

+(void)xwAdd_showOneAlertViewWith:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle buttonClickedConfig:(alertViewXWAddBlock)block;

@end
