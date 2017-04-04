//
//  LoginViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "LoginViewController.h"
#import "Header.h"
@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *loginEmailTextField;
@property (strong, nonatomic) IBOutlet UITextField *loginPasswordTextField;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController]setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


- (IBAction)loginBtnAction:(id)sender {
    NSString *result = @Blank;
    if([_loginEmailTextField.text isEqualToString:@Blank])
    {
        result = @BLANK_EMAIL;
    }
    else if (![_loginEmailTextField.text isValidEmail ])
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
    
    [AlertController title:nil message:result onViewController:self];
 //   NSLog(@"%@",result);
    
}
- (IBAction)signUpBtnAction:(id)sender {
    
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
