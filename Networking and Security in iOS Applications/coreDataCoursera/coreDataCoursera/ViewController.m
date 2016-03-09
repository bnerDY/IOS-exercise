//
//  ViewController.m
//  coreDataCoursera
//
//  Created by DINGXIN YU on 09/03/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ChoreMO.h"

@interface ViewController ()
@property (nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *choreField;
@property (weak, nonatomic) IBOutlet UILabel *persistenceData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.appDelegate = [[UIApplication sharedApplication] delegate];
    [self updateLogList];
}

- (IBAction)choreTapped:(id)sender {
    ChoreMO *c = [self.appDelegate createChoreMO];
    c.chore_name = self.choreField.text;
    [self.appDelegate saveContext];
    [self updateLogList];
}

- (IBAction)deleteTapped:(id)sender {
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Chore"];
    NSError *error = nil;

    NSArray *results = [moc executeFetchRequest:request error:&error];

    if(!results){
        NSLog(@"Error fetching Person objects: %@\n%@",[error localizedDescription], [error userInfo]);
        abort();
    }
    for (ChoreMO *c in results) {
        [moc deleteObject:c];
    }
    [self.appDelegate saveContext];
    [self updateLogList];
}

-(void) updateLogList{
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Chore"];
    NSError *error = nil;

    NSArray *results = [moc executeFetchRequest:request error:&error];

    if(!results){
        NSLog(@"Error fetching Person objects: %@\n%@",[error localizedDescription], [error userInfo]);
        abort();
    }
    NSMutableString *buffer = [NSMutableString stringWithString:@""];

    for (ChoreMO *c in results) {
        [buffer appendFormat:@"\n%@", c.chore_name, nil];
        NSLog(@"\n%@", c.chore_name);
    }
    self.persistenceData.text = buffer;
}

@end
