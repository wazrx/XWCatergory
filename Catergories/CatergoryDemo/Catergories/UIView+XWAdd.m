//
//  UIView+XWAdd.m
//  RedEnvelopes
//
//  Created by YouLoft_MacMini on 16/3/9.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UIView+XWAdd.h"
#import <objc/runtime.h>

@implementation UIView (XWAdd)

+ (void)load{
//    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(layoutSublayersOfLayer:)), class_getInstanceMethod([self class], @selector(xwp_layoutSublayersOfLayer:)));
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(hitTest:withEvent:)), class_getInstanceMethod([self class], @selector(xwp_hitTest:withEvent:)));
}

#pragma mark - setter methods

- (void)setXwAdd_endEditingBeforTouch:(BOOL)xwAdd_endEditingBeforTouch{
    objc_setAssociatedObject(self, "xwAdd_endEditingBeforTouch", @(xwAdd_endEditingBeforTouch), OBJC_ASSOCIATION_RETAIN);
}

- (void)setXwAdd_hitTestBlock:(XWAddhitTestBlock)xwAdd_hitTestBlock{
    objc_setAssociatedObject(self, "xwAdd_hitTestBlock", xwAdd_hitTestBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - getter methods

- (BOOL)xwAdd_endEditingBeforTouch{
    return [objc_getAssociatedObject(self, "xwAdd_endEditingBeforTouch") boolValue];
}

- (XWAddhitTestBlock)xwAdd_hitTestBlock{
    return objc_getAssociatedObject(self, "xwAdd_hitTestBlock");
}


#pragma mark - public methods

+ (instancetype)xwAdd_tempViewForFrameWithBlock:(XWAddViewBlock)block{
    UIView *view = [self new];
    objc_setAssociatedObject(view.layer, "XWAddViewBlock", block, OBJC_ASSOCIATION_COPY);
    return view;
}

#pragma mark - overWrite methods

- (void)xwp_layoutSublayersOfLayer:(CALayer *)layer{
    [self xwp_layoutSublayersOfLayer:layer];
    XWAddViewBlock block = objc_getAssociatedObject(layer, "XWAddViewBlock");
    if (block) {
        block(self.frame);
        block = nil;
        objc_removeAssociatedObjects(layer);
        [self removeFromSuperview];
    }
}

- (UIView *)xwp_hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [self xwp_hitTest:point withEvent:event];
    if (self.xwAdd_hitTestBlock) {
        self.xwAdd_hitTestBlock();
    }
    if (self.xwAdd_endEditingBeforTouch) {
        if ([view isKindOfClass:[UITextField class]] || [view isKindOfClass:[UITextView class]]) {
            return view;
        }else{
            [self endEditing:YES];
            return view;
        }
    }else{
        return view;
    }
}

@end
