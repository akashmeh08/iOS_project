//
//  TableViewCell.h
//  loginScreens
//
//  Created by Sarvada Chauhan on 15/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
