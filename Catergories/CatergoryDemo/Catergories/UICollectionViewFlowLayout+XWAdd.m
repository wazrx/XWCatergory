//
//  UICollectionViewFlowLayout+XWAdd.m
//  XWCurrencyExchange
//
//  Created by wazrx on 16/3/6.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UICollectionViewFlowLayout+XWAdd.h"
#import <objc/runtime.h>

@implementation UICollectionViewFlowLayout (XWAdd)

+(void)load{
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(prepareLayout)), class_getInstanceMethod([self class], @selector(xwAdd_prepareLayout)));
}

- (void)setXwAdd_fullItem:(BOOL)xwAdd_fullItem{
    objc_setAssociatedObject(self, "xwAdd_fullItem", @(xwAdd_fullItem), OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)xwAdd_fullItem{
    BOOL test = [objc_getAssociatedObject(self, "xwAdd_fullItem") boolValue];
    return test;
}

- (void)xwAdd_prepareLayout{
    [self xwAdd_prepareLayout];
    if (self.xwAdd_fullItem) {
        self.itemSize = self.collectionView.bounds.size;
    }
}

@end
