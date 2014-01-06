//
//  XmlCommands.h
//  尚美酒
//
//  Created by tech-Yu-Mac on 14-1-5.
//  Copyright (c) 2014年 zwtym. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XmlCommands : NSObject

enum{
    Equality = 0,
    Inequality = 1,
    Greater = 2,
    Less = 3,
    GreaterOrEquality = 4,
    LessOrEquality = 5,
};
typedef NSUInteger ReleationShip;

+(NSMutableString *)createSimpleCommand:(NSMutableDictionary *)command andParameters:(NSMutableArray *)MParameterList andSelectParameter:(NSMutableDictionary *)SParameter;

+(NSMutableString *)createSimpleCommandByType:(NSString *)type andTableName:(NSString *)tname andParaSort:(NSString *)paraIDs andSelectPID:(NSString *)spid andKeyName:(NSString *)keyname andParameters:(NSMutableArray *)MParameterList andSelectParameter:(NSMutableDictionary *)SParameter;

+(NSMutableDictionary *)createParameterFieldsByName:(NSString *)name andValue:(NSString *)value andReleationShip:(NSString *)releat andAppend:(NSString *)append andIndex:(NSString *)index andType:(NSString *)type;

//生成包含多个参数和orderby参数的where条件
+(NSMutableDictionary *)createSelectParameterByID:(NSString *)spid andTops:(NSString *)top andPrimaryFieldList:(NSMutableArray *)primaryField andOrderByList:(NSMutableArray *)orderby;

//创建where条件的orderby命令
+(NSMutableDictionary *)createOrderByName:(NSString *)name andOrder:(NSString *)order andIndex:(NSString *)index andType:(NSString *)type;

//生成参数
+(NSMutableDictionary *)createModiParameterByID:(NSString *)paraID andFields:(NSMutableDictionary *)fields;

//生成多个参数
+(NSMutableDictionary *)createModiParameterByID:(NSString *)paraID andFieldList:(NSMutableArray *)fieldlist;

+(NSMutableDictionary *)createFieldByName:(NSString *)name andType:(NSString *)type andValue:(NSString *)value;


@end
