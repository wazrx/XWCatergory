//
//  VJWXApiManager.h
//  Created  on 16/01
//  Copyright (c) 2016年  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"
@protocol VJWXApiManagerDelegate <NSObject>

@optional

- (void)onResp:(BaseResp *)resp ;

- (void)onReq:(BaseReq *)req ;

- (void)managerDidRecvGetMessageReq:(GetMessageFromWXReq *)request;

- (void)managerDidRecvShowMessageReq:(ShowMessageFromWXReq *)request;

- (void)managerDidRecvLaunchFromWXReq:(LaunchFromWXReq *)request;

- (void)managerDidRecvMessageResponse:(SendMessageToWXResp *)response;

- (void)managerDidRecvAuthResponse:(SendAuthResp *)response;

- (void)managerDidRecvAddCardResponse:(AddCardToWXCardPackageResp *)response;

@end
@interface VJWXApiManager : NSObject<WXApiDelegate>
@property (nonatomic, assign) id<VJWXApiManagerDelegate> delegate;
+ (instancetype)sharedManager;
@end
