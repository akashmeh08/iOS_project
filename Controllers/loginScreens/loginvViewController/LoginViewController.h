//
//  loginViewController.h
//  loginScreens
//
//  Created by Sarvada Chauhan on 15/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *rememberMeButton;
@property (weak, nonatomic) IBOutlet UIButton *checkBox;
- (IBAction)submitButton:(id)sender;

- (IBAction)signupButton:(id)sender;


@end
