//
//  PrivacyPolicyViewController.m
//  Mobiloitte
//
//  Created by Sarvada Chauhan on 22/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "PrivacyPolicyViewController.h"

@interface PrivacyPolicyViewController ()
@property (weak, nonatomic) IBOutlet UITextView *PrivacyPolicyTextView;

@end

@implementation PrivacyPolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"About Us";
    [self.navigationController setNavigationBarHidden:NO];
    // Do any additional setup after loading the view.
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //[self.textViewOffset setContentOffset:CGPointZero animated:NO];
    [self.PrivacyPolicyTextView setContentOffset:CGPointZero animated:NO];
    //  [self.contactUsTextView setContentOffset:CGPointZero animated:NO];
    //  [self.privacyTextView setContentOffset:CGPointZero animated:NO];
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
