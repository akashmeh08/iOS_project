//
//  UserListTableViewCell.h
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userListLabel;

@property (weak, nonatomic) IBOutlet UIButton *userListCheckBox;
@property (weak, nonatomic) IBOutlet UIImageView *userListImage;

@end
