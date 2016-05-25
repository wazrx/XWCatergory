//
//  UIView+XWAddForFrame.m
//  CatergoryDemo
//
//  Created by wazrx on 16/5/25.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UIView+XWAddForFrame.h"
#import "NSObject+XWAdd.h"


@implementation UIView (XWAddForFrame)


- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    if (self.x == x) return;
    [self xwAdd_setAssociateValue:@(x) withKey:@"x"];
    NSNumber *right = [self xwAdd_getAssociatedValueForKey:@"right"];
    NSNumber *width = [self xwAdd_getAssociatedValueForKey:@"width"];
    NSNumber *centerX = [self xwAdd_getAssociatedValueForKey:@"centerX"];
    CGRect frame = self.frame;
    if ((right && !width && !centerX) || (centerX && !width && !right)) {
        frame.size.width = right.floatValue - x;
    }
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    if (self.right == right) return;
    [self xwAdd_setAssociateValue:@(right) withKey:@"right"];
    NSNumber *x = [self xwAdd_getAssociatedValueForKey:@"x"];
    NSNumber *width = [self xwAdd_getAssociatedValueForKey:@"width"];
    NSNumber *centerX = [self xwAdd_getAssociatedValueForKey:@"centerX"];
    CGRect frame = self.frame;
    if (centerX && !width && !x){
        frame.size.width = (right - centerX.floatValue) * 2.0f;
    }else if (x && !width && !centerX){
        frame.size.width = right - x.floatValue;
    }
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    if (self.width == width) return;
    [self xwAdd_setAssociateValue:@(width) withKey:@"width"];
    NSNumber *x = [self xwAdd_getAssociatedValueForKey:@"x"];
    NSNumber *right = [self xwAdd_getAssociatedValueForKey:@"right"];
    NSNumber *centerX = [self xwAdd_getAssociatedValueForKey:@"centerX"];
    CGRect frame = self.frame;
    if (!x && !right && centerX) {
        frame.origin.x = centerX.floatValue - width / 2.0f;
    }else if (!x && !centerX && right){
        frame.origin.x = right.floatValue - width;
    }
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    if (self.centerX == centerX) return;
    [self xwAdd_setAssociateValue:@(centerX) withKey:@"centerX"];
    NSNumber *x = [self xwAdd_getAssociatedValueForKey:@"x"];
    NSNumber *right = [self xwAdd_getAssociatedValueForKey:@"right"];
    NSNumber *width = [self xwAdd_getAssociatedValueForKey:@"width"];
    CGRect frame = self.frame;
    if (right && !x && !width) {
        frame.size.width = (right.floatValue - centerX) * 2.0f;
    }else if (x && !right && !width){
        frame.size.width = (centerX - x.floatValue) * 2.0f;
    }
    self.frame = frame;
    self.center = CGPointMake(centerX, self.center.y);
    
}



- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    if (self.y == y) return;
    [self xwAdd_setAssociateValue:@(y) withKey:@"y"];
    NSNumber *bottom = [self xwAdd_getAssociatedValueForKey:@"bottom"];
    NSNumber *height = [self xwAdd_getAssociatedValueForKey:@"height"];
    NSNumber *centerY = [self xwAdd_getAssociatedValueForKey:@"centerY"];
    CGRect frame = self.frame;
    if ((bottom && !height && !centerY) || (centerY && !height && !bottom)) {
        frame.size.height = bottom.floatValue - y;
    }
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    if (self.bottom == bottom) return;
    [self xwAdd_setAssociateValue:@(bottom) withKey:@"bottom"];
    NSNumber *y = [self xwAdd_getAssociatedValueForKey:@"y"];
    NSNumber *height = [self xwAdd_getAssociatedValueForKey:@"height"];
    NSNumber *centerY = [self xwAdd_getAssociatedValueForKey:@"centerY"];
    CGRect frame = self.frame;
    if (centerY && !height && !y){
        frame.size.height = (bottom - centerY.floatValue) * 2.0f;
    }else if (y && !height && !centerY){
        frame.size.height = bottom - y.floatValue;
    }
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    if (self.height == height) return;
    [self xwAdd_setAssociateValue:@(height) withKey:@"height"];
    NSNumber *y = [self xwAdd_getAssociatedValueForKey:@"y"];
    NSNumber *bottom = [self xwAdd_getAssociatedValueForKey:@"bottom"];
    NSNumber *centerY = [self xwAdd_getAssociatedValueForKey:@"centerY"];
    CGRect frame = self.frame;
    if (!y && !bottom && centerY) {
        frame.origin.y = centerY.floatValue - height / 2.0f;
    }else if (!y && !centerY && bottom){
        frame.origin.y = bottom.floatValue - height;
    }
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    if (self.centerY == centerY) return;
    [self xwAdd_setAssociateValue:@(centerY) withKey:@"centerY"];
    NSNumber *y = [self xwAdd_getAssociatedValueForKey:@"y"];
    NSNumber *bottom = [self xwAdd_getAssociatedValueForKey:@"bottom"];
    NSNumber *height = [self xwAdd_getAssociatedValueForKey:@"height"];
    CGRect frame = self.frame;
    if (bottom && !y && !height) {
        frame.size.height = (bottom.floatValue - centerY) * 2.0f;
    }else if (y && !bottom && !height){
        frame.size.height = (centerY - y.floatValue) * 2.0f;
    }
    self.frame = frame;
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)rightFromSuperView{
    if (!self.superview) return 0;
    return self.superview.width - self.right;
}

- (void)setRightFromSuperView:(CGFloat)rightFromSuperView{
    if (!self.superview) return;
    self.y = self.superview.width - self.width - rightFromSuperView;
}

- (CGFloat)bottomFromSuperView{
    if (!self.superview) return 0;
    return self.superview.height - self.bottom;
}

- (void)setBottomFromSuperView:(CGFloat)bottomFromSuperView{
    if (!self.superview) return;
    self.y = self.superview.height - self.height - bottomFromSuperView;
}



- (void)xwAdd_set:(XWViewAttribute)attr withView:(UIView *)otherView attr:(XWViewAttribute)otherAttr offset:(CGFloat)offset {
    CGFloat value = [self _xwAdd_getValueInView:otherView attr:otherAttr];
    [self _xwAdd_setValue:value withAttr:attr offset:offset];
}

- (CGFloat)_xwAdd_getValueInView:(UIView *)view attr:(XWViewAttribute)attr{
    switch (attr) {
        case XWViewLeft: {
            return view.x;
        }
        case XWViewRight: {
            return view.right;
        }
        case XWViewTop: {
            return view.y;
        }
        case XWViewBottom: {
            return view.bottom;
        }
        case XWViewCenterX: {
            return view.centerX;
        }
        case XWViewCenterY: {
            return view.centerY;
        }
        case XWViewWidth: {
            return view.width;
        }
        case XWViewHeight: {
            return view.height;
        }
    }
}

- (void)_xwAdd_setValue:(CGFloat)value withAttr:(XWViewAttribute)attr offset:(CGFloat)offset{
    switch (attr) {
        case XWViewLeft: {
            self.x = value + offset;
            break;
        }
        case XWViewRight: {
            self.right = value + offset;
            break;
        }
        case XWViewTop: {
            self.y = value + offset;
            break;
        }
        case XWViewBottom: {
            self.bottom = value + offset;
            break;
        }
        case XWViewCenterX: {
            self.centerX = value + offset;
            break;
        }
        case XWViewCenterY: {
            self.centerY = value + offset;
            break;
        }
        case XWViewWidth: {
            self.width = value + offset;
            break;
        }
        case XWViewHeight: {
            self.height = value + offset;
            break;
        }
    }
}
@end
