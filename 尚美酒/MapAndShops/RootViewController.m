//
//  RootViewController.m
//  尚美酒
//
//  Created by Mac3 on 13-12-30.
//  Copyright (c) 2013年 zwtym. All rights reserved.
//

#import "RootViewController.h"
#import "SynchronousRequest.h"
#import "SMJAnno.h"
#import "SMJAnnotation.h"
#import "SMJShopTableController.h"

@interface RootViewController ()

@end

@implementation RootViewController{
    CLLocationCoordinate2D _userLocation;
    CLLocationManager *locationManager;
    NSMutableDictionary *annotations;
    BMKAnnotationView* newAnnotation;
    SMJAnnotation* newAnnotation1;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //获取当前的坐标信息
    locationManager = [[CLLocationManager alloc] init];
    [locationManager startUpdatingLocation];
    _mapView.delegate = self;
    
    _userLocation.latitude = _mapView.region.center.latitude;
    _userLocation.longitude = _mapView.region.center.longitude;
    
    [locationManager stopUpdatingLocation];
    
    NSLog(@"%f,%f",_userLocation.latitude,_userLocation.longitude);
    //查询条件
    [self addTopButtons];
    
    [self addPointAnnotation];
//    NSData *result = [SynchronousRequest synchronousPost:@"http://tech-qilin:8088/IOSInterface/Default.aspx" postXMLString:a];
//    NSDictionary *resultDate = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
//    NSLog(@"%@",resultDate);
    
    
    //////////////////////////////////////////////////////////////////////////
    ////生成参数的列表对象PrimaryFieldList//////////
    //////////////////////////////////////////////////////////////////////////
    
    NSMutableDictionary *field1 = [XmlCommands createFieldByName:@"Bname" andType:String andValue:@"尚美酒"];
    
    NSMutableArray *fields = [NSMutableArray arrayWithObjects:field1, nil];
    
    NSMutableDictionary *mp1 = [XmlCommands createModiParameterByID:@"0" andFieldList:fields];
    
    NSMutableArray *mp =[NSMutableArray arrayWithObjects:mp1, nil];
    
    ///////////////////////////////////////////////////////////////////////////
    ///生成where条件的列表对象OrderByList//////
    //////////////////////////////////////////////////////////////////////////
    
    NSMutableDictionary *pf = [XmlCommands createParameterFieldsByName:@"BID" andValue:@"1" andReleationShip:Equality andAppend:NONE andIndex:@"0" andType:Int32];
    
    NSMutableArray *pflist = [NSMutableArray arrayWithObjects:pf, nil];
    
    NSMutableDictionary *ord =[XmlCommands createOrderByName:@"Bname" andOrder:@"desc" andIndex:@"0" andType:String];
    
    NSMutableArray *ords = [NSMutableArray arrayWithObjects:ord, nil];
    
    NSMutableDictionary *sp = [XmlCommands createSelectParameterByID:@"0" andTops:@"" andPageSize:0 andPrimaryFieldList:pflist andOrderByList:ords];
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////生成单条XMLcommand命令，需要参数的列表对象PrimaryFieldList和where条件的列表对象OrderByList//////
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    NSMutableString *xml = [XmlCommands createSimpleCommandByType:Select andTableName:@"Brand" andParaSort:@"0" andSelectPID:@"0" andKeyName:@"Bname" andParameters:mp andSelectParameter:sp];
    
    NSLog(@"%@",xml);
}

-(void)addTopButtons
{
    //UIView *buttons = [[UIView alloc]initWithFrame:CGRectMake(80, 7, 160, 30)];
    
    UISegmentedControl *select = [[UISegmentedControl alloc]initWithFrame:CGRectMake(80, 7, 160, 30)];
    [select insertSegmentWithTitle:@"列表" atIndex:0 animated:YES];
    [select insertSegmentWithTitle:@"地图" atIndex:1 animated:YES];
    select.selectedSegmentIndex = 1;
    [select addTarget:self action:@selector(pushtonewcontroller:) forControlEvents:UIControlEventValueChanged];
    
//    UIButton * list = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    list.frame = CGRectMake(0, 0, 80, 30);
//    [list setTitle:@"列表" forState:UIControlStateNormal];
//    [list addTarget:self action:@selector(pushtonewcontroller) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIButton * map = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    map.frame = CGRectMake(80, 0, 80, 30);
//    map.selected = YES;
//    [map setTitle:@"地图" forState:UIControlStateSelected];
    
//    
//    [buttons addSubview:list];
//    [buttons addSubview:map];
    
    [self.navigationController.navigationBar addSubview:select];
    
}

- (void)addPointAnnotation
{
    
    BMKPointAnnotation* pointAnnotation4 = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor4;
    coor4.latitude = _userLocation.latitude;
    coor4.longitude = _userLocation.longitude;
    pointAnnotation4.coordinate = coor4;
    pointAnnotation4.title = @"您的位置";
    pointAnnotation4.subtitle = nil;
    //不用点击大头针就能显示泡泡信息。
    [_mapView addAnnotation:pointAnnotation4];
    //[_mapView selectAnnotation:pointAnnotation4 animated:YES];
    
    //NSArray * annotationArry = [NSArray arrayWithObjects:pointAnnotation,pointAnnotation1,pointAnnotation2,pointAnnotation3,pointAnnotation4, nil];
    //[_mapView addAnnotations:annotationArry];
    
    SMJAnno *anno = [[SMJAnno alloc]init];
    CLLocationCoordinate2D coor5;
    coor5.latitude = 39.875;
    coor5.longitude = 116.384;
    anno.coordinate= coor5;
    anno.title = @"6";
    anno.subtitle = @"my new annotation";
    anno.image = [UIImage imageNamed:@"classify_i02.png"];
    [_mapView addAnnotation:anno];
     
}

-(void)pushtonewcontroller:(id)sender{
    SMJShopTableController * shopList = [[SMJShopTableController alloc]init];
    UISegmentedControl * control = (UISegmentedControl *)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            [self.navigationController pushViewController:shopList animated:YES];
            break;
            
        default:
            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [_mapView viewWillAppear];
    _mapView.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark implement BMKMapViewDelegate

// 根据anntation生成对应的View
-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    NSString *AnnotationViewID = @"renameMark";
    if (newAnnotation == nil) {
        newAnnotation = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
        // 设置颜色
        ((BMKPinAnnotationView*)newAnnotation).pinColor = BMKPinAnnotationColorPurple;
        // 从天上掉下效果
		((BMKPinAnnotationView*)newAnnotation).animatesDrop = YES;
        // 设置可拖拽
		((BMKPinAnnotationView*)newAnnotation).draggable = YES;
        return newAnnotation;
    }
    else
    {
        if(![[annotation title]isEqualToString:@"1"]){
            newAnnotation = [_mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
            newAnnotation = [[SMJAnnotation alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
            SMJAnno *ann = (SMJAnno *)annotation;
            newAnnotation.image = ann.image;
            ((BMKPinAnnotationView*)newAnnotation).draggable = NO;
            return newAnnotation;
        }
        return newAnnotation1;
    }

}




@end
