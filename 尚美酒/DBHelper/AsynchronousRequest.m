//
//  AsynchronousRequest.m
//  尚美酒
//
//  Created by Mac3 on 13-12-26.
//  Copyright (c) 2013年 zwtym. All rights reserved.
//

#import "AsynchronousRequest.h"
#import "EncryptionBase64.h"

@implementation AsynchronousRequest
+(NSURLRequest *)AsynchronousGet:(NSString *)requestUrl{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    return request;
}

+(NSURLRequest *)AsynchronousGet:(NSString *)requestUrl cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:cachePolicy timeoutInterval:timeoutInterval];
    
    return request;
}

+(NSMutableURLRequest *)AsynchronousPost:(NSString *)requestUrl postXMLString:(NSString *)postString{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [request setHTTPMethod:@"POST"];
    
    NSData *data = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    
    return request;
}

+(NSMutableURLRequest *)AsynchronousPost:(NSString *)requestUrl postXMLString:(NSString *)postString cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:cachePolicy timeoutInterval:timeoutInterval];
    
    [request setHTTPMethod:@"POST"];
    
    NSData *data = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    
    return request;
}

@end
