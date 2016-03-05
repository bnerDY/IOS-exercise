//
//  AppDelegate.m
//  pushyApp
//
//  Created by DINGXIN YU on 04/03/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    application.applicationIconBadgeNumber = 0;
    UILocalNotification *localNotif = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotif) {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Receive on luanch" message:localNotif.alertBody preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *aa = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];

        [ac addAction:aa];

        dispatch_async(dispatch_get_main_queue(), ^{
            [application.keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
        });
    }
    return YES;
}


-(void) application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler{
    application.applicationIconBadgeNumber = 0;
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Receive on action" message:identifier preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *aa = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];

    [ac addAction:aa];

    dispatch_async(dispatch_get_main_queue(), ^{
        [application.keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
    });
    completionHandler();
}

-(void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    application.applicationIconBadgeNumber = 0;
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Receive while running" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *aa = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];

    [ac addAction:aa];

    dispatch_async(dispatch_get_main_queue(), ^{
        [application.keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
    });
}
@end
