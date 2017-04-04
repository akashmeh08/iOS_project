//
//  LoginViewController.m
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "Macro.h"
#import "LoginViewController.h"
#import "SignupViewController.h"
#import "HomeViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController]setNavigationBarHidden:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - keyboard movements
- (void)keyboardWillShow:(NSNotification *)notification
{
    int movementDistance = -90;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = movementDistance;
        self.view.frame = f;
    }];
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = 0.0f;
        self.view.frame = f;
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.returnKeyType==UIReturnKeyNext)
    {
        UITextField *tf=(UITextField *)[self.view viewWithTag:textField.tag+1];
        [tf becomeFirstResponder];
    }
    else
    {
        [self.view endEditing:YES];
    }
    return YES;
    
}

#pragma mark - Disable Keyboard

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}

- (IBAction)onClickCheckButton:(id)sender {
    UIButton *btn =(UIButton *) sender;
    btn.selected =!btn.selected;
}
- (IBAction)onSignUpClick:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignupViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"signup"];
     [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)onLoginClick:(id)sender;{
    NSString *res = @"Success";
    if([_emailTextField.text isEqualToString:@BLANK])
    {
        res =@BLANK_Email;
    }
    else if(![_emailTextField.text isValidEmail])
    {
        res=@VALID_EMAIL;
    }
    else if([_passwordTextField.text isEqualToString:@BLANK])
    {
        res=@BLANK_PASSWORD;
    }
        else if(_passwordTextField.text.length<6)
        {
            res=@MIN_PASSWORD;
        }
        else if(_passwordTextField.text.length>16)
        {
            res=@MAX_PASSWORD;
        }    if([res isEqualToString:@"Success"]){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HomeViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"home"];
    [self.navigationController pushViewController:controller animated:YES];
}
    else{
        [AlertController message:res onViewController:self];
    }
}



@end

