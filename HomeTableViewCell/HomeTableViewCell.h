//
//  HomeTableViewCell.h
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *homeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *homeProfileImage;
@property (weak, nonatomic) IBOutlet UIImageView *uploadedImage;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;



@end
