//
//  DPHandlesToDoEntity.h
//  toDoManager
//
//  Created by DINGXIN YU on 13/02/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoEntity.h"

@protocol DPHandlesToDoEntity <NSObject>

-(void) receiveToDoEntity: (ToDoEntity *)incomingToDoEntity;

@end
