//
//  MobClick+XWAdd.h
//  RedEnvelopes
//
//  Created by wazrx on 16/5/16.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "MobClick.h"

@interface MobClick (XWAdd)

+ (void)xwAdd_registerWithUMKey:(NSString *)key channelId:(NSString *)cid;

/**增加一次某id的统计*/
+(void)xwAdd_eventID:(NSString *)eid;

@end
