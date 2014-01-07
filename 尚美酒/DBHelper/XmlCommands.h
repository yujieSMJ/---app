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
    Insert = 0,
    Delete = 1,
    Updata = 2,
    Select = 3,
    Paging = 4,
};
typedef NSUInteger CommandType;

enum{
    Equality = 0,
    Inequality = 1,
    Greater = 2,
    Less = 3,
    GreaterOrEquality = 4,
    LessOrEquality = 5,
};
typedef NSUInteger ReleationShip;

enum{
    NONE = 0,
    AND = 1,
    OR = 2,
};
typedef NSUInteger AppendType;

enum{
    Int32 = 0,
    String = 1,
    Double = 2,
    Boolen = 3,
    DataTime = 4,
    Decimal = 5,
};
typedef NSUInteger ParameterType;


+(NSMutableString *)createSimpleCommand:(NSMutableDictionary *)command andParameters:(NSMutableArray *)MParameterList andSelectParameter:(NSMutableDictionary *)SParameter;

+(NSMutableString *)createSimpleCommandByType:(CommandType)type andTableName:(NSString *)tname andParaSort:(NSString *)paraIDs andSelectPID:(NSString *)spid andKeyName:(NSString *)keyname andParameters:(NSMutableArray *)MParameterList andSelectParameter:(NSMutableDictionary *)SParameter;

+(NSMutableDictionary *)createParameterFieldsByName:(NSString *)name andValue:(NSString *)value andReleationShip:(ReleationShip)releat andAppend:(AppendType)append andIndex:(NSString *)index andType:(ParameterType)type;

//生成包含多个参数和orderby参数的where条件
+(NSMutableDictionary *)createSelectParameterByID:(NSString *)spid andTops:(NSString *)top andPageSize:(NSUInteger)size andPrimaryFieldList:(NSMutableArray *)primaryField andOrderByList:(NSMutableArray *)orderby;

+(NSMutableDictionary *)createSelectParameterByPFieldList:(NSMutableArray *)primaryField andOrderByList:(NSMutableArray *)orderby;

//创建where条件的orderby命令
+(NSMutableDictionary *)createOrderByName:(NSString *)name andOrder:(NSString *)order andIndex:(NSString *)index andType:(CommandType)type;

//生成参数
+(NSMutableDictionary *)createModiParameterByID:(NSString *)paraID andFields:(NSMutableDictionary *)fields;

//生成多个参数
+(NSMutableDictionary *)createModiParameterByID:(NSString *)paraID andFieldList:(NSMutableArray *)fieldlist;

+(NSMutableDictionary *)createFieldByName:(NSString *)name andType:(CommandType)type andValue:(NSString *)value;


@end
