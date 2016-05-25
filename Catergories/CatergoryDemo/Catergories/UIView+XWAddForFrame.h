//
//  UIView+XWAddForFrame.h
//  CatergoryDemo
//
//  Created by wazrx on 16/5/25.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XWViewAttribute){
    XWViewLeft,
    XWViewRight,
    XWViewTop,
    XWViewBottom,
    XWViewCenterX,
    XWViewCenterY,
//    XWViewCenter,
//    XWViewSize,
    XWViewWidth,
    XWViewHeight,
};

@interface UIView (XWAddForFrame)


#pragma mark - fast property

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGFloat bottomFromSuperView;
@property (nonatomic, assign) CGFloat rightFromSuperView;

- (void)xwAdd_set:(XWViewAttribute)attr withView:(UIView *)otherView attr:(XWViewAttribute)otherAttr offset:(CGFloat)offset;

@end
