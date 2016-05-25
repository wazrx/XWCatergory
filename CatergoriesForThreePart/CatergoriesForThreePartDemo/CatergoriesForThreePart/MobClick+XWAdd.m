//
//  MobClick+XWAdd.m
//  RedEnvelopes
//
//  Created by wazrx on 16/5/16.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "MobClick+XWAdd.h"

@implementation MobClick (XWAdd)

+ (void)xwAdd_registerWithUMKey:(NSString *)key channelId:(NSString *)cid {
    cid = cid ?: @"App Store";
    [MobClick startWithAppkey:key reportPolicy:BATCH channelId:cid];
}

+(void)xwAdd_eventID:(NSString *)eid {
    [MobClick event:eid];
}
@end
