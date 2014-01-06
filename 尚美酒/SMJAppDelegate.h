//
//  SMJAppDelegate.h
//  尚美酒
//
//  Created by Mac3 on 13-12-24.
//  Copyright (c) 2013年 zwtym. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface SMJAppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate>{
    BMKMapManager *_mapManager;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet UITabBarController *SMJRootController;

@end
