//
//  CategoryViewController.m
//  Helposity
//
//  Created by Pushpraj Chaudhary on 23/01/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "CategoryViewController.h"
#import "Macro.h"
#import "Header.h"

@interface CategoryViewController (){
    
    NSMutableArray *categoryTitleArray, *categoryImageArray;
}

@property (strong, nonatomic) IBOutlet UITableView *categoryTableView;


@end

@implementation CategoryViewController

#pragma mark - UIView Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"CATEGORY";
    [self initialSetUp];
}

-(void)initialSetUp {
    
    //Set up for tableView

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
