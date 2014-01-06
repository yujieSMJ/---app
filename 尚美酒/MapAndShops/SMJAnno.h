//
//  SMJAnno.h
//  尚美酒
//
//  Created by Mac3 on 13-12-31.
//  Copyright (c) 2013年 zwtym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMapKit.h"

@interface SMJAnno : NSObject<BMKAnnotation>

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;

@end
