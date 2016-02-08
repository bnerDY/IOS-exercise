//
//  ViewController.m
//  mapMyPoints
//
//  Created by DINGXIN YU on 08/02/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//
#import "MapKit/MapKit.h"
#import "ViewController.h"

@interface ViewController () <MKMapViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) MKPointAnnotation *luciAnno;
@property (strong, nonatomic) MKPointAnnotation *wiclAnno;
@property (strong, nonatomic) MKPointAnnotation *gradientAnno;
@property (strong, nonatomic) MKPointAnnotation *currentAnno;
@property (weak, nonatomic) IBOutlet UISwitch *switchField;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, assign) BOOL mapIsMoving;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    self.mapIsMoving = NO;
    [self addAnnotations];

}

- (IBAction)luciTapped:(id)sender {
    [self centerMap:self.luciAnno];
}
- (IBAction)wiclTapped:(id)sender {
    [self centerMap:self.wiclAnno];
}
- (IBAction)gradientTapped:(id)sender {
    [self centerMap:self.gradientAnno];
}
- (IBAction)switchChanged:(id)sender {
    if (self.switchField.isOn) {
        self.mapView.showsUserLocation = YES;
        [self.locationManager startUpdatingLocation];
    } else{
        self.mapView.showsUserLocation = NO;
        [self.locationManager stopUpdatingLocation];
    }
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.currentAnno.coordinate = locations.lastObject.coordinate;

    if (self.mapIsMoving == NO) {
        [self centerMap:self.currentAnno];
    }
}


- (void) centerMap:(MKPointAnnotation *)centerPoint{
    [self.mapView setCenterCoordinate:centerPoint.coordinate animated:YES];
}

- (void) addAnnotations{
    self.luciAnno = [[MKPointAnnotation alloc] init];
    self.luciAnno.coordinate = CLLocationCoordinate2DMake(53.444, -2.2143);
    self.luciAnno.title = @"The University of Manchester";

    self.wiclAnno = [[MKPointAnnotation alloc] init];
    self.wiclAnno.coordinate = CLLocationCoordinate2DMake(51.751944, -1.257778);
    self.wiclAnno.title = @"Oxford University";

    self.gradientAnno = [[MKPointAnnotation alloc] init];
    self.gradientAnno.coordinate = CLLocationCoordinate2DMake(52.2052, 0.1081);
    self.gradientAnno.title = @"University of Cambridge";


    self.currentAnno = [[MKPointAnnotation alloc] init];
    self.currentAnno.coordinate = CLLocationCoordinate2DMake(0.0, 0.0);
    self.currentAnno.title = @"My Location";

    [self.mapView addAnnotations:@[self.luciAnno, self.wiclAnno, self.gradientAnno]];
}


- (void) mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    self.mapIsMoving = NO;
}


@end
