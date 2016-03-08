//
//  UIResponder+XGPush.h
//  XWCurrencyExchange
//
//  Created by YouLoft_MacMini on 16/2/22.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (XGPush)

/**
 *  注册信鸽推送
 */
- (void)xwAdd_registerXGPushWithLaunchOptions:(NSDictionary *)launchOptions;

/**
 *  注册设备deviceToken
 */
- (NSString *)xwAdd_registerDeviceToken:(NSData *)deviceToken;

@end
