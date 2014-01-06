//
//  XmlCommand.h
//  尚美酒
//
//  Created by Mac3 on 13-12-31.
//  Copyright (c) 2013年 zwtym. All rights reserved.
//

#import <Foundation/Foundation.h>


//对象类：对象的名称／对象的参数
@interface Objects : NSObject

enum{
    Int32 = 0,
    String = 1,
    Double = 2,
    Boolen = 3,
    DataTime = 4,
    Decimal = 5,
};
typedef NSUInteger ParameterType;

/*实例化对象的方法
 @method         CreateNewObject:Parameters:
 @discussion        生成一个包含参数／类型／值的对象
 @param  Name   对象名称.
 @param  parameters   对象参数的字典实例.
 @result    返回一个包含参数／类型／值的字典对象。要生成多个对象，用传统方法
 */
+(NSMutableDictionary *)CreateNewObject:(NSString *)Name Parameters:(NSMutableDictionary *)parameters;

/*
 @result 返回一个包含值／类型名称的二元素的数组
 */
+(NSArray *)SetParameterValue:(NSString *)value andParameterType:(ParameterType)parameterType;

@end

//命令类
@interface XmlCommand : NSObject

/*
 @method  CreateCommand:textParameter:tableName:keyName:sort:parameters:
 @discussion  生成单个字典格式的命令
 @param  CommandType   包含命令的类型.
 @param  TextParameter   包含命令的where条件.
 @param  TableName   包含命令的表名.
 @param  KeyName   包含命令表的主键.
 @param  Sort   包含命令的索引.
 @param  Parameters   包含命令对象.
 @result  返回一个字典格式的命令
 */
+(NSMutableDictionary *)CreateCommand:(NSString *)CommandType textParameter:(NSString *)TextParameter tableName:(NSString *)TableName keyName:(NSString *)KeyName sort:(NSString *)Sort parameters:(NSMutableDictionary *)Parameters;
/*
 @method    CreatXmlCommand:
 @discussion    生成单个XML格式的命令
 @param  command    包含命令的字典对象.
 @result    返回单条命令的XML格式的字符串
 */
+(NSString *)CreatXmlCommand:(NSMutableDictionary *)command;
/*
 @method     CreatXmlCommands:
 @discussion     生成一个XML格式的字符串
 @param  commandlist   包含多个命令字典的数组对象.
 @result    返回多条命令的XML格式的字符串
 */
+(NSString *)CreatXmlCommands:(NSMutableArray *)commandlist;


@end
