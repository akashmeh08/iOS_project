//
//  UserProfileTableViewCell.h
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "LabelSubClass.h"
#import <UIKit/UIKit.h>

@interface UserProfileTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet LabelSubClass *textFieldTitle;
@property (strong, nonatomic) IBOutlet UITextField *editTextField;

@end
