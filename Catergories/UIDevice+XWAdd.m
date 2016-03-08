//
//  UIDevice+XWAdd.m
//  XWCurrencyExchange
//
//  Created by YouLoft_MacMini on 16/2/25.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UIDevice+XWAdd.h"

static uideviceBlock notificationSettingCompleteBlock;

@implementation UIDevice (XWAdd)

+ (BOOL)xwAdd_isAllowedNotification{
    if ([self xwAdd_getCurrentSystemVersion] >= 8.0) {
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (UIUserNotificationTypeNone != setting.types) {
            return YES;
        }
    }else{
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        if (UIRemoteNotificationTypeNone != type) {
            return YES;
        }
    }
    return NO;
}

+ (CGFloat)xwAdd_getCurrentSystemVersion{
    return [[UIDevice currentDevice].systemVersion doubleValue];
}

+ (void)xwAdd_openSystemNotificationSettingPageWithCompleteHandle:(uideviceBlock)completeBlock{
    notificationSettingCompleteBlock = completeBlock;
    if ([self xwAdd_getCurrentSystemVersion] >= 8.0 ) {
        NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if([[UIApplication sharedApplication] canOpenURL:url]){
            [[UIApplication sharedApplication] openURL:url];
        }
    }else{
        NSURL*url=[NSURL URLWithString:@"prefs:root=NOTIFICATIONS_ID"];
        [[UIApplication sharedApplication] openURL:url];
    }
    if (completeBlock) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xwp_setNotifcationAllowed) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
}

+ (void)xwp_setNotifcationAllowed{
    if (notificationSettingCompleteBlock) {
        notificationSettingCompleteBlock ([self xwAdd_isAllowedNotification]);
    }
    notificationSettingCompleteBlock = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
