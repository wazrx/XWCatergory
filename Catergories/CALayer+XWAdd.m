//
//  CALayer+XWAdd.m
//  XWCurrencyExchange
//
//  Created by YouLoft_MacMini on 16/1/28.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "CALayer+XWAdd.h"

@implementation CALayer (XWAdd)

- (void)xwAdd_shakeInX{
    CAKeyframeAnimation* anim=[CAKeyframeAnimation animation];
    anim.keyPath=@"transform.translation.x";
    anim.values=@[@(5),@(-5),@(0)];
    anim.repeatCount = 1;
    anim.duration = 0.2;
    [self addAnimation:anim forKey:@"shake"];
}

@end
