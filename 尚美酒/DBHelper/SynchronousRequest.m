//
//  SynchronousRequest.m
//  尚美酒
//
//  Created by Mac3 on 13-12-26.
//  Copyright (c) 2013年 zwtym. All rights reserved.
//

#import "SynchronousRequest.h"
#import "EncryptionBase64.h"

@implementation SynchronousRequest

+(NSData *)synchronousGet:(NSString *)requestUrl{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSError *error;
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if(error){
        NSLog(@" 链接失败，原因为：%@",error);
    }
    NSString *strl = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    return [[EncryptionBase64 textFromBase64String:strl]dataUsingEncoding:NSUTF8StringEncoding];
}

+(NSData *)synchronousGet:(NSString *)requestUrl cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:cachePolicy timeoutInterval:timeoutInterval];
    NSError *error;
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if(error){
        NSLog(@" 链接失败，原因为：%@",error);
    }
    NSString *strl = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    return [[EncryptionBase64 textFromBase64String:strl]dataUsingEncoding:NSUTF8StringEncoding];
}

+(NSData *)synchronousPost:(NSString *)requestUrl postXMLString:(NSString *)postString{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [request setHTTPMethod:@"POST"];
    
    NSData *data = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    NSError *error;
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if(error){
        NSLog(@" 链接失败，原因为：%@",error);
    }
    NSString *strl = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    NSLog(@"%@",strl);
    
    
    return [strl dataUsingEncoding:NSUTF8StringEncoding];
    //return received;
}

+(NSData *)synchronousPost:(NSString *)requestUrl postXMLString:(NSString *)postString cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:cachePolicy timeoutInterval:timeoutInterval];
    
    [request setHTTPMethod:@"POST"];
    
    NSData *data = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    NSError *error;
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if(error){
        NSLog(@" 链接失败，原因为：%@",error);
    }
    NSString *strl = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    return [[EncryptionBase64 textFromBase64String:strl]dataUsingEncoding:NSUTF8StringEncoding];
}

@end
