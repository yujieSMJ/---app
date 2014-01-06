//
//  AsynchronousRequest.h
//  尚美酒
//
//  Created by Mac3 on 13-12-26.
//  Copyright (c) 2013年 zwtym. All rights reserved.
//  异步get／post请求

#import <Foundation/Foundation.h>

@interface AsynchronousRequest : NSObject

/*!
 @method         AsynchronousGet:
 @discussion        异步get请求
 @param  requestUrl   请求的路径.
 @result     异步get请求，返回NSURLRequest对象
 */
+(NSURLRequest *)AsynchronousGet:(NSString *)requestUrl;

/*!
 @method         AsynchronousGet:cachePolicy：timeoutInterval：
 @discussion        异步get请求
 @param  requestUrl   请求的路径.
 @param  cachePolicy   缓存协议.
 @param  timeoutInterval    网络请求超时时间（秒）.
 @result    异步get请求，返回NSURLRequest对象
 */
+(NSURLRequest *)AsynchronousGet:(NSString *)requestUrl cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval;

/*!
 @method         AsynchronousPost:postJSON：
 @discussion        异步post请求
 @param  requestUrl   请求的路径.
 @param  postString   表单信息.
 @result    异步post请求，返回NSMutableURLRequest的对象实例
 */
+(NSMutableURLRequest *)AsynchronousPost:(NSString *)requestUrl postXMLString:(NSString *)postString;

/*!
 @method         AsynchronousPost:postJSON：cachePolicy：timeoutInterval：
 @discussion        异步post请求
 @param  requestUrl   请求的路径.
 @param  postString   表单信息.
 @param  cachePolicy   缓存协议.
 @param  timeoutInterval    网络请求超时时间（秒）.
 @result    异步post请求，返回NSMutableURLRequest的对象实例
 */
+(NSMutableURLRequest *)AsynchronousPost:(NSString *)requestUrl postXMLString:(NSString *)postString cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval;


@end
