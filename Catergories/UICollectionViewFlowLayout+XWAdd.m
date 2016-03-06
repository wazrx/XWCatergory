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
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(prepareLayout)), class_getInstanceMethod([self class], @selector(xw_prepareLayout)));
}

- (void)setXw_fullItem:(BOOL)xw_fullItem{
    objc_setAssociatedObject(self, "xw_fullItem", @(xw_fullItem), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)xw_fullItem{
    return [objc_getAssociatedObject(self, "xw_fullItem") intValue];
}

- (void)xw_prepareLayout{
    if (self.xw_fullItem) {
        self.itemSize = self.collectionView.bounds.size;
    }
    [self xw_prepareLayout];
}

@end
