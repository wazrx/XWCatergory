//
//  UIResponder+XGPush.m
//  XWCurrencyExchange
//
//  Created by YouLoft_MacMini on 16/2/22.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UIResponder+XGPush.h"
#import "XGPush.h"

#define XGPushID 2200172616
#define XGPushKey @"I479NY7C9XGQ"

@implementation UIResponder (XGPush)

- (void)xw_registerXGPushWithLaunchOptions:(NSDictionary *)launchOptions{
    //注册信鸽APPKEY
    [XGPush startApp:XGPushID appKey:XGPushKey];
    //注册远程推送
    [XGPush initForReregister:^{
        if (![XGPush isUnRegisterStatus]) {
            [self xwp_registerPushService];
        }
    }];
    //处理推送回调
    [XGPush handleLaunching:launchOptions];
}

- (NSString *)xw_registerDeviceToken:(NSData *)deviceToken{
    return  [XGPush registerDevice:deviceToken];
}

- (void)xwp_registerPushService{
    
    float sysVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    if(sysVer < 8){
        [self xwp_registerPush];
    }
    else{
        [self xwp_registerPushForIOS8];
    }
}

- (void)xwp_registerPush{
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
}

- (void)xwp_registerPushForIOS8{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= _IPHONE80_
    
    //Types
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    //Actions
    UIMutableUserNotificationAction *acceptAction = [[UIMutableUserNotificationAction alloc] init];
    
    acceptAction.identifier = @"ACCEPT_IDENTIFIER";
    acceptAction.title = @"Accept";
    
    acceptAction.activationMode = UIUserNotificationActivationModeForeground;
    acceptAction.destructive = NO;
    acceptAction.authenticationRequired = NO;
    
    //Categories
    UIMutableUserNotificationCategory *inviteCategory = [[UIMutableUserNotificationCategory alloc] init];
    
    inviteCategory.identifier = @"INVITE_CATEGORY";
    
    [inviteCategory setActions:@[acceptAction] forContext:UIUserNotificationActionContextDefault];
    
    [inviteCategory setActions:@[acceptAction] forContext:UIUserNotificationActionContextMinimal];
    
    NSSet *categories = [NSSet setWithObjects:inviteCategory, nil];
    
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
#endif
}


@end
