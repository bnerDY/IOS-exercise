//
//  ToDoEntity+CoreDataProperties.h
//  toDoManager
//
//  Created by DINGXIN YU on 14/02/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDoEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *toDoTitle;
@property (nullable, nonatomic, retain) NSString *toDoDetails;
@property (nullable, nonatomic, retain) NSDate *toDoDueDate;

@end

NS_ASSUME_NONNULL_END
