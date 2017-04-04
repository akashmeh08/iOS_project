//
//  HomeVC.m
//  BaseProject
//
//  Created by Mobiloitte TRG on 09/03/17.

//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC () 

@property (weak, nonatomic) IBOutlet UILabel        * nameLabel;

@end

@implementation HomeVC

#pragma mark- Life Cycle of View Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDefaults];
    
    NSLog(@"shjdgjfgjehg===%@", [NSUSERDEFAULT objectForKey:@"kUserID"]);
    // Do any additional setup after loading the view.
}

#pragma mark - Class Helper Method

-(void)setupDefaults{
    
    [self.navigationItem setHidesBackButton:YES];
    [self.nameLabel setText:[[UserInfo sharedManager] fullName]];
}

#pragma mark - IBAction Method

-(IBAction)logoutButtonAction:(id)sender{
    
    [AlertController title:@"" message:@"Are you sure you want to logout?" andButtonsWithTitle:@[@"YES", @"NO"] onViewController:self dismissedWith:^(NSInteger index, NSString *buttonTitle) {
        
        if (!index)
            [self.navigationController popToRootViewControllerAnimated:YES];
    }];

}

#pragma mark - Did Receive Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
