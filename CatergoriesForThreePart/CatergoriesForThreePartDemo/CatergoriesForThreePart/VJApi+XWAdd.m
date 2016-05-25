//
//  VJApi+XWAdd.m
//  RedEnvelopes
//
//  Created by wazrx on 16/5/11.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "VJApi+XWAdd.h"
#import "WXApi.h"
#import <VJia/VJWXApiManager.h>
#import <objc/runtime.h>

static int sizeCount = 10;

@implementation VJApi (XWAdd)

+ (void)xwAdd_registerApp:(NSString *)appKey{
    [[VJApi shareManager] registerApp:appKey userid:@"" completionHandler:^(VJCode code,NSError *err) {
        //此处返回 appId 的相关信息,code==VJ_APPID_INVALID 广告位无效,code==VJ_SUCCESS 广告位有效
        objc_setAssociatedObject(self, "registerSuceessed", @(code == VJ_SUCCESS), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }];
}

+ (void)xwAdd_loadVPlusDataWithCount:(int)count ArrayWithBlock:(VJDataBlock)block{
    BOOL registerSuceessed = objc_getAssociatedObject(self, "registerSuceessed");
    if (!registerSuceessed) {
        block(nil);
    }
    [[VJApi shareManager] loadData:count size:sizeCount completionHandler:^(NSArray *arr, BOOL hasNext, NSString *unit, NSError *error) {
        if (arr.count) {
            block(arr);
        }else{
            block(nil);
        }
    }];
}

+ (void)xwAdd_sharedToWeiXinWithAdID:(NSString *)adID{
    [[VJApi shareManager] shared:adID type:VJ_WX_Timeline completionHandler:^(VJCode code, NSError *err) {
        NSLog(@"分享ID = %zd", code);
    }];
}

+ (BOOL)xwAdd_handleOpenURL:(NSURL *)url{
    return [WXApi handleOpenURL:url delegate:[VJWXApiManager sharedManager]];
}

@end
