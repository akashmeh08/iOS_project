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
#import "ForgotPasswordViewController.h"
#import "Macro.h"
@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *loginEmailTextField;
@property (weak, nonatomic) IBOutlet UIButton *rememberMeBtn;
@property (strong, nonatomic) IBOutlet UITextField *loginPasswordTextField;
- (IBAction)forgotButton:(id)sender;


@end
@implementation LoginViewController
{
    UserInfo *mObj;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController setNavigationBarHidden:YES];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *userName = [defaults objectForKey:@"textField1Text"];
    NSString *password = [defaults objectForKey:@"textField2Text"];
    _loginEmailTextField.text = userName;
    _loginPasswordTextField.text = password;
    [_loginEmailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];  //to dismiss keyboard
     mObj = [[UserInfo alloc]init];
}
-(void)makeWebApiForLogin{
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] init];

    [params setValue:(self.loginEmailTextField.text) forKey:pEmail];

    [params setValue:(self.loginPasswordTextField.text) forKey:pPassword];

    [[ServiceHelper helper] request:params apiName:kApiLogin withToken:YES method:POST onViewController:self completionBlock:^(id result, NSError *error) {
        if([[result objectForKey:@_RESPONSE_CODE ] integerValue]== 200)
        {
            [NSUSERDEFAULT setValue:[result objectForKey:pUserId] forKey:@_USER_ID_LOCAL];
            [NSUSERDEFAULT synchronize];
                UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        SWRevealViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeScreen"];
                        [self.navigationController pushViewController:controller animated:YES ];
                  }
        else
        {
            [AlertController message:@_RESPONSE_MESSAGE onViewController:self];
        }
    }];
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
        [self makeWebApiForLogin];

    }
    else
    {
        [AlertController title:nil message:result onViewController:self];
    }

    
}
- (IBAction)signUpBtnAction:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignUpViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    
    [self.navigationController pushViewController:controller animated:YES ];
}


- (IBAction)onRemeberBtnAction:(UIButton*)sender {
    
    sender.selected = !sender.selected;
    
    if(_rememberMeBtn.isSelected == YES)
    {
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        NSString* textField1Text = (self.loginEmailTextField.text);
        [defaults setObject:textField1Text forKey:@"textField1Text"];
        
        NSString *textField2Text = (self.loginPasswordTextField.text);
        [defaults setObject:textField2Text forKey:@"textField2Text"];
        [defaults synchronize];
    }
    
}
- (IBAction)forgotButton:(id)sender
{
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ForgotPasswordViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"ForgotPasswordViewController"];
    [self.navigationController pushViewController:controller animated:YES ];

}
@end
