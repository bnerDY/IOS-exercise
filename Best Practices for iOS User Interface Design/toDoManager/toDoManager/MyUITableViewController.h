//
//  MyUITableViewController.h
//  toDoManager
//
//  Created by DINGXIN YU on 13/02/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPHandlesMOC.h"

@interface MyUITableViewController : UITableViewController <DPHandlesMOC>

-(void) receiveMOC:(NSManagedObjectContext *)incomingMOC;


@end
