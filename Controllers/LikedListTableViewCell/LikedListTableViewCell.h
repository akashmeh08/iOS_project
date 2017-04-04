//
//  LikedListTableViewCell.h
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LikedListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *likedListNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *likedListTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *likedListImage;

@end
