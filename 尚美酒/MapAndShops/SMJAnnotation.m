//
//  SMJAnnotation.m
//  尚美酒
//
//  Created by Mac3 on 13-12-31.
//  Copyright (c) 2013年 zwtym. All rights reserved.
//

#import "SMJAnnotation.h"

@implementation SMJAnnotation

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if(self){
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)didSelectAnnotationViewInMap:(BMKMapView *)mapView{
    NSLog(@"didselected!");
}
- (void)didDeselectAnnotationViewInMap:(BMKMapView *)mapView{
    NSLog(@"no selected");
}

@end
