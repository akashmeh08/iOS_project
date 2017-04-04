//
//  BaseVC.m
//  BaseProject
//
//  Created by Sunil Verma on 17/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "BaseVC.h"

#import "SFCenterButton.h"
#import "OrderBaseVC.h"
#import "HomeViewController.h"
#import "ProfileViewController.h"
#import "NotificationViewController.h"
#import "HomeViewController.h"
#import "CategoryViewController.h"

typedef NS_ENUM(NSUInteger, SelectedTab) {
    
    SelectedTabHome=1,
    SelectedTabNotification,
    SelectedTabCategory,
    SelectedTabOrder,
    SelectedTabProfile,
};


@interface BaseVC ()

@property (nonatomic, strong) UINavigationController *currentNC;
@property (nonatomic, strong) UINavigationController *homeNC;
@property (nonatomic, strong) UINavigationController *categoryNC;
@property (nonatomic, strong) UINavigationController *notificationNC;
@property (nonatomic, strong) UINavigationController *profileNC;
@property (nonatomic, strong) UINavigationController *orderNC;


@property (nonatomic, weak) IBOutlet UIView *containerView;

@property (nonatomic, assign) SelectedTab selectedTab;

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeController];
}



-(void)initializeController {
    
    
    NotificationViewController * notificationVC = [[NotificationViewController alloc] initWithNibName:@"NotificationViewController" bundle:nil];
    ProfileViewController *profileVC = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
    CategoryViewController *categoryVC = [[CategoryViewController alloc] initWithNibName:@"CategoryViewController" bundle:nil];
    HomeViewController * homeVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    OrderBaseVC * orderVC = [[OrderBaseVC alloc] initWithNibName:@"OrderBaseVC" bundle:nil];
    
    self.homeNC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    self.orderNC = [[UINavigationController alloc] initWithRootViewController:orderVC];
    
    self.notificationNC = [[UINavigationController alloc] initWithRootViewController:notificationVC];
    
    self.categoryNC = [[UINavigationController alloc] initWithRootViewController:categoryVC];
    
    self.profileNC = [[UINavigationController alloc] initWithRootViewController:profileVC];
    
    [self updateNavigationBar:self.profileNC];
    [self updateNavigationBar:self.homeNC];
    [self updateNavigationBar:self.notificationNC];
    [self updateNavigationBar:self.categoryNC];
    [self updateNavigationBar:self.orderNC];
    
    
    [(SFCenterButton*)[self.view viewWithTag:SelectedTabHome]  setSelected:YES];
    
    [self updateChildMenuController:SelectedTabHome];
    
}

-(void)updateNavigationBar:(UINavigationController *)navController
{
    navController.navigationBar.translucent = NO;
    
    navController.navigationBar.tintColor = [UIColor redColor];
    [navController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor], NSFontAttributeName :[UIFont systemFontOfSize:14]}];
    
}

-(IBAction)tabBtnAction:(SFCenterButton *)sender
{
    [self updateChildMenuController:sender.tag];
    
    for (int index = 1; index <= 5; index ++) {
        
        if (sender.tag == index) {
            
            [(SFCenterButton*)[self.view viewWithTag:index]  setSelected:YES];
        }else
        {
            [(SFCenterButton*)[self.view viewWithTag:index]  setSelected:NO];
            
        }
    }
    
}



-(void)updateChildMenuController:(SelectedTab)selectedIndex {
    
    
    if (selectedIndex == self.selectedTab) {
        [self.currentNC popToRootViewControllerAnimated:NO];
        return;
    }
    
    [self.containerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    switch (selectedIndex) {
            
        case SelectedTabHome: {
            
            self.currentNC = self.homeNC;
            self.homeNC.title = @"Home";
        }
            break;
        case SelectedTabNotification: {
            self.currentNC = self.notificationNC;
            self.notificationNC.title = @"Notification";
        }
            break;
        case SelectedTabCategory: {
            
            self.currentNC = self.categoryNC;
            self.categoryNC.title = @"Category";
        }
            break;
        case SelectedTabOrder: {
            
            self.currentNC = self.orderNC;
            self.orderNC.title = @"My Order";
        }
            break;
            
            
        case SelectedTabProfile: {
            self.currentNC = self.profileNC;
            self.profileNC.title = @"Profile";
        }
            break;
            
            
        default:
            break;
    }
    self.selectedTab =selectedIndex;
    
    [self.currentNC setNavigationBarHidden:NO];
    self.currentNC.view.frame = self.containerView.bounds;
    [self.containerView addSubview:self.currentNC.view];
    [self addChildViewController:self.currentNC];
    [self.currentNC didMoveToParentViewController:self];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
