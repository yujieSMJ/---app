//
//  XmlCommands.m
//  尚美酒
//
//  Created by tech-Yu-Mac on 14-1-5.
//  Copyright (c) 2014年 zwtym. All rights reserved.
//

#import "XmlCommands.h"

@implementation XmlCommands


/////////////////////////////////////////////////////////////////////////////////////////////////////////

+(NSMutableString *)creatXmlCommandSetsByone:(NSMutableDictionary *)commandSet andXmlString:(NSMutableString *)xmlStrings{
    [xmlStrings appendFormat:@"<xmlCommandSet groupID=\"%@\" Index=\"%@\" cmdSorts=\"%@\" id=\"%@\" pid=\"%@\" dbexe=\"%@\" />",[commandSet objectForKey:@"GroupID"],[commandSet objectForKey:@"Index"],[commandSet objectForKey:@"CmdSorts"],[commandSet objectForKey:@"ID"],[commandSet objectForKey:@"PID"],[commandSet objectForKey:@"DBExe"]];
    return xmlStrings;
}

//拼接命令集xml（生成含有一个命令集的xml）
+(NSMutableString *)creatXmlCommandSetsByone:(NSMutableDictionary *)commandSet{
    NSMutableString *xmlString = [NSMutableString stringWithString:@"<xmlCommandSets>"];
    xmlString = [NSMutableString stringWithString:[self creatXmlCommandSetsByone:commandSet andXmlString:xmlString]];
    return xmlString;
}


+(NSMutableString *)creatXmlCommandSets:(NSMutableArray *)commandSets{
    NSMutableString *xmlString = [NSMutableString stringWithString:@"<xmlCommandSets>"];
    for(NSMutableDictionary *commandSet in commandSets)
    {
        xmlString = [NSMutableString stringWithString:[self creatXmlCommandSetsByone:commandSet andXmlString:xmlString]];
    }
    [xmlString appendString:@"</xmlCommandSets>"];
    return xmlString;
}

+(NSMutableString *)creatXmlCommandByone:(NSMutableDictionary *)command andXmlString:(NSMutableString *)xmlStrings{
    [xmlStrings appendFormat:@"<xmlCommand id=\"%@\" commandType=\"%@\" tableName=\"%@\" paraSort=\"%@\" spID=\"%@\" keyName=\"%@\" />",[command objectForKey:@"ID"],[command objectForKey:@"CommandType"],[command objectForKey:@"TableName"],[command objectForKey:@"ParaSort"],[command objectForKey:@"SPID"],[command objectForKey:@"KeyName"]];
    return xmlStrings;
}

//拼接命令的xml（生成一个包含一个命令的xml）
+(NSMutableString *)createXmlCommandByone:(NSMutableDictionary *)command{
    NSMutableString *xmlString = [NSMutableString stringWithString:@"<xmlCommands>"];
    xmlString = [NSMutableString stringWithString:[self creatXmlCommandByone:command andXmlString:xmlString]];
    [xmlString appendString:@"</xmlCommands>"];
    return xmlString;
}


+(NSMutableString *)creatXmlCommands:(NSMutableArray *)commands{
    NSMutableString *xmlString = [NSMutableString stringWithString:@"<xmlCommands>"];
    for(NSMutableDictionary *command in commands)
    {
        xmlString = [NSMutableString stringWithString:[self creatXmlCommandByone:command andXmlString:xmlString]];
    }
    [xmlString appendString:@"</xmlCommands>"];
    return xmlString;
}


+(NSMutableString *)appendField:(NSMutableDictionary *)field andAppendString:(NSMutableString *)xmlStrings{
    [xmlStrings appendFormat:@"<field name=\"%@\" type=\"%@\" value=\"%@\"/>",[field objectForKey:@"Name"],[field objectForKey:@"Type"],[field objectForKey:@"Value"]];
    return xmlStrings;
}
+(NSMutableString *)appendPrimaryField:(NSMutableDictionary *)primaryfield andAppendString:(NSMutableString *)xmlStrings{
    [xmlStrings appendFormat:@"<primaryField name=\"%@\" value=\"%@\" releationShip=\"%@\" append=\"%@\" index=\"%@\" type=\"%@\"/>",[primaryfield objectForKey:@"Name"],[primaryfield objectForKey:@"Value"],[primaryfield objectForKey:@"ReleationShip"],[primaryfield objectForKey:@"Append"],[primaryfield objectForKey:@"Index"],[primaryfield objectForKey:@"Type"]];
    return xmlStrings;
}
+(NSMutableString *)appendOrderBy:(NSMutableDictionary *)orderBy andAppendString:(NSMutableString *)xmlStrings{
    [xmlStrings appendFormat:@"<orderBy name=\"%@\" order=\"%@\" index=\"%@\" Type=\"%@\"/>",[orderBy objectForKey:@"Name"],[orderBy objectForKey:@"Order"],[orderBy objectForKey:@"Index"],[orderBy objectForKey:@"Type"]];
    return xmlStrings;
}
//创建只包含一个参数的参数xml
+(NSMutableString *)createXmlParametersByMP:(NSMutableDictionary *)MParameter andSelectParameter:(NSMutableDictionary *)SParameter{
    NSMutableString *xmlString = [NSMutableString stringWithFormat:@"<parameters><modificationParameter paraID=\"%@\">",[MParameter objectForKey:@"ParaID"]];
    NSArray *fields = [MParameter objectForKey:@"Field"];
    for(NSMutableDictionary *field in fields)
    {
        xmlString = [NSMutableString stringWithString:[self appendField:field andAppendString:xmlString]];
    }
    [xmlString appendFormat:@"</modificationParameter><selectParameter id=\"%@\" top=\"%@\" pageSize=\"%@\">",[SParameter objectForKey:@"ID"],[SParameter objectForKey:@"Top"],[SParameter objectForKey:@"PageSize"]];
    NSArray *primaryFields = [SParameter objectForKey:@"PrimaryField"];
    for(NSMutableDictionary *primaryField in primaryFields)
    {
        xmlString = [NSMutableString stringWithString:[self appendPrimaryField:primaryField andAppendString:xmlString]];
    }
    NSArray *orderBys = [SParameter objectForKey:@"OrderBy"];
    for(NSMutableDictionary *orderBy in orderBys)
    {
        xmlString = [NSMutableString stringWithString:[self appendOrderBy:orderBy andAppendString:xmlString]];
    }
    [xmlString appendString:@"</selectParameter>"];
    [xmlString appendString:@"</parameters>"];
    return xmlString;
}

+(NSMutableString *)createXmlParametersByMPList:(NSMutableArray *)MParameterList andSelectParameter:(NSMutableDictionary *)SParameter{
    NSMutableString *xmlString = [NSMutableString stringWithString:@"<parameters>"];
    if(MParameterList == nil)
    {
        [xmlString appendFormat:@"<modificationParameter paraID=\"\"></modificationParameter>"];
    }
    for(NSMutableDictionary *MParameter in MParameterList)
    {
        [xmlString appendFormat:@"<modificationParameter paraID=\"%@\">",[MParameter objectForKey:@"ParaID"]];
        NSArray *fields = [MParameter objectForKey:@"Field"];
        for(NSMutableDictionary *field in fields)
        {
            xmlString = [NSMutableString stringWithString:[self appendField:field andAppendString:xmlString]];
        }
        [xmlString appendString:@"</modificationParameter>"];
    }
    [xmlString appendFormat:@"<selectParameter id=\"%@\" top=\"%@\" pageSize=\"%@\">",[SParameter objectForKey:@"ID"],[SParameter objectForKey:@"Top"],[SParameter objectForKey:@"PageSize"]];
    NSArray *primaryFields = [SParameter objectForKey:@"PrimaryField"];
    for(NSMutableDictionary *primaryField in primaryFields)
    {
        xmlString = [NSMutableString stringWithString:[self appendPrimaryField:primaryField andAppendString:xmlString]];
    }
    NSArray *orderBys = [SParameter objectForKey:@"OrderBy"];
    for(NSMutableDictionary *orderBy in orderBys)
    {
        xmlString = [NSMutableString stringWithString:[self appendOrderBy:orderBy andAppendString:xmlString]];
    }
    [xmlString appendString:@"</selectParameter>"];
    [xmlString appendString:@"</parameters>"];
    return xmlString;
}

+(NSMutableString *)createXmlParametersByMPList:(NSMutableArray *)MParameterList andSelectParameter:(NSMutableDictionary *)SParameter andXmlString:(NSMutableString *)xmlString{
    [xmlString appendString:[self createXmlParametersByMPList:MParameterList andSelectParameter:SParameter]];
    return xmlString;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//生成命令集
+(NSMutableDictionary *)createXmlCommandSetByID:(NSString *)groupID andIndex:(NSString *)index andCmdSort:(NSString *)sorts andID:(NSString *)xid andPID:(NSString *)pid andDBExe:(NSString *)dbExe{
    NSMutableDictionary *object = [[NSMutableDictionary alloc]init];
    [object setObject:groupID forKey:@"GroupID"];
    [object setObject:index forKey:@"Index"];
    [object setObject:sorts forKey:@"CmdSorts"];
    [object setObject:xid forKey:@"ID"];
    [object setObject:pid forKey:@"PID"];
    [object setObject:dbExe forKey:@"DBExe"];
    return object;
}

//生成命令
+(NSMutableDictionary *)createCommandByID:(NSString *)cid andType:(CommandType)type andTableName:(NSString *)tname andParaSort:(NSString *)paraIDs andSelectPID:(NSString *)spid andKeyName:(NSString *)keyname{
    NSMutableDictionary *cmd = [[NSMutableDictionary alloc]init];
    [cmd setObject:cid forKey:@"ID"];
    [cmd setObject:[NSString stringWithFormat:@"%d",type] forKey:@"CommandType"];
    [cmd setObject:tname forKey:@"TableName"];
    [cmd setObject:paraIDs forKey:@"ParaSort"];
    [cmd setObject:spid forKey:@"SPID"];
    [cmd setObject:keyname forKey:@"KeyName"];
    return  cmd;
}

//生成参数
+(NSMutableDictionary *)createModiParameterByID:(NSString *)paraID andFields:(NSMutableDictionary *)fields{
    NSMutableDictionary *mp = [[NSMutableDictionary alloc]init];
    [mp setObject:paraID forKey:@"ParaID"];
    [mp setObject:fields forKey:@"Field"];
    return mp;
}

//生成多个参数
+(NSMutableDictionary *)createModiParameterByID:(NSString *)paraID andFieldList:(NSMutableArray *)fieldlist{
    NSMutableDictionary *mplist = [[NSMutableDictionary alloc]init];
    [mplist setObject:paraID forKey:@"ParaID"];
    [mplist setObject:fieldlist forKey:@"Field"];
    return mplist;
}

//创建单个参数、键值、类型
+(NSMutableDictionary *)createFieldByName:(NSString *)name andType:(CommandType)type andValue:(NSString *)value{
    NSMutableDictionary *field = [[NSMutableDictionary alloc]init];
    [field setObject:name forKey:@"Name"];
    [field setObject:[NSString stringWithFormat:@"%d",type] forKey:@"Type"];
    [field setObject:value forKey:@"Value"];
    return field;
}

//生成where条件
+(NSMutableDictionary *)createSelectParameterByID:(NSString *)spid andTops:(NSString *)top andPrimaryField:(NSMutableDictionary *)primaryField andOrderBy:(NSMutableDictionary *)orderby{
    NSMutableDictionary *sp = [[NSMutableDictionary alloc]init];
    [sp setObject:spid forKey:@"ID"];
    [sp setObject:top forKey:@"Top"];
    [sp setObject:primaryField forKey:@"PrimaryField"];
    [sp setObject:orderby forKey:@"OrderBy"];
    return sp;
}

//生成包含多个参数和orderby参数的where条件
+(NSMutableDictionary *)createSelectParameterByID:(NSString *)spid andTops:(NSString *)top andPageSize:(NSUInteger)size  andPrimaryFieldList:(NSMutableArray *)primaryField andOrderByList:(NSMutableArray *)orderby{
    NSMutableDictionary *sp = [[NSMutableDictionary alloc]init];
    [sp setObject:spid forKey:@"ID"];
    [sp setObject:top forKey:@"Top"];
    [sp setObject:[NSString stringWithFormat:@"%d",size] forKey:@"PageSize"];
    [sp setObject:primaryField forKey:@"PrimaryField"];
    [sp setObject:orderby forKey:@"OrderBy"];
    return sp;
}

//生成包含多个参数和orderby参数的where条件
+(NSMutableDictionary *)createSelectParameterByPFieldList:(NSMutableArray *)primaryField andOrderByList:(NSMutableArray *)orderby{
    NSMutableDictionary *sp = [[NSMutableDictionary alloc]init];
    [sp setObject:@"0" forKey:@"ID"];
    [sp setObject:@"" forKey:@"Top"];
    [sp setObject:@"" forKey:@"PageSize"];
    [sp setObject:primaryField forKey:@"PrimaryField"];
    [sp setObject:orderby forKey:@"OrderBy"];
    return sp;
}

//创建where条件的orderby命令
+(NSMutableDictionary *)createOrderByName:(NSString *)name andOrder:(NSString *)order andIndex:(NSString *)index andType:(ParameterType)type{
    NSMutableDictionary *orderBy = [[NSMutableDictionary alloc]init];
    [orderBy setObject:name forKey:@"Name"];
    [orderBy setObject:order forKey:@"Order"];
    [orderBy setObject:index forKey:@"Index"];
    [orderBy setObject:[NSString stringWithFormat:@"%d",type] forKey:@"Type"];
    return  orderBy;
}

//创建where语句中的查询参数、值及其关系
+(NSMutableDictionary *)createParameterFieldsByName:(NSString *)name andValue:(NSString *)value andReleationShip:(ReleationShip)releat andAppend:(AppendType)append andIndex:(NSString *)index andType:(ParameterType)type{
    NSMutableDictionary *object = [[NSMutableDictionary alloc]init];
    [object setObject:name forKey:@"Name"];
    [object setObject:value forKey:@"Value"];
    [object setObject:[NSString stringWithFormat:@"%d",releat] forKey:@"ReleationShip"];
    [object setObject:[NSString stringWithFormat:@"%d",append] forKey:@"Append"];
    [object setObject:index forKey:@"Index"];
    [object setObject:[NSString stringWithFormat:@"%d",type] forKey:@"Type"];
    return object;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//创建一个简单的xml命令
+(NSMutableString *)createSimpleCommand:(NSMutableDictionary *)command andParameters:(NSMutableArray *)MParameterList andSelectParameter:(NSMutableDictionary *)SParameter{
    NSMutableString *xmlString = [NSMutableString stringWithString:@"<?xml version='1.0' encoding='UTF-8'?>"];
    [xmlString appendString:@"<root><xmlCommandSets><xmlCommandSet groupID=\"0\" Index=\"0\" cmdSorts=\"1\" id=\"1\" pid=\"0\" dbexe=\"new\"/></xmlCommandSets><xmlCommands>"];
    [xmlString appendFormat:@"<xmlCommand id=\"0\" commandType=\"%@\" tableName=\"%@\" paraSort=\"%@\" spID=\"%@\" keyName=\"%@\" /></xmlCommands>",[command objectForKey:@"CommandType"],[command objectForKey:@"TableName"],[command objectForKey:@"ParaSort"],[command objectForKey:@"SPID"],[command objectForKey:@"KeyName"]];
    xmlString = [NSMutableString stringWithString:[self createXmlParametersByMPList:MParameterList andSelectParameter:SParameter andXmlString:xmlString]];
    [xmlString appendString:@"</root>"];
    return xmlString;
}

+(NSMutableString *)createSimpleCommandByType:(CommandType)type andTableName:(NSString *)tname andParaSort:(NSString *)paraIDs andSelectPID:(NSString *)spid andKeyName:(NSString *)keyname andParameters:(NSMutableArray *)MParameterList andSelectParameter:(NSMutableDictionary *)SParameter{
    NSMutableString *xmlString = [NSMutableString stringWithString:@"<?xml version='1.0' encoding='UTF-8'?>"];
    [xmlString appendString:@"<root><xmlCommandSets><xmlCommandSet groupID=\"0\" Index=\"0\" cmdSorts=\"1\" id=\"1\" pid=\"0\" dbexe=\"new\"/></xmlCommandSets><xmlCommands>"];
    [xmlString appendFormat:@"<xmlCommand id=\"0\" commandType=\"%d\" tableName=\"%@\" paraSort=\"%@\" spID=\"%@\" keyName=\"%@\" /></xmlCommands>",type,tname,paraIDs,spid,keyname];
    xmlString = [NSMutableString stringWithString:[self createXmlParametersByMPList:MParameterList andSelectParameter:SParameter andXmlString:xmlString]];
    [xmlString appendString:@"</root>"];
    return xmlString;
}

//创建单条命令
+(NSMutableString *)createSimpleCommandByType:(CommandType)type andTableName:(NSString *)tname andKeyName:(NSString *)keyname andParameters:(NSMutableArray *)MParameterList andSelectParameter:(NSMutableDictionary *)SParameter{
    NSMutableString *xmlString = [NSMutableString stringWithString:@"<?xml version='1.0' encoding='UTF-8'?>"];
    [xmlString appendString:@"<root><xmlCommandSets><xmlCommandSet groupID=\"0\" Index=\"0\" cmdSorts=\"1\" id=\"1\" pid=\"0\" dbexe=\"new\"/></xmlCommandSets><xmlCommands>"];
    [xmlString appendFormat:@"<xmlCommand id=\"0\" commandType=\"%d\" tableName=\"%@\" paraSort=\"0\" spID=\"0\" keyName=\"%@\" /></xmlCommands>",type,tname,keyname];
    xmlString = [NSMutableString stringWithString:[self createXmlParametersByMPList:MParameterList andSelectParameter:SParameter andXmlString:xmlString]];
    [xmlString appendString:@"</root>"];
    return xmlString;
}

@end
