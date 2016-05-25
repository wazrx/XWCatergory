//
//  VJApi.h
//  Created  on 16/01
//  Copyright (c) 2016年  All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum   {
    VJ_ERROR=-1, // 失败
    VJ_APPID_INVALID = 0,  //广告位无效
    VJ_SUCCESS=1,//成功
    VJ_CLOSE = 2,  //界面被关闭
    VJ_ON_PRESENT = 3,  //界面被展示出来
   
    } VJCode;
 
typedef enum   {
    VJ_WX_Session = 1,  //微信好友
    VJ_WX_Timeline=2, // 微信朋友圈
    VJ_Tencent_Zone=3, //QQ空间   暂不支持
     VJ_Tencent_QQ=4, //QQ好友 暂不支持
    VJ_Sina=5,//新浪

} VJShareType;

@protocol VJApiDelegate <NSObject>

@optional

-(void)vjDidReceivedResponse:(VJCode)code error:(NSError *)err;
@end

@interface VJApi : NSObject

@property (nonatomic, assign) id<VJApiDelegate> delegate;


+(instancetype)shareManager;

/*!
 @method
 @abstract   注册信息
 @discussion 用于sdk的初始化,需要把从广告平台申请的广告位作为参数传进去。
 @param appid (NSString --required)从微+平台获取到的媒体ID
 @param gameid (NSString --optional) 用户信息设置,即媒体APP用户的账号
 @param isShow (NSString --optional) 针对半托管媒体，是否显示用户ID等信息
 */
-(void)registerApp:( NSString * )appid userid:(NSString *)gameid completionHandler:(void (^)(VJCode code,NSError *err)) handler;

 
/*!
 @method
 @abstract  加载内容界面
 @discussion
 */
 -(void)loadView:(UIViewController * )vc completionHandler:(void (^)(VJCode code,NSError *err)) handler;

/*!
 @method
 @abstract  加载源数据
 @discussion
 @param page (int --required) 当前的页码
 @param size (int --required) 每页显示数据的条数
 */

-(void)loadData:(int)page size:(int)size completionHandler:(void (^)(NSArray *arr,  BOOL hasNext,NSString *unit,  NSError *error))handler;

/*!
 @method
 @abstract  分享成功后调用
 @discussion
 @param dic (NSDictionary --required) 广告数据
 @param type (VJShareType --required) 分享的类型
 */

-(void)shared:( NSString *)ad  type:(VJShareType)type completionHandler:(void (^)(VJCode code,NSError *err)) handler ;
@end
