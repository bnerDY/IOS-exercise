//
//  MyTableViewCell.h
//  toDoManager
//
//  Created by DINGXIN YU on 13/02/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoEntity.h"

@interface MyTableViewCell : UITableViewCell

@property (strong, nonatomic) ToDoEntity *localToDoEntity;
@property (weak, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoDueDateLabel;

-(void) setInternalFields: (ToDoEntity *)incomingToDoEntity;

@end
