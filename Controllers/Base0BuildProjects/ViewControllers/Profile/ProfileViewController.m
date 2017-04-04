//
//  ProfileViewController.m
//  Helposity
//
//  Created by Abhishek Agarwal on 21/01/17.

//  Copyright © 2017 Mobiloitte. All rights reserved.

#import "ProfileViewController.h"


@interface ProfileViewController () <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
}

@property (strong, nonatomic) IBOutlet UIView *tableHeaderView;

@property (strong, nonatomic) IBOutlet UITableView *profileTableView;

@property (strong, nonatomic) IBOutlet UIButton *userImageButton;
@property (strong, nonatomic) IBOutlet UILabel *nameLbl;
@property (strong, nonatomic) IBOutlet UITextField *nameField;

@property (strong, nonatomic) IBOutlet UIButton *locationbtn;


@end

@implementation ProfileViewController

#pragma mark - UIView Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"PROFILE";
    
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(settingAction:)];
    
    [self initialSetUp];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

-(void)initialSetUp {
    
    //Store image and title
   
}


#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
