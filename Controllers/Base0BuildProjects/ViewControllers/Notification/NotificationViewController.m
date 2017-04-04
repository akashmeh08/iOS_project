//
//  NotificationViewController.m
//  Helposity
//
//  Created by Abhishek Agarwal on 21/01/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "NotificationViewController.h"
#import "Header.h"



@interface NotificationViewController () {
    

}



@end

@implementation NotificationViewController

#pragma mark - UIView Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationItem.title = @"NOTIFICATIONS";
    [self initialSetUp];
 
}

-(void)initialSetUp {

    //Set up for tableView
   }

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
