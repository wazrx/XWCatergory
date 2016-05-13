//
//  NSString+XWAdd.h
//  XWCurrencyExchange
//
//  Created by YouLoft_MacMini on 16/1/27.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (XWAdd)

@property (nonatomic, readonly) NSString *md2String;
@property (nonatomic, readonly) NSString *md4String;
@property (nonatomic, readonly) NSString *md5String;
@property (nonatomic, readonly) NSString *sha1String;
@property (nonatomic, readonly) NSString *sha224String;
@property (nonatomic, readonly) NSString *sha256String;
@property (nonatomic, readonly) NSString *sha384String;
@property (nonatomic, readonly) NSString *sha512String;

@property (nonatomic, readonly) NSString *crc32String;

#pragma mark - hmac (HMAC 加密相关，通过一个Key值进行加密)

- (NSString *)xwAdd_hmacMD5StringWithKey:(NSString *)key;

- (NSString *)xwAdd_hmacSHA1StringWithKey:(NSString *)key;

- (NSString *)xwAdd_hmacSHA224StringWithKey:(NSString *)key;

- (NSString *)xwAdd_hmacSHA256StringWithKey:(NSString *)key;

- (NSString *)xwAdd_hmacSHA384StringWithKey:(NSString *)key;

- (NSString *)xwAdd_hmacSHA512StringWithKey:(NSString *)key;

#pragma mark - ecode and decode (编码解码相关)

@property (nonatomic, readonly) NSString *base64EncodedString;
@property (nonatomic, readonly) NSString *base64DecodedString;
@property (nonatomic, readonly) NSString *urlEncodedString;
@property (nonatomic, readonly) NSString *urlDecodedString;
@property (nonatomic, readonly) NSString *escapingHTMLString;

#pragma mark - size to fit (文字自适应相关)

- (CGSize)xwAdd_sizeWithfont:(UIFont *)font maxSize:(CGSize)maxSize;

- (CGSize)xwAdd_sizeWithAttrs:(NSDictionary *)attrs maxSize:(CGSize)maxSize;

#pragma mark - regular expression(正则表达式相关)

- (BOOL)xwAdd_matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options;

- (void)xwAdd_enumerateRegexMatches:(NSString *)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block;

- (NSString *)xwAdd_stringByReplacingRegex:(NSString *)regex
                             options:(NSRegularExpressionOptions)options
                          withString:(NSString *)replacement;

#pragma mark - NSNumber (添加部分NSNumber相关属性)

@property (nonatomic, readonly) NSNumber *numberValue;
@property (readonly) char charValue;
@property (readonly) unsigned char unsignedCharValue;
@property (readonly) short shortValue;
@property (readonly) unsigned short unsignedShortValue;
@property (readonly) unsigned int unsignedIntValue;
@property (readonly) long longValue;
@property (readonly) unsigned long unsignedLongValue;
@property (readonly) unsigned long long unsignedLongLongValue;
@property (readonly) NSUInteger unsignedIntegerValue;

#pragma mark - UTF32 Char (UTF32相关)

+ (NSString *)xwAdd_stringWithUTF32Char:(UTF32Char)char32;
+ (NSString *)xwAdd_stringWithUTF32Chars:(const UTF32Char *)char32 length:(NSUInteger)length;
- (void)xwAdd_enumerateUTF32CharInRange:(NSRange)range usingBlock:(void (^)(UTF32Char char32, NSRange range, BOOL *stop))block;

#pragma mark - imageScaleString (给图片路径添加scale字段，如@2x， 用于没有使用AssetImage的图片资源)

/**如果无后缀名使用此方法  From @"name" to @"name@2x".*/
- (NSString *)xwAdd_stringByAppendingNameScale:(CGFloat)scale;
/**如果有后缀名使用此方法 From @"name.png" to @"name@2x.png".*/
- (NSString *)xwAdd_stringByAppendingPathScale:(CGFloat)scale;

/**根据屏幕返回想要的几倍图片名*/
- (NSString *)xwAdd_scaleNameSring;
- (NSString *)xwAdd_scalePathSring;

#pragma mark - blank(空白字符相关)

/**去除string中的首尾空白*/
- (NSString *)xwAdd_stringByTrim;
/**判断字符串是否是空白：nil, @"", @"  ", @"\n" will Returns NO; otherwise Returns YES.*/
- (BOOL)xwAdd_isNotBlank;

#pragma mark - contain(包含相关)

- (BOOL)xwAdd_containsString:(NSString *)string;
/**
 1 controlCharacterSet//控制符 2 whitespaceCharacterSet 3 whitespaceAndNewlineCharacterSet//空格换行 4 decimalDigitCharacterSet//小数 5 letterCharacterSet//文字 6 lowercaseLetterCharacterSet//小写字母 7 uppercaseLetterCharacterSet//大写字母 8 nonBaseCharacterSet//非基础 9 alphanumericCharacterSet//字母数字10 decomposableCharacterSet//可分解11 illegalCharacterSet//非法12 punctuationCharacterSet//标点13 capitalizedLetterCharacterSet//大写14 symbolCharacterSet//符号15 newlineCharacterSet//换行符
 */
- (BOOL)xwAdd_containsCharacterSet:(NSCharacterSet *)set;

#pragma mark - other

/**Returns an NSData using UTF-8 encoding.*/
@property (nonatomic, readonly) NSData *dataValue;
@property (nonatomic, readonly) NSRange rangeOfAll;
/**JSON字符串转JSON*/
@property (nonatomic, readonly) id jsonValue;

+ (NSString *)xwAdd_stringWithUUID;
/** 给数字string添加逗号分隔符，自身带有逗号也没有关系，会自动处理,比如1234.5->1,234.5(用于计算器等)*/
- (NSString *)xwAdd_insertCommaFornumberString;
/**删除逗号，返回float值*/
- (float)xwAdd_deleteCommaFornumberValue;
/**给手机号码添加空格分隔符*/
- (NSString *)xwAdd_addSeperatorForPhoneString;
/**汉字转拼音*/
- (NSString *)xwAdd_getPinYinWithChineseString;
@end

NS_ASSUME_NONNULL_END