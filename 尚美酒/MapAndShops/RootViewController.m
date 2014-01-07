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
#import "XmlCommands.h"

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
    
    /*
    NSString *doubles1 = [NSString stringWithFormat:@"%f",_userLocation.latitude];
    NSString *doubles2 = [NSString stringWithFormat:@"%f",_userLocation.longitude];
    
    NSArray *parameter1 = [NSArray arrayWithObjects:doubles1,@"Double", nil];
    NSArray *parameter2 = [NSArray arrayWithObjects:doubles2,@"Double", nil];
    
    NSMutableDictionary *location = [[NSMutableDictionary alloc]init];
    [location setObject:parameter1 forKey:@"Latitude"];
    [location setObject:parameter2 forKey:@"Longitude"];
    
    NSMutableDictionary *object = [[NSMutableDictionary alloc]init];
    [object setObject:location forKey:@"object"];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@"Select" forKey:@"CommandType"];
    [dic setObject:object forKey:@"Parameters"];
    [dic setObject:@"1" forKey:@"Sort"];
    
    NSString *doubles3 = [NSString stringWithFormat:@"%f",_userLocation.latitude];
    NSString *doubles4 = [NSString stringWithFormat:@"%f",_userLocation.longitude];
    NSArray *parameter3 = [NSArray arrayWithObjects:doubles3,@"Double", nil];
    NSArray *parameter4 = [NSArray arrayWithObjects:doubles4,@"Double", nil];
    NSMutableDictionary *location1 = [[NSMutableDictionary alloc]init];
    [location1 setObject:parameter3 forKey:@"Latitude"];
    [location1 setObject:parameter4 forKey:@"Longitude"];
    
    NSMutableDictionary *object1 = [[NSMutableDictionary alloc]init];
    [object1 setObject:location1 forKey:@"object"];
    
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setObject:@"Select1" forKey:@"CommandType"];
    [dic1 setObject:object1 forKey:@"Parameters"];
    NSMutableArray *a = [NSMutableArray arrayWithObjects:dic,dic1, nil];
    NSString *xml = [XmlCommand CreatXmlCommands:a];
    
    //NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    //NSString *json = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSData *result = [SynchronousRequest synchronousPost:@"http://10.255.102.81:65433/test.aspx" postXMLString:xml];
     
     NSLog(@"%@",xml);
     NSArray *results = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
     
     for (NSMutableDictionary *shops in results)
     {
     annotations = [[NSMutableDictionary alloc]initWithDictionary:[shops objectForKey:@"Result"]];
     }
     */
    /*
    NSMutableDictionary *c = [[NSMutableDictionary alloc]init];
    [c setValue:@"654" forKey:@"time"];
    [c setValue:@"321" forKey:@"table"];
    
    NSMutableDictionary *d = [[NSMutableDictionary alloc]init];
    [d setValue:@"963" forKey:@"good"];
    [d setValue:@"852" forKey:@"jock"];
    
    NSMutableDictionary *b = [[NSMutableDictionary alloc]init];
    [b setValue:c forKey:@"job"];
    [b setValue:d forKey:@"hello"];
    
    NSMutableDictionary *a = [[NSMutableDictionary alloc]init];
    [a setValue:@"123" forKey:@"CommandType"];
    [a setValue:@"456" forKey:@"TextParameter"];
    [a setValue:@"789" forKey:@"TableName"];
    [a setValue:@"987" forKey:@"Sort"];
    [a setValue:b forKey:@"Parameters"];
     */
    [self addPointAnnotation];
//    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
//    [params setObject:[Objects SetParameterValue:@"1" andParameterType:Int32] forKey:@"ShopID"];
//    [params setObject:[Objects SetParameterValue:@"1" andParameterType:String] forKey:@"Bname"];
//    
//    NSMutableDictionary *object = [Objects CreateNewObject:@"object" Parameters:params];
//    
//    NSMutableDictionary *dic2 = [XmlCommand CreateCommand:@"Select" textParameter:@"ShopID = 1" tableName:@"Brand" keyName:@"BrandID" sort:@"1" parameters:object];
//    NSString *a = [XmlCommand CreatXmlCommand:dic2];
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
    
    NSMutableDictionary *sp = [XmlCommands createSelectParameterByID:@"0" andTops:@"" andPrimaryFieldList:pflist andOrderByList:ords];
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////生成单条XMLcommand命令，需要参数的列表对象PrimaryFieldList和where条件的列表对象OrderByList//////
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    NSMutableString *xml = [XmlCommands createSimpleCommandByType:Select andTableName:@"Brand" andParaSort:@"0" andSelectPID:@"0" andKeyName:@"Bname" andParameters:mp andSelectParameter:sp];
    
    NSLog(@"%@",xml);
}

-(void)addTopButtons
{
    UIView *buttons = [[UIView alloc]initWithFrame:CGRectMake(80, 7, 160, 30)];
    
    UIButton * list = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    list.frame = CGRectMake(0, 0, 80, 30);
    [list setTitle:@"列表" forState:UIControlStateNormal];
    [list addTarget:self action:@selector(pushtonewcontroller) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * map = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    map.frame = CGRectMake(80, 0, 80, 30);
    map.selected = YES;
    [map setTitle:@"地图" forState:UIControlStateSelected];
    
    
    [buttons addSubview:list];
    [buttons addSubview:map];
    
    [self.navigationController.navigationBar addSubview:buttons];
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

-(void)pushtonewcontroller{
    //SMJShopTableController * shopList = [[SMJShopTableController alloc]init];
    //[self.navigationController pushViewController:shopList animated:YES];
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
