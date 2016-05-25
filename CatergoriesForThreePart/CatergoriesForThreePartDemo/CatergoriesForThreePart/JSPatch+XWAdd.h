//
//  JSPatch+XWAdd.h
//  weather+
//
//  Created by wazrx on 16/4/26.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <JSPatch/JSPatch.h>

@interface JSPatch (XWAdd)

/**
 *  注册JSPatch
 */
+ (void)xwAdd_registerJSpatch:(NSString *)appKey;

@end
