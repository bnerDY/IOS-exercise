//
//  MyUIViewController.h
//  toDoManager
//
//  Created by DINGXIN YU on 13/02/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPHandlesMOC.h"
#import "DPHandlesToDoEntity.h"


@interface MyUIViewController : UIViewController <DPHandlesMOC, DPHandlesToDoEntity>

- (void) receiveMOC:(NSManagedObjectContext *)incomingMOC;
- (void) receiveToDoEntity:(ToDoEntity *)incomingToDoEntity;

@end
