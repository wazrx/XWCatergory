//
//  SDWebImageManager+XWAdd.m
//  CatergoriesForThreePartDemo
//
//  Created by wazrx on 16/5/23.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "SDWebImageManager+XWAdd.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIButton+WebCache.h>
#import <SDWebImage/UIImage+GIF.h>

@implementation SDWebImageManager (XWAdd)


+ (void)xwAdd_downloadImageWithURL:(NSString *)urlStr completeConfig:(void(^)(UIImage * image))completeConfig {
	[[self sharedManager] downloadImageWithURL:[NSURL URLWithString:urlStr] options:SDWebImageRetryFailed | SDWebImageLowPriority progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (image && completeConfig) {
            completeConfig(image);
        }
    }];
}

+ (void)xwAdd_setImageForImageView:(UIImageView *)imgView URL:(NSString *)urlStr placeholderImage:(UIImage *)placeHolderImage{
    [imgView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:placeHolderImage completed:nil];
}

+ (void)xwAdd_setImageForButton:(UIButton *)button URL:(NSString *)urlStr state:(UIControlState)state placeholderImage:(UIImage *)placeHolderImage{
    [button sd_setImageWithURL:[NSURL URLWithString:urlStr] forState:state placeholderImage:placeHolderImage completed:nil];
}

+ (void)xwAdd_setBackGroundImageForButton:(UIButton *)button URL:(NSString *)urlStr state:(UIControlState)state placeholderImage:(UIImage *)placeHolderImage{
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:state placeholderImage:placeHolderImage completed:nil];
}

+ (void)xwAdd_setMaxCacheSize:(CGFloat)maxSize{
    [self sharedManager].imageCache.maxCacheSize = maxSize;
}

+ (void)xwAdd_setMaxCacheAge:(CGFloat)age{
    [self sharedManager].imageCache.maxCacheAge = age;
}

+ (void)xwAdd_setMaxMemoryCountLimit:(CGFloat)count{
    [self sharedManager].imageCache.maxMemoryCountLimit = count;
}

+ (void)xwAdd_setMaxMemoryCost:(CGFloat)cost{
    [self sharedManager].imageCache.maxMemoryCost = cost;
}

+ (void)xwAdd_clearDisk{
    [[self sharedManager].imageCache clearDisk];
}

+ (void)xwAdd_clearMemory{
    [[self sharedManager].imageCache clearMemory];
}

+ (void)xwAdd_cancelAllTask{
    [[self sharedManager] cancelAll];
}

+ (void)xwAdd_receiveMemoryWarning{
    [self xwAdd_cancelAllTask];
    [self xwAdd_clearMemory];
    [self xwAdd_clearDisk];
}

+ (UIImage *)xwAdd_returnGifWithLocalGif:(NSString *)LocalGifName{
    return [UIImage sd_animatedGIFNamed:LocalGifName];
}

@end
