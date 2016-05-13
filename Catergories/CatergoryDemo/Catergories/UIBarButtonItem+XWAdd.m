//
//  UIBarButtonItem+XWAdd.m
//  WxSelected
//
//  Created by wazrx on 15/12/20.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import "UIBarButtonItem+XWAdd.h"

@implementation UIBarButtonItem (XWAdd)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    UIImage *img = [UIImage imageNamed:image];
    [btn setImage:img forState:UIControlStateNormal];
    if (highImage) {
        [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    // 设置尺寸
    btn.bounds = CGRectMake(0, 0, 21 / img.size.height * img.size.width + 24, 21);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 24, 0, 0);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
