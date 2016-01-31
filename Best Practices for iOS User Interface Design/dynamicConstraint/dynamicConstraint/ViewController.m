//
//  ViewController.m
//  dynamicConstraint
//
//  Created by DINGXIN YU on 31/01/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //init web page
    NSString *webURL = @"https://www.facebook.com/uniofqld/?fref=ts";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: webURL]];
    [self.webView loadRequest:request];

    double latitude = -27.4979;
    double longitude = 153.0133;

    MKPointAnnotation *wiclAnno = [[MKPointAnnotation alloc] init];
    wiclAnno.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    wiclAnno.title = @"University of Queensland";
    [self.mapView addAnnotation:wiclAnno];

    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(wiclAnno.coordinate, 10000, 10000);
    MKCoordinateRegion adjusted = [self.mapView regionThatFits:region];
    [self.mapView setRegion:adjusted animated:YES];



}

@end
