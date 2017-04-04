//
//  ForgotPasswordViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "SendAccessCodeViewController.h"

@interface ForgotPasswordViewController ()
- (IBAction)sendAccesButton:(id)sender;

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"Forgot Password";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];  //to dismiss keyboard
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
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

- (IBAction)sendAccesButton:(id)sender
{
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SendAccessCodeViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"SendAccessCodeViewController"];
    [self.navigationController pushViewController:controller animated:YES ];
}
@end
