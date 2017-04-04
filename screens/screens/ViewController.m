//
//  ViewController.m
//  screens
//
//  Created by Sarvada Chauhan on 24/02/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+categoryFile.h"

@interface ViewController ()
@property(weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.containerView.layer.borderColor=[UIColor colorWithRed:(218/255.0) green:(218/255.0) blue:(218/255.0) alpha:1.0].CGColor;
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField==_userNameTextField)
    {
        if([_userNameTextField inUser:string])
        {
            return YES;
        }
        return NO;
    }
        if(textField==_passwordTextField)
        {
            if([_passwordTextField isValidPassword:string])
            {
                return YES;
            }
            return NO;
        }
    return NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
