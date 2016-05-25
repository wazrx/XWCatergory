//
//  JSPatch+XWAdd.m
//  weather+
//
//  Created by wazrx on 16/4/26.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "JSPatch+XWAdd.h"

@implementation JSPatch (XWAdd)

+ (void)xwAdd_registerJSpatch:(NSString *)appKey {
    [self startWithAppKey:appKey];
    [self sync];
}
@end
