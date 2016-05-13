//
//  UILabel+XWAdd.m
//  weather+
//
//  Created by wazrx on 16/4/14.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UILabel+XWAdd.h"
#import <objc/runtime.h>

@implementation UILabel (XWAdd)

+ (void)load{
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(setText:)), class_getInstanceMethod([self class], @selector(xwAdd_setText:)));
}

- (BOOL)textAnimation{
    return [objc_getAssociatedObject(self, "textAnimation") boolValue];
}

- (void)setTextAnimation:(BOOL)textAnimation{
    objc_setAssociatedObject(self, "textAnimation", @(textAnimation), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)xwAdd_setText:(NSString *)text{
    if (self.textAnimation) {
        [UIView transitionWithView:self duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [self xwAdd_setText:text];
        } completion:nil];
    }else{
        [self xwAdd_setText:text];
    }
}

@end
