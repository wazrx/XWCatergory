//
//  NSString+XWAdd.m
//  XWCurrencyExchange
//
//  Created by YouLoft_MacMini on 16/1/27.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "NSString+XWAdd.h"

@implementation NSString (XWAdd)

- (CGSize)xwAdd_sizeWithfont:(UIFont *)font maxSize:(CGSize)maxSize{
    
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)xwAdd_sizeWithAttrs:(NSDictionary *)attrs maxSize:(CGSize)maxSize{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (NSString *)xwAdd_insertCommaFornumberString{
    
    NSString *new = [[self componentsSeparatedByString:@","] componentsJoinedByString:@""];
    NSUInteger pointIndex = [new rangeOfString:@"."].location == NSNotFound ? new.length : [new rangeOfString:@"."].location;
    NSString *temp = [new substringToIndex:pointIndex];
    NSMutableString *reslutStr = [NSMutableString stringWithString:new];
    int i = 1;
    while (temp.length > 3) {
        [reslutStr insertString:@"," atIndex:(pointIndex - 3 * i)];
        temp = [reslutStr substringToIndex:(pointIndex - 3 * i)];
        i++;
    }
    return reslutStr.copy;
}

- (float)xwAdd_deleteCommaFornumberValue{
    NSMutableString *temp = [NSMutableString stringWithString:self];
    [temp replaceOccurrencesOfString:@"," withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, temp.length)];
    return [temp floatValue];
}

/**
 *  时间戳转时间字符串
 */
+ (NSString *)xwAdd_stringWithTimestamp:(NSString *)timestamp format:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    formatter.dateFormat = format;//@"yyyy-MM-dd HH:mm"
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    NSDate *date = [confromTimesp dateByAddingTimeInterval:480 * 60];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

@end
