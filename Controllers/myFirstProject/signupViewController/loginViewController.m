//
//  loginViewController.m
//  myFirstProject
//
//  Created by Sarvada Chauhan on 09/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import "loginViewController.h"
#import "NSObject+NSString.h"
@interface loginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end
@implementation loginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.containerView.layer.borderColor=[UIColor colorWithRed:(218/255.0) green:(218/255.0) blue:(218/255.0) alpha:1.0].CGColor;
    //[self.navigationController.navigationBar setFrame:CGRectMake(0, 0, self.view.frame.size.width,200.0)];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"Begin Editing");
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField==_usernameTextField)
    {
        if([_usernameTextField inUser:string])
        {
            if(_usernameTextField.text.length >= 25 && range.length==0)
            {
                return NO;
            }
            
            return YES;
        }
        return NO;
    }
    
    if(textField==_passwordTextField)
    {
        if([_passwordTextField isValidPassword:string])
        {
            if(_passwordTextField.text.length >= 8 && range.length==0)
            {
                return NO;
            }
            return YES;
        }
        return NO;
    }
    return NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"End editing");
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.returnKeyType==UIReturnKeyNext) {
        UITextField *tf=(UITextField *)[self.view viewWithTag:textField.tag+1];
        [tf becomeFirstResponder];
    }else
    {
        [self.view endEditing:YES];
    }
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
