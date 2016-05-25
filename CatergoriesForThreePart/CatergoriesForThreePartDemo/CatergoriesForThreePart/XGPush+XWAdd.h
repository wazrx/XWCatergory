//
//  XGPush+XWAdd.h
//  weather+
//
//  Created by wazrx on 16/4/26.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XGPush.h"

@interface XGPush (XWAdd)

/**注册信鸽服务*/
+ (void)xwAdd_registerXGPushWithID:(uint32_t)xgID key:(NSString *)xgKey launchOptions:(NSDictionary *)launchOptions;

/**注册token*/
+ (NSString *)xwAdd_registerDeviceToken:(NSData *)deviceToken;

/**注册tag*/
+ (void)xwAdd_setTag:(NSString *)tag;

/**注销tag*/
+ (void)xwAdd_deleteTag:(NSString *)tag;


+ (void)xwAdd_clearBadgeNumber;
+ (void)xwAdd_setBadgeNumber:(NSUInteger)badge;


@end
