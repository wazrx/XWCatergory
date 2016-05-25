//
//  XGPush+XWAdd.m
//  weather+
//
//  Created by wazrx on 16/4/26.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XGPush+XWAdd.h"

@implementation XGPush (XWAdd)

+ (void)xwAdd_registerXGPushWithID:(uint32_t)xgID key:(NSString *)xgKey launchOptions:(NSDictionary *)launchOptions {
    //注册信鸽APPKEY
    [XGPush startApp:xgID appKey:xgKey];
    //注册远程推送
    [XGPush initForReregister:^{
        if (![XGPush isUnRegisterStatus]) {
            [self xwp_registerPushService];
        }
    }];
    //处理推送回调
    [XGPush handleLaunching:launchOptions];
    
}

+ (NSString *)xwAdd_registerDeviceToken:(NSData *)deviceToken{
    return  [XGPush registerDevice:deviceToken];
}

+ (void)xwAdd_setTag:(NSString *)tag{
    [self setTag:tag successCallback:^{
        NSLog(@"注册tag：%@成功", tag);
    } errorCallback:^{
        NSLog(@"注册tag：%@失败", tag);
    }];
}

+ (void)xwAdd_deleteTag:(NSString *)tag{
    [self delTag:tag];
}

+ (void)xwp_registerPushService{
    
    float sysVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    if(sysVer < 8){
        [self xwp_registerPush];
    }
    else{
        [self xwp_registerPushForIOS8];
    }
}

+ (void)xwp_registerPush{
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
}

+ (void)xwp_registerPushForIOS8{
    
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

+ (void)xwAdd_clearBadgeNumber {
    [self xwAdd_setBadgeNumber:0];
}

+ (void)xwAdd_setBadgeNumber:(NSUInteger)badge{
    [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
}

@end
