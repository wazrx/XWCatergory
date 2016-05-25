//
//  UIScreen+XWAdd.h
//  CatergoryDemo
//
//  Created by wazrx on 16/5/17.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (XWAdd)

/**等同于 [UIScreen mainScreen].bounds*/
+ (CGFloat)xwAdd_screenScale;

/**获取不同方向的屏幕rect*/
- (CGRect)xwAdd_boundsForOrientation:(UIInterfaceOrientation)orientation;
@end
