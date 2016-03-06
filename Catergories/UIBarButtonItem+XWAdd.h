//
//  UIBarButtonItem+XWAdd.h
//  WxSelected
//
//  Created by wazrx on 15/12/20.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XWAdd)


+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

@end
