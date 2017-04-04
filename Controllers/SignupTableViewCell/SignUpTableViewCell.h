//
//  SignUpTableViewCell.h
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *maleBtn;
@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;
@property (weak, nonatomic) IBOutlet UITextField *signUpTextField;
@property (weak, nonatomic) IBOutlet UILabel *signUpLabel;

@end
