//
//  VJApi+XWAdd.h
//  RedEnvelopes
//
//  Created by wazrx on 16/5/11.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <VJia/VJApi.h>

typedef void(^VJDataBlock)(NSArray *dataArray);


@interface VJApi (XWAdd)

+ (void)xwAdd_registerApp:(NSString *)appKey;

+ (void)xwAdd_loadVPlusDataWithCount:(int)count ArrayWithBlock:(VJDataBlock)block;

+ (void)xwAdd_sharedToWeiXinWithAdID:(NSString *)adID;

+ (BOOL)xwAdd_handleOpenURL:(NSURL *)url;

@end
