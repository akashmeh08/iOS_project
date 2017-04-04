//
//  CommentViewController.h
//  BaseProject
//
//  Created by Mobiloitte on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *messageTextField;
- (IBAction)onSendBtnAction:(id)sender;

@end
