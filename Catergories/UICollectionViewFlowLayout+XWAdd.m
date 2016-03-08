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

- (void)setxwAdd_fullItem:(BOOL)xwAdd_fullItem{
    objc_setAssociatedObject(self, "xwAdd_fullItem", @(xwAdd_fullItem), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)xwAdd_fullItem{
    return [objc_getAssociatedObject(self, "xwAdd_fullItem") intValue];
}

- (void)xwAdd_prepareLayout{
    if (self.xwAdd_fullItem) {
        self.itemSize = self.collectionView.bounds.size;
    }
    [self xwAdd_prepareLayout];
}

@end
