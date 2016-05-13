//
//  NSDictionary+XWAdd.h
//  CatergoryDemo
//
//  Created by wazrx on 16/5/13.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (XWAdd)

- (BOOL)xwAdd_containsObjectForKey:(id)key;
- (NSString *)xwAdd_jsonStringEncoded;
- (NSString *)xwAdd_jsonPrettyStringEncoded;
/**根据keys数组返回对应的字典*/
- (NSDictionary *)xwAdd_entriesForKeys:(NSArray *)keys;

@end

NS_ASSUME_NONNULL_END