//
//  NSString+XWAdd.h
//  XWCurrencyExchange
//
//  Created by YouLoft_MacMini on 16/1/27.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (XWAdd)

/**
 *  根据字符串返回自适应的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大限制尺寸
 *
 *  @return 自适应后的尺寸
 */
- (CGSize)xwAdd_sizeWithfont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  根据字符串返回自适应的尺寸,用于计算属性字符串
 *
 *  @param attrs   属性
 *  @param maxSize 最大限制尺寸
 *
 *  @return 自适应后的尺寸
 */

- (CGSize)xwAdd_sizeWithAttrs:(NSDictionary *)attrs maxSize:(CGSize)maxSize;

/**
 *  给数字string添加逗号分隔符，自身带有逗号也没有关系，会自动处理,比如1234.5->1,234.5
 */
- (NSString *)xwAdd_insertCommaFornumberString;

/**
 *  删除逗号，返回float值
 */
- (float)xwAdd_deleteCommaFornumberValue;
/**
 *  时间戳转时间
 */
+ (NSString *)xwAdd_stringWithTimestamp:(NSString *)timestamp format:(NSString *)format;

@end
