//
//  DPHandlesMOC.h
//  toDoManager
//
//  Created by DINGXIN YU on 13/02/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DPHandlesMOC <NSObject>

-(void) receiveMOC: (NSManagedObjectContext *)incomingMOC;

@end
