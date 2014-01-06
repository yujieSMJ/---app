//
//  SMJAnnotation.h
//  尚美酒
//
//  Created by Mac3 on 13-12-31.
//  Copyright (c) 2013年 zwtym. All rights reserved.
//

#import "BMKAnnotationView.h"
#include "BMapKit.h"

@protocol AnnotationViewProtocol <NSObject>

- (void)didSelectAnnotationViewInMap:(BMKMapView *)mapView;
- (void)didDeselectAnnotationViewInMap:(BMKMapView *)mapView;

@end

@interface SMJAnnotation : BMKAnnotationView<AnnotationViewProtocol,BMKMapViewDelegate>

@end
