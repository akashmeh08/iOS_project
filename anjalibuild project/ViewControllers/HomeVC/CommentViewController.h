//
//  CommentViewController.h
//  BaseProject
//
//  Created by Anjali on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPKeyboardAvoidingTableView.h"

@interface CommentViewController : UIViewController

- (IBAction)sendButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
@property (weak, nonatomic) IBOutlet UIView *constraintsView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintViewBottom;
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingTableView *myTableView;

@end
