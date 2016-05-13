//
//  NSArray+XWAdd.h
//  CatergoryDemo
//
//  Created by wazrx on 16/5/13.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (XWAdd)

- (id)xwAdd_randomObject;

/**objectAtIndex的防止越界的版本，越界返回nil*/
- (id)xwAdd_objectOrNilAtIndex:(NSUInteger)index;


- (NSString *)xwAdd_jsonStringEncoded;
- (NSString *)xwAdd_jsonPrettyStringEncoded;


@end

NS_ASSUME_NONNULL_END
