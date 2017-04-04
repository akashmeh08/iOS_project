//
//  LikeTableViewCell.h
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LikeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *likeProfileImageView;
@property (strong, nonatomic) IBOutlet UILabel *likeProfileTitlelabel;
@property (strong, nonatomic) IBOutlet UIButton *likeCheckBoxBtn;


@end
