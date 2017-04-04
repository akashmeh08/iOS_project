//
//  HomeViewController.m
//  Helposity
//
//  Created by Abhishek Agarwal on 24/01/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "GraphVC.h"




@interface HomeViewController ()  {
    
   
    
}

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, weak) IBOutlet UIImageView *floatingImageView;
@property (nonatomic, assign) BOOL  isTouchMove;
@end

@implementation HomeViewController

#pragma mark - UIView Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"HOME";
    
 
    [self initialSetup];
    
   
    
}

#pragma mark - Custom Method

- (void)initialSetup {
    
    
   
}


-(IBAction)navigateToGraph
{
    GraphVC *objVC = [[GraphVC alloc] initWithNibName:@"GraphVC" bundle:nil];
    
    [self.navigationController pushViewController:objVC animated:YES];
    
    
}


#pragma mark - Memory Warning Method

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
