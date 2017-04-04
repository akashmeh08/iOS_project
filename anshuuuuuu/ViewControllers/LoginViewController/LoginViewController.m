//
//  LoginViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "LoginViewController.h"
#import "Header.h"
#import "SWRevealViewController.h"
#import "SignUpViewController.h"
@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *loginEmailTextField;
@property (strong, nonatomic) IBOutlet UITextField *loginPasswordTextField;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    _loginEmailTextField.layer.borderWidth = 1;
    _loginPasswordTextField.layer.borderColor = [UIColor colorWithRed:(199/255.0) green:(199/255.0) blue:(199/255.0) alpha:1.0].CGColor;
    _loginEmailTextField.layer.borderColor = [UIColor colorWithRed:(199/255.0) green:(199/255.0) blue:(199/255.0) alpha:1.0].CGColor;
    _loginPasswordTextField.layer.borderWidth = 1;
    
    _loginEmailTextField .layer.sublayerTransform=CATransform3DMakeTranslation(6.0f, 1.0f, 1.0f);
    _loginPasswordTextField .layer.sublayerTransform=CATransform3DMakeTranslation(6.0f, 1.0f, 1.0f);
    
    [_loginEmailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
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
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    _loginEmailTextField.text = @Blank;
    _loginPasswordTextField.text = @Blank;
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
/*- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
        if (textField.text.length + string.length >=64 && range.length == 0)
    {
        return NO;
    }
    else
    {
        return YES;
    }
    
}*/

- (IBAction)loginBtnAction:(id)sender {
    NSString *result = @"Success";
    if([_loginEmailTextField.text isEqualToString:@Blank])
    {
        result = @BLANK_EMAIL;
    }
    else if ([_loginEmailTextField.text isValidEmail ])
    {
        result = @VALID_EMAIL ;
    }
    else if([_loginPasswordTextField.text isEqualToString:@Blank])
    {
        result = @BLANK_PASSWORD;
    }
    else if(_loginPasswordTextField.text.length < 6)
    {
        result = @VALID_PASSWORD;
    }
    if([result isEqualToString:@"Success"])
    {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SWRevealViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeScreen"];
        
        [self.navigationController pushViewController:controller animated:YES ];
    }
    else
    {
        [AlertController title:nil message:result onViewController:self];
    }
 //   NSLog(@"%@",result);
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // NSLog(@"old value= %@",textField.text);
    // NSLog(@"New value = %@",string);
    
    if (textField.text.length + string.length >=64 && range.length == 0)
    {
        return NO; // return NO to not change text
    }
    else
    {
        return YES;
    }
    
    
       // return !([newString length] > 4);
      return YES;
}
- (IBAction)signUpBtnAction:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignUpViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    
    [self.navigationController pushViewController:controller animated:YES ];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onRemeberBtnAction:(UIButton*)sender {
    
    sender.selected = !sender.selected;
}
@end
