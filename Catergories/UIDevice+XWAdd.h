//
//  UIDevice+XWAdd.h
//  XWCurrencyExchange
//
//  Created by YouLoft_MacMini on 16/2/25.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^uideviceBlock)(BOOL success);

@interface UIDevice (XWAdd)

+ (BOOL)xwAdd_isAllowedNotification;

+ (CGFloat)xwAdd_getCurrentSystemVersion;

+ (void)xwAdd_openSystemNotificationSettingPageWithCompleteHandle:(uideviceBlock)completeBlock;

@end
