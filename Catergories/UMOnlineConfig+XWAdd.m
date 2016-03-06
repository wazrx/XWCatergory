//
//  UMOnlineConfig+XWAdd.m
//  XWCurrencyExchange
//
//  Created by YouLoft_MacMini on 16/3/3.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UMOnlineConfig+XWAdd.h"
#import "XWConst.h"

@implementation UMOnlineConfig (XWAdd)

+ (BOOL)xw_isCheckingNewVersion{
    return [[UMOnlineConfig getConfigParams:versionControlString] isEqualToString:[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]] || ![[UMOnlineConfig getConfigParams:versionControlString] boolValue];
}

@end
