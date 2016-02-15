//
//  MyUITableViewController.m
//  toDoManager
//
//  Created by DINGXIN YU on 13/02/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import "MyUITableViewController.h"
#import "ToDoEntity.h"
#import <CoreData/CoreData.h>
#import "MyTableViewCell.h"
#import "DPHandlesToDoEntity.h"
#import "DPHandlesMOC.h"

@interface MyUITableViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic)NSManagedObjectContext * managedObjectContext;

@property (strong, nonatomic)NSFetchedResultsController *resultsController;


@end

@implementation MyUITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeNSFetchedResultsControllerDelegate];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultsController.sections[section].numberOfObjects;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ToDoEntity *item = self.resultsController.sections[indexPath.section].objects[indexPath.row];

    MyTableViewCell *cell = (MyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableCellIdentifier" forIndexPath:indexPath];

    [cell setInternalFields:item];
    return cell;
}


#pragma mark - NSFetchedResultsControllerDelegate

-(void) initializeNSFetchedResultsControllerDelegate{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [NSEntityDescription entityForName:@"ToDoEntity" inManagedObjectContext:self.managedObjectContext];

    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
    fetchRequest.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"toDoDueDate" ascending:YES]];
    self.resultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.resultsController.delegate = self;

    NSError *err;
    BOOL fetchSucceeded = [self.resultsController performFetch:&err];
    if(!fetchSucceeded){
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Couldn't fetch" userInfo:nil];
    }
}

- (void) controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void) controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [[self tableView]insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [[self tableView]deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate: {
            MyTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            ToDoEntity *item = [controller objectAtIndexPath:indexPath];
            [cell setInternalFields:item];
            break;
        }
        case NSFetchedResultsChangeMove:
            [[self tableView]deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [[self tableView]insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void) controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id<DPHandlesMOC, DPHandlesToDoEntity> child = (id<DPHandlesMOC, DPHandlesToDoEntity>) [segue destinationViewController];
    [child receiveMOC:self.managedObjectContext];

    ToDoEntity *item;
    if ([sender isMemberOfClass:[UIBarButtonItem class]]) {
        item= [NSEntityDescription insertNewObjectForEntityForName:@"ToDoEntity" inManagedObjectContext:self.managedObjectContext];
    }
    else {
        MyTableViewCell *source = (MyTableViewCell *) sender;
        item = source.localToDoEntity;
    }

    [child receiveToDoEntity:item];
}


-(void) receiveMOC:(NSManagedObjectContext *)incomingMOC{
    self.managedObjectContext = incomingMOC;
}


@end
