//
//  SDWebImageManager+XWAdd.h
//  CatergoriesForThreePartDemo
//
//  Created by wazrx on 16/5/23.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <SDWebImage/SDWebImageManager.h>

typedef void(^XWSDWebImageConfig)(UIImage *image);

@interface SDWebImageManager (XWAdd)

+ (void)xwAdd_downloadImageWithURL:(NSString *)urlStr completeConfig:(void(^)(UIImage * image))completeConfig;

+ (void)xwAdd_setImageForImageView:(UIImageView *)imgView URL:(NSString *)urlStr placeholderImage:(UIImage *)placeHolderImage;

+ (void)xwAdd_setImageForButton:(UIButton *)button URL:(NSString *)urlStr state:(UIControlState)state placeholderImage:(UIImage *)placeHolderImage;

+ (void)xwAdd_setBackGroundImageForButton:(UIButton *)button URL:(NSString *)urlStr state:(UIControlState)state placeholderImage:(UIImage *)placeHolderImage;

+ (void)xwAdd_setMaxCacheSize:(CGFloat)maxSize;

+ (void)xwAdd_setMaxCacheAge:(CGFloat)age;

+ (void)xwAdd_setMaxMemoryCountLimit:(CGFloat)count;

+ (void)xwAdd_setMaxMemoryCost:(CGFloat)cost;

+ (void)xwAdd_clearDisk;

+ (void)xwAdd_clearMemory;

+ (void)xwAdd_cancelAllTask;

+ (void)xwAdd_receiveMemoryWarning;

@end
