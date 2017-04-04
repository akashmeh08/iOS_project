//
//  HomeTableViewCell.h
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "LabelSubClass.h"
#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *homeProfileImageView;
@property (strong, nonatomic) IBOutlet LabelSubClass *homeProfileTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *homeTimeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *feedImageView;
@property (strong, nonatomic) IBOutlet LabelSubClass *homeDescriptionText;
@property (strong, nonatomic) IBOutlet UIButton *homeLikeBtn;
@property (strong, nonatomic) IBOutlet UIButton *homeCommentBtn;
@property (strong, nonatomic) IBOutlet UIButton *homeShareBtn;

@end
