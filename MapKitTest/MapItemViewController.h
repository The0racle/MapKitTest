//
//  MapItemViewController.h
//  MapKitTest
//
//  Created by THIAGO PEREIRA on 6/28/13.
//  Copyright (c) 2013 THIAGO PEREIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>

@interface MapItemViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *street;
@property (strong, nonatomic) IBOutlet UITextField *city;
@property (strong, nonatomic) IBOutlet UITextField *state;
@property (strong, nonatomic) IBOutlet UITextField *zip;
@property CLLocationCoordinate2D coordinates;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)getDirections:(id)sender;
- (void)showMap;
- (IBAction)hideKeyboard:(id)sender;

@end
