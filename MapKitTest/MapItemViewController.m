//
//  MapItemViewController.m
//  MapKitTest
//
//  Created by THIAGO PEREIRA on 6/28/13.
//  Copyright (c) 2013 THIAGO PEREIRA. All rights reserved.
//

#import "MapItemViewController.h"
#define METERS_PER_MILE 1609.344

@interface MapItemViewController ()

@end

@implementation MapItemViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getDirections:(id)sender {
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    NSString *addressString = [NSString stringWithFormat:@"%@ %@ %@ %@",
                               _street.text,
                               _city.text,
                               _state.text,
                               _zip.text];
    
    [geocoder geocodeAddressString:addressString
                 completionHandler:^(NSArray *placemarks, NSError *error) {
                     
                     if (error) {
                         NSLog(@"Geocode failed with error: %@", error);
                         return;
                     }
                     
                     if (placemarks && placemarks.count > 0)
                     {
                         CLPlacemark *placemark = placemarks[0];
                         
                         CLLocation *location = placemark.location;
                         _coordinates = location.coordinate;
                         _coordinates = location.coordinate;
                         
                         [self showMap];
                     }
                 }];
}

- (void)showMap{
    NSDictionary *address = @{
                              (NSString *)kABPersonAddressStreetKey: _street.text,
                              (NSString *)kABPersonAddressCityKey: _city.text,
                              (NSString *)kABPersonAddressStateKey: _state.text,
                              (NSString *)kABPersonAddressZIPKey: _zip.text
                              };
    
    MKPlacemark *place = [[MKPlacemark alloc]
                          initWithCoordinate:_coordinates
                          addressDictionary:address];
    
    MKMapItem *mapItem = [[MKMapItem alloc]initWithPlacemark:place];
        
    NSDictionary *options = @{
                              MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving
                              };
    
    //[mapItem openInMapsWithLaunchOptions:options];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(_coordinates, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    [_mapView setRegion:viewRegion animated:YES];
}

- (IBAction)hideKeyboard:(id)sender {
    [_street resignFirstResponder];
    [_city resignFirstResponder];
    [_state resignFirstResponder];
    [_zip resignFirstResponder];
}

@end
