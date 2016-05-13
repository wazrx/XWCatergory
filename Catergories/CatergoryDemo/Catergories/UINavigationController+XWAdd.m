
//
//  UINavigationController+XWAdd.m
//  叮咚(dingdong)
//
//  Created by YouLoft_MacMini on 16/1/31.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UINavigationController+XWAdd.h"
#import "UIBarButtonItem+XWAdd.h"
#import <objc/runtime.h>

@implementation UINavigationController (XWAdd)

+(void)load{
    method_exchangeImplementations(class_getInstanceMethod([UINavigationController class], @selector(pushViewController:animated:)), class_getInstanceMethod([UINavigationController class], @selector(xwAdd_pushViewController:animated:)));
}

/**如果想要手势在边缘不响应始终响应pop事件而不响应有冲突的collectionView事件，可重写collectionView的hitTest方法，进行判断*/

- (void)xwAdd_enableFullScreenGestureWithEdgeSpacing:(CGFloat)edgeSpacing{
    id target = self.interactivePopGestureRecognizer.delegate;
    SEL handleNavigationTransition = NSSelectorFromString(@"handleNavigationTransition:");
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:handleNavigationTransition];
    objc_setAssociatedObject(pan, "xwAdd_edgeSpacing", @(edgeSpacing), OBJC_ASSOCIATION_RETAIN);
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    CGFloat edgeSpacing = [objc_getAssociatedObject(gestureRecognizer, "xwAdd_edgeSpacing") floatValue];
    if (!edgeSpacing) {
        edgeSpacing = MAXFLOAT;
    }
    if (self.childViewControllers.count == 1 || [gestureRecognizer locationInView:gestureRecognizer.view].x > edgeSpacing || self.view.subviews.lastObject != self.navigationBar) {
        return NO;
    }
    return YES;
}

#pragma mark - getter methods


- (BOOL)xwAdd_hidesBottomBarWhenPushed{
    return [objc_getAssociatedObject(self, "xwAdd_hidesBottomBarWhenPushed") boolValue];
}

- (UIImage *)xwAdd_customBackImage{
    return objc_getAssociatedObject(self, "xwAdd_customBackImage");
}

- (BOOL)xwAdd_hideBottomLine{
    return [objc_getAssociatedObject(self, "xwAdd_hideBottomLine") boolValue];
}

#pragma mark - setter methods

- (void)setXwAdd_hidesBottomBarWhenPushed:(BOOL)xwAdd_hidesBottomBarWhenPushed{
    objc_setAssociatedObject(self, "xwAdd_hidesBottomBarWhenPushed", @(xwAdd_hidesBottomBarWhenPushed), OBJC_ASSOCIATION_RETAIN);
}

- (void)setXwAdd_customBackImage:(UIImage *)xwAdd_customBackImage{
    objc_setAssociatedObject(self, "xwAdd_customBackImage", xwAdd_customBackImage, OBJC_ASSOCIATION_RETAIN);
}

- (void)setXwAdd_hideBottomLine:(BOOL)xwAdd_hideBottomLine{
    objc_setAssociatedObject(self, "xwAdd_hideBottomLine", @(xwAdd_hideBottomLine), OBJC_ASSOCIATION_ASSIGN);
    if (xwAdd_hideBottomLine) {
        [self xwp_findHairlineImageViewUnder:self.navigationBar].hidden = YES;
    }
}

#pragma mark - exchange methods


- (void)xwAdd_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.xwAdd_hidesBottomBarWhenPushed && self.viewControllers.count == 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    UIImage *backImage = objc_getAssociatedObject(self, "xwAdd_customBackImage");
    if (backImage && self.viewControllers.count > 0) {
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStyleDone target:self action:@selector(xwp_back)];
        viewController.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    }
    [self xwAdd_pushViewController:viewController animated:animated];
}

#pragma mark - private methods

- (void)xwp_back{
    [self popViewControllerAnimated:YES];
}



- (UIImageView *)xwp_findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self xwp_findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

@end
