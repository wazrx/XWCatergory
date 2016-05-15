//
//  UIColor+XWAdd.h
//  WxSelected
//
//  Created by YouLoft_MacMini on 15/12/18.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (XWAdd)

#pragma mark - fast property (快速获取颜色信息)

@property (nonatomic, readonly) CGFloat red;
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;
@property (nonatomic, readonly) CGFloat hue;
/**饱和度*/
@property (nonatomic, readonly) CGFloat saturation;
@property (nonatomic, readonly) CGFloat brightness;
@property (nonatomic, readonly) CGFloat alpha;
@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;
@property (nonatomic, readonly) uint32_t rgbValue;
@property (nonatomic, readonly) uint32_t rgbaValue;
@property (nonatomic, readonly) NSString *hexString;
@property (nonatomic, readonly) NSString *hexStringWithAlpha;

#pragma mark - color initailize (颜色初始化相关)

/**Color With HSL*/
+ (UIColor *)xwAdd_colorWithHue:(CGFloat)hue
               saturation:(CGFloat)saturation
                lightness:(CGFloat)lightness
                    alpha:(CGFloat)alpha;


/**Color With CMYB*/
+ (UIColor *)xwAdd_colorWithCyan:(CGFloat)cyan
                   magenta:(CGFloat)magenta
                    yellow:(CGFloat)yellow
                     black:(CGFloat)black
                     alpha:(CGFloat)alpha;

/**Color with hex value*/
+ (UIColor *)xwAdd_colorWithRGB:(uint32_t)rgbValue;
+ (UIColor *)xwAdd_colorWithRGBA:(uint32_t)rgbaValue;
+ (UIColor *)xwAdd_colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;
/**Color with hex string*/
+ (UIColor *)xwAdd_colorWithHexString:(NSString *)hexStr;

#pragma mark - color change (颜色改变相关)

/**
 *  混合颜色
 *
 *  @param add       需要混合的颜色
 *  @param blendMode 混合方式
 *
 *  @return 混合后的颜色
 */
- (UIColor *)xwAdd_colorByAddColor:(UIColor *)add blendMode:(CGBlendMode)blendMode;

/**改变颜色的HSB*/
- (UIColor *)xwAdd_colorByChangeHue:(CGFloat)hueDelta
                   saturation:(CGFloat)saturationDelta
                   brightness:(CGFloat)brightnessDelta
                        alpha:(CGFloat)alphaDelta;

#pragma mark - interpolation (插值相关)
/**
 *  插值两种颜色返回中间的颜色
 *
 *  @param from  起始颜色
 *  @param to    终止颜色
 *  @param ratio 插值比例
 *
 *  @return 插值色
 */
+ (UIColor *)xwAdd_colorWithInterpolationFromValue:(UIColor *)from toValue:(UIColor *)to ratio:(CGFloat)ratio;


@end

NS_ASSUME_NONNULL_END