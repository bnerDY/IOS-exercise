//
//  MyUINavigationController.m
//  toDoManager
//
//  Created by DINGXIN YU on 13/02/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import "MyUINavigationController.h"

@interface MyUINavigationController ()

@property (strong, nonatomic)NSManagedObjectContext * managedObjectContenxt;

@end

@implementation MyUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) receiveMOC:(NSManagedObjectContext *)incomingMOC{
    self.managedObjectContenxt = incomingMOC;
    id<DPHandlesMOC> child = (id<DPHandlesMOC>) self.viewControllers[0];
    [child receiveMOC:self.managedObjectContenxt];
}

@end
