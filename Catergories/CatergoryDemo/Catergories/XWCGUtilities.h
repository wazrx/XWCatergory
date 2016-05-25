//
//  XWCGUtilities.h
//  CatergoryDemo
//
//  Created by wazrx on 16/5/16.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static inline CGFloat DegreesToRadians(CGFloat degrees){
    return degrees * M_PI / 180;
}

static inline CGFloat RadiansToDegrees(CGFloat radians){
    return radians * 180 / M_PI;
}

NS_ASSUME_NONNULL_END