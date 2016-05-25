//
//  XNetTool.m
//  package
//
//  Created by wazrx on 15/7/13.
//  Copyright (c) 2015年 肖文. All rights reserved.
//
#import "XWNetTool.h"
#import <AFNetworkReachabilityManager.h>

@interface XWNetTool ()
@property (nonatomic, strong) NSURLSessionDataTask *lastTask;
@end

@implementation XWNetTool

- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

+ (XWNetTool *)xw_tool {
    return [XWNetTool new];
}

+ (void)xw_checkOutNetStatus {
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
}

- (void)xw_cancleRequest {
    [_lastTask cancel];
}

+ (AFNetworkReachabilityStatus)xw_getNetStatus {
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
}

- (void)xw_getWithURL:(NSString *)url params:(NSDictionary *)pramas success:(void(^)(id object))success fail:(void(^)(id object))fail {
    if ([XWNetTool xw_getNetStatus] == AFNetworkReachabilityStatusNotReachable) {
        NSError *error = nil;
        if (fail) {
            fail(error);
        }
        return;
    }
    if (_cancleLastRequest) {
        [_lastTask cancel];
    }
    if (_supportTextHtml) {
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    }
    if (_supportErrorThreeEightZeroFour) {
        self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
    _lastTask = [self.manager GET:url parameters:pramas progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
}

- (void)xw_postWithURL:(NSString *)url params:(NSDictionary *)pramas success:(void(^)(id object))success fail:(void(^)(id object))fail {
    if ([XWNetTool xw_getNetStatus] == AFNetworkReachabilityStatusNotReachable) {
        NSError *error = nil;
        if (fail) {
            fail(error);
        }
        return;
    }
    if (_cancleLastRequest) {
        [self.manager.operationQueue cancelAllOperations];
    }
    if (_supportTextHtml) {
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    }
    if (_supportErrorThreeEightZeroFour) {
        self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
    NSURLSessionTask *task = [self.manager POST:url parameters:pramas progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
    [task resume];

	
}

- (void)xw_uploadWithURL:(NSString *)url params:(NSDictionary *)pramas data:(NSData *)data name:(NSString *)name filePath:(NSString *)filePathString mimeType:(NSString *)type success:(void(^)(id object))success fail:(void(^)(id object))fail {
    if ([XWNetTool xw_getNetStatus] == AFNetworkReachabilityStatusNotReachable) {
        NSError *error = nil;
        if (fail) {
            fail(error);
        }
        return;
    }
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURL *filePath = [NSURL fileURLWithPath:filePathString];
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Success: %@ %@", response, responseObject);
        }
    }];
    [uploadTask resume];
}

- (void)xw_downLoadWithStr:(NSString *)str fileName:(NSString *)fileName completionHandler:(void(^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionBlock {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSString *temp = [response.suggestedFilename componentsSeparatedByString:@"."].lastObject;
        //设置下载路径(cache文件夹)
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", fileName, temp]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        completionBlock(response,filePath,error);
        
    }];
    [downloadTask resume];
}

@end
