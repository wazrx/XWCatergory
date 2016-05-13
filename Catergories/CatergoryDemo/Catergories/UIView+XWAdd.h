//
//  UIView+XWAdd.h
//  RedEnvelopes
//
//  Created by YouLoft_MacMini on 16/3/9.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^XWAddViewBlock)(CGRect frame);
typedef void(^XWAddhitTestBlock)();

@interface UIView (XWAdd)
/**触摸屏幕时先结束编辑*/
@property (nonatomic, assign) BOOL xwAdd_endEditingBeforTouch;

@property (nonatomic, copy) XWAddhitTestBlock xwAdd_hitTestBlock;

+ (instancetype)xwAdd_tempViewForFrameWithBlock:(XWAddViewBlock)block;

@end
