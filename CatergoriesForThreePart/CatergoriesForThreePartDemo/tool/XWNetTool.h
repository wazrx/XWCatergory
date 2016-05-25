//
//  XNetTool.h
//  package
//
//  Created by wazrx on 15/7/13.
//  Copyright (c) 2015年 肖文. All rights reserved.

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface XWNetTool : NSObject

/**是否需要取消上一次的网络请求*/
@property (nonatomic, assign) BOOL cancleLastRequest;
/**3840错误解决，由于接收到的数据是data，需要把接受的数据转换：[[NSString alloc]initWithData:object encoding:NSUTF8StringEncoding]*/
@property (nonatomic, assign) BOOL supportErrorThreeEightZeroFour;

@property (nonatomic, assign) BOOL supportTextHtml;

@property (nonatomic, strong) AFHTTPSessionManager *manager;
/**
 *  创建网络工具实例对象
 */
+ (XWNetTool *)xw_tool;

/**
 *  检测网络状态
 */
+ (void)xw_checkOutNetStatus;

/**
 *  取消上一次请求
 */
- (void)xw_cancleRequest;
/**
 *  获取当期网络状态
 */
+ (AFNetworkReachabilityStatus)xw_getNetStatus;

/**
 *  get网络请求
 */
- (void)xw_getWithURL:(NSString *)url params:(NSDictionary *)pramas success:(void(^)(id object))success fail:(void(^)(id object))fail;

/**
 *  get网络请求
 *
 *  @param url     请求地址
 *  @param pramas  报文
 */
- (void)xw_postWithURL:(NSString *)url params:(NSDictionary *)pramas success:(void(^)(id object))success fail:(void(^)(id object))fail;

/**
 *  上传数据
 */
- (void)xw_uploadWithURL:(NSString *)url params:(NSDictionary *)pramas data:(NSData *)data name:(NSString *)name filePath:(NSString *)filePathString mimeType:(NSString *)type success:(void(^)(id object))success fail:(void(^)(id object))fail;

/**
 *  下载数据
 */
- (void)xw_downLoadWithStr:(NSString *)str fileName:(NSString *)fileName completionHandler:(void(^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionBlock;

@end
