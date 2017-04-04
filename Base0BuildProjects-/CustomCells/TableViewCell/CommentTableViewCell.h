//
//  CommentTableViewCell.h
//  BaseProject
//
//  Created by Mobiloitte on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "LabelSubClass.h"
#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet LabelSubClass *profileTitleLabel;
@property (strong, nonatomic) IBOutlet LabelSubClass *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end
