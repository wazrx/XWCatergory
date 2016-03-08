

//
//  UINavigationController+XWAdd.m
//  叮咚(dingdong)
//
//  Created by YouLoft_MacMini on 16/1/31.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UINavigationController+XWAdd.h"
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
    objc_setAssociatedObject(pan, "xwAdd_edgeSpacing", @(edgeSpacing), OBJC_ASSOCIATION_ASSIGN);
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
    if (self.childViewControllers.count == 1 || [gestureRecognizer locationInView:gestureRecognizer.view].x > edgeSpacing) {
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

#pragma mark - setter methods

- (void)setxwAdd_hidesBottomBarWhenPushed:(BOOL)xwAdd_hidesBottomBarWhenPushed{
    objc_setAssociatedObject(self, "xwAdd_hidesBottomBarWhenPushed", @(xwAdd_hidesBottomBarWhenPushed), OBJC_ASSOCIATION_ASSIGN);
}

- (void)setxwAdd_customBackImage:(UIImage *)xwAdd_customBackImage{
    objc_setAssociatedObject(self, "xwAdd_customBackImage", xwAdd_customBackImage, OBJC_ASSOCIATION_RETAIN);
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

@end
