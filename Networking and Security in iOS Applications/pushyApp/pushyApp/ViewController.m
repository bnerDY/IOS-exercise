//
//  ViewController.m
//  pushyApp
//
//  Created by DINGXIN YU on 04/03/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

-(void) requestPermissionToNotify;
-(void) createNotification:(int) secondsInTheFuture;

@end

@implementation ViewController
- (IBAction)scheduleTapped:(id)sender {
    [self requestPermissionToNotify];
    [self createNotification:15];
}

-(void) requestPermissionToNotify{
    UIMutableUserNotificationAction *floatAction =[[UIMutableUserNotificationAction alloc]init];
    floatAction.identifier = @"FLOAT_ACTION";
    floatAction.title = @"Float";
    floatAction.activationMode = UIUserNotificationActivationModeBackground;
    floatAction.destructive = YES;
    floatAction.authenticationRequired = NO;


    UIMutableUserNotificationAction *stingAction =[[UIMutableUserNotificationAction alloc]init];
    stingAction.identifier = @"STING_ACTION";
    stingAction.title = @"Sting";
    stingAction.activationMode = UIUserNotificationActivationModeForeground;
    stingAction.destructive = NO;
    stingAction.authenticationRequired = NO;

    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    category.identifier = @"MAIN_CATEGORY";
    [category setActions:@[floatAction, stingAction] forContext:UIUserNotificationActionContextDefault];

    NSSet *categories = [NSSet setWithObjects:category, nil];

    UIUserNotificationType types = UIUserNotificationTypeAlert| UIUserNotificationTypeBadge|UIUserNotificationTypeSound;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

-(void) createNotification:(int) secondsInTheFuture{
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    localNotif.fireDate = [[NSDate date] dateByAddingTimeInterval:secondsInTheFuture];
    localNotif.timeZone = nil;

    localNotif.alertTitle = @"Alert Title";
    localNotif.alertBody = @"Alert Body";
    localNotif.alertAction = @"Okay";
    localNotif.soundName = UILocalNotificationDefaultSoundName;

    localNotif.applicationIconBadgeNumber = 4123;
    localNotif.category = @"MAIN_CATEGORY";
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
