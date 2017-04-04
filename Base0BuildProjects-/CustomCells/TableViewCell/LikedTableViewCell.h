//
//  LikedTableViewCell.h
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LikedTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *profileTitleLabel;
@property (strong, nonatomic) IBOutlet UIButton *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end
