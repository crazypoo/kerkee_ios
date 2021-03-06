//
//  KCJSBridge.m
//  kerkee
//
//  Designed by zihong
//
//  Created by lijian on 15/8/25.
//  Copyright (c) 2015年 lijian. All rights reserved.
//

#import "KCJSBridge.h"
#import "KCBaseDefine.h"
#import "KCApiBridge.h"
#import "KCClass.h"
#import "KCJSExecutor.h"
#import "KCJSDefine.h"

@interface KCJSBridge()
{
    KCApiBridge* m_apiBridge;
}

@end

@implementation KCJSBridge

- (id)initWithWebView:(KCWebView *)aWebView delegate:(id)delegate
{
    self = [super init];
    if(self)
    {
        m_apiBridge = [KCApiBridge apiBridgeWithWebView:aWebView delegate:delegate];
        KCRetain(m_apiBridge);
    }
    
    return self;
}

- (void)dealloc
{
    
    KCRelease(m_apiBridge);
    
    KCDealloc(super);
}

/********************************************************/
/*
 * js opt
 */
/********************************************************/
#pragma mark - register
+ (KCClass*)registJSBridgeClient:(Class)aClass
{
    return [KCRegister registClass:aClass withJSObjName:kJS_jsBridgeClient];
}

+ (KCClass*)registClass:(KCClass *)aClass
{
    return [KCRegister registClass:aClass];
}

+ (KCClass*)registClass:(Class)aClass jsObjName:(NSString *)aJSObjectName;
{
    return [KCRegister registClass:aClass withJSObjName:aJSObjectName];
}

+ (KCClass*)registObject:(KCJSObject*)aObject
{
    return [KCRegister registObject:aObject];
}
+ (KCClass*)removeObject:(KCJSObject*)aObject
{
    return [KCRegister removeObject:aObject];
}

+ (KCClass*)removeClass:(NSString*)aJSObjName
{
    return [KCRegister removeClass:aJSObjName];
}

+ (KCClass*)getClass:(NSString*)aJSObjName
{
    return [KCRegister getClass:aJSObjName];
}


/********************************************************/
/*
 * js call
 */
/********************************************************/

#pragma mark - callJS

+ (void)callJSOnMainThread:(KCWebView *)aWebView jsString:(NSString *)aJS
{
    [KCJSExecutor callJSOnMainThread:aJS inWebView:aWebView completionHandler:nil];
}

+ (void)callJS:(KCWebView *)aWebView jsString:(NSString *)aJS
{
    [KCJSExecutor callJS:aJS inWebView:aWebView completionHandler:nil];
}

+ (void)callJSFunction:(NSString *)function withJSONObject:(NSDictionary *)jsonObj WebView:(KCWebView*)webview
{
    [KCJSExecutor callJSFunction:function withJSONObject:jsonObj inWebView:webview completionHandler:nil];
}
+ (void)callJSFunction:(NSString *)function withJSONString:(NSString *)jsonObj WebView:(KCWebView*)webview
{
    [KCJSExecutor callJSFunction:function withJSONString:jsonObj inWebView:webview completionHandler:nil];
}
//
+ (void)callJSFunctionOnMainThread:(KCWebView *)aWebView funName:(NSString *)aFunName args:(NSString *)aArgs
{
    [KCJSExecutor callJSFunctionOnMainThread:aFunName withJSONString:aArgs inWebView:aWebView completionHandler:nil];
}

//
+ (void)callbackJS:(KCWebView *)aWebView callBackID:(NSString *)aCallbackId
{
    [KCJSExecutor callbackJS:aWebView callbackId:aCallbackId];
}

+ (void)callbackJS:(KCWebView *)aWebView callBackID:(NSString *)aCallbackId jsonString:(NSString *)aStr
{
    [KCJSExecutor callbackJS:aWebView callbackId:aCallbackId jsonString:aStr];
}

+ (void)callbackJS:(KCWebView *)aWebView callBackID:(NSString *)aCallbackId string:(NSString *)aStr
{
    [KCJSExecutor callbackJS:aWebView callbackId:aCallbackId string:aStr];
}


/********************************************************/
/*
 * config
 */
/********************************************************/
+ (void)openGlobalJSLog:(BOOL)aIsOpenJSLog
{
    [KCApiBridge openGlobalJSLog:aIsOpenJSLog];
}

+ (void)setIsOpenJSLog:(KCWebView*)aWebview isOpenJSLog:(BOOL)aIsOpenJSLog
{
    [KCApiBridge setIsOpenJSLog:aWebview isOpenJSLog:aIsOpenJSLog];
}



@end
