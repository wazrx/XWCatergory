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

@property (nonatomic,readonly) NSString *idfa;

@property (nonatomic,readonly) NSString *uuid;

@property (nonatomic, readonly) BOOL isPad;

@property (nonatomic, readonly) BOOL hasCamera;

@property (nonatomic, readonly) BOOL canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");

@property (nonatomic, readonly) NSUInteger cpuNumber;

//"iPhone9,2"
@property (nonatomic, readonly) NSString *modelInfo;

//"iPhone 5s"
@property (nonatomic, readonly) NSString *modelInfoName;

//@"192.168.1.111"
@property (nonatomic, readonly) NSString *ipAddressWIFI;

//@"10.2.2.222"
@property (nonatomic, readonly) NSString *ipAddressCell;

@property (nonatomic, readonly) int64_t diskSpace;

@property (nonatomic, readonly) int64_t diskSpaceFree;

@property (nonatomic, readonly) int64_t diskSpaceUsed;

@property (nonatomic, readonly) int64_t memoryTotal;

+ (NSDictionary *)xw_getAllDeviceInfo;

+ (BOOL)xwAdd_isAllowedNotification;

+ (BOOL)xwAdd_isAllowedLocation;

/**7.0/8.0*/
+ (CGFloat)xwAdd_getCurrentSystemVersion;

/**1.0.0*/
+ (NSString *)xwAdd_getAppVersion;

+ (void)xwAdd_openSystemNotificationSettingPageWithCompleteHandle:(uideviceBlock)completeBlock;

+ (void)xwAdd_openSystemAddressSettingPage;

+ (NSString *)xwAdd_getModelInfo;

+ (NSString *)xwAdd_getIPAddress;

+ (NSString *)xwAdd_getIdfaString;

+ (NSString *)xwAdd_getMoblieOperatorName;

@end
