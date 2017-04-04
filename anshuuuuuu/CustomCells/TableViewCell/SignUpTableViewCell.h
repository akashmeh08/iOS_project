//
//  SignUpTableViewCell.h
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "LabelSubClass.h"
#import <UIKit/UIKit.h>

@interface SignUpTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *signupTextField;
@property (strong, nonatomic) IBOutlet LabelSubClass *signupTitleLabel;
@property (strong, nonatomic) IBOutlet UIButton *maleBtn;
@property (strong, nonatomic) IBOutlet UIButton *femaleBtn;

@property (strong, nonatomic) IBOutlet UIButton *termsCheckBtn;

@end
