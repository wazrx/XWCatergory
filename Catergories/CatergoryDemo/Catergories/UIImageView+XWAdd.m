//
//  UIImageView+XWAdd.m
//  weather+
//
//  Created by wazrx on 16/4/14.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UIImageView+XWAdd.h"
#import <objc/runtime.h>

@implementation UIImageView (XWAdd)

+ (void)load{
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(setImage:)), class_getInstanceMethod([self class], @selector(xwAdd_setImage:)));
}

- (BOOL)imageAnimation{
    return [objc_getAssociatedObject(self, "imageAnimation") boolValue];
}

- (void)setImageAnimation:(BOOL)imageAnimation{
    objc_setAssociatedObject(self, "imageAnimation", @(imageAnimation), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)xwAdd_setImage:(NSString *)image{
    if (self.imageAnimation) {
        [UIView transitionWithView:self duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [self xwAdd_setImage:image];
        } completion:nil];
    }else{
        [self xwAdd_setImage:image];
    }
}

@end
