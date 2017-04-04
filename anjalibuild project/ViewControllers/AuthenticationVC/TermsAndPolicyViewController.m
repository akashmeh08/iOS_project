//
//  TermsAndPolicyViewController.m
//  BaseProject
//
//  Created by Anjali on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "TermsAndPolicyViewController.h"

@interface TermsAndPolicyViewController ()

@end

@implementation TermsAndPolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"Terms and Policies";
    
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
