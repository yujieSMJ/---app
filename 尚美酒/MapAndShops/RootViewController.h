//
//  RootViewController.h
//  尚美酒
//
//  Created by Mac3 on 13-12-30.
//  Copyright (c) 2013年 zwtym. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"


@interface RootViewController : UIViewController<BMKMapViewDelegate>{
    
    __weak IBOutlet BMKMapView *_mapView;
}

@property (strong,nonatomic) NSMutableArray *annotationArray;
@property (strong,nonatomic) NSArray *infoListArray;
@property (strong, nonatomic) UITableView *tableView;

@end
