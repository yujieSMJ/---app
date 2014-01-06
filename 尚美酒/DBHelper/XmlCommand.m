//
//  XmlCommand.m
//  尚美酒
//
//  Created by Mac3 on 13-12-31.
//  Copyright (c) 2013年 zwtym. All rights reserved.
//

#import "XmlCommand.h"

@implementation XmlCommand

+(NSString *)CreatXmlCommand:(NSMutableDictionary *)command{
    NSMutableString *xmlString = [NSMutableString stringWithString:@"<?xml version='1.0' encoding='UTF-8'?>"];
    [xmlString appendString:@"<xmlCommandSet>"];
    xmlString = [NSMutableString stringWithString:[self CreatXmlString:command CommandString:xmlString]];
    [xmlString appendString:@"</xmlCommandSet>"];
    return xmlString;
}

+(NSString *)CreatXmlCommands:(NSMutableArray *)commandlist{
    NSMutableString *xmlString = [NSMutableString stringWithString:@"<?xml version='1.0' encoding='UTF-8'?>"];
    [xmlString appendString:@"<xmlCommandSet>"];
    for(NSMutableDictionary *command in commandlist)
    {
        xmlString = [NSMutableString stringWithString:[self CreatXmlString:command CommandString:xmlString]];
    }
    [xmlString appendString:@"</xmlCommandSet>"];
    return xmlString;
}

+(NSMutableString *)CreatXmlString:(NSMutableDictionary *)commands CommandString:(NSMutableString *)xString{
    NSDictionary *parameters = [[NSDictionary alloc]initWithDictionary:[commands objectForKey:@"Parameters"]];
    NSMutableDictionary *subParameters;
    [xString appendFormat:@"<xmlCommand name=\"\" commandType=\"%@\" textParameter=\"%@\" tableName=\"%@\" keyName=\"%@\" sort=\"%@\"><parameters>",[commands objectForKey:@"CommandType"],[commands objectForKey:@"TextParameter"],[commands objectForKey:@"TableName"],[commands objectForKey:@"KeyName"],[commands objectForKey:@"Sort"]];
    //获取到参数字典中的所有key的名称
    NSArray *keyNames = [parameters allKeys];
    //遍历数组将参数的键值对写入到XML中
    for(NSString *keyName in keyNames)
    {
        subParameters = [[NSMutableDictionary alloc]initWithDictionary:[parameters objectForKey:keyName]];
        [xString appendFormat:@"<parameter name=\"%@\">",keyName];
        
        NSArray *subKeys = [subParameters allKeys];
        for(NSString *subKey in subKeys)
        {
            NSArray *subType = [subParameters objectForKey:subKey];
            [xString appendFormat:@"<%@ type=\"%@\"><![CDATA[%@]]></%@>",subKey,[subType objectAtIndex:1],[subType objectAtIndex:0],subKey];
        }
        
        [xString appendString:@"</parameter>"];
    }
    [xString appendString:@"</parameters>"];
    [xString appendString:@"</xmlCommand>"];
    
    return  xString;
}


+(NSMutableDictionary *)CreateCommand:(NSString *)CommandType textParameter:(NSString *)TextParameter tableName:(NSString *)TableName keyName:(NSString *)KeyName sort:(NSString *)Sort parameters:(NSMutableDictionary *)Parameters{
    NSMutableDictionary * xmlcommand = [[NSMutableDictionary alloc]init];
    
    [xmlcommand setObject:CommandType forKey:@"CommandType"];
    [xmlcommand setObject:TextParameter forKey:@"TextParameter"];
    [xmlcommand setObject:TableName forKey:@"TableName"];
    [xmlcommand setObject:KeyName forKey:@"KeyName"];
    [xmlcommand setObject:Parameters forKey:@"Parameters"];
    [xmlcommand setObject:Sort forKey:@"Sort"];
    return xmlcommand;
}

@end

@implementation Objects

+(NSMutableDictionary *)CreateNewObject:(NSString *)Name Parameters:(NSMutableDictionary *)parameters{
    NSMutableDictionary * param = [[NSMutableDictionary alloc]init];
    [param setObject:parameters forKey:Name];
    return param;
}

+(NSArray *)SetParameterValue:(NSString *)value andParameterType:(ParameterType)parameterType{
    switch (parameterType) {
        case 1:
            return [NSArray arrayWithObjects:value,@"String", nil];
        case 2:
            return [NSArray arrayWithObjects:value,@"Double", nil];
        case 3:
            return [NSArray arrayWithObjects:value,@"Boolen", nil];
        case 4:
            return [NSArray arrayWithObjects:value,@"DataTime", nil];
        case 5:
            return [NSArray arrayWithObjects:value,@"Decimal", nil];
        default:
            return [NSArray arrayWithObjects:value,@"Int32", nil];
    }
}



@end

