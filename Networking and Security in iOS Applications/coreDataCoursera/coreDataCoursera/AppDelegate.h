//
//  AppDelegate.h
//  coreDataCoursera
//
//  Created by DINGXIN YU on 09/03/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ChoreMO.h"
#import "PersonMO.h"
#import "ChoreLogMO.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

-(ChoreMO *) createChoreMO;

-(PersonMO *) createPersonMO;

-(ChoreLogMO *) createChoreLogMO;


@end

