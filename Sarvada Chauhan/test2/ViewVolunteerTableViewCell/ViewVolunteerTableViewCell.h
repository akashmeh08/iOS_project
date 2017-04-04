//
//  ViewVolunteerTableViewCell.h
//  test2
//
//  Created by Sarvada Chauhan on 17/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewVolunteerTableViewCell : UITableViewCell

//@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *secondContentView;
@property (weak, nonatomic) IBOutlet UIButton *chatButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet ViewVolunteerTableViewCell *firstCellView;
@property (weak, nonatomic) IBOutlet UIView *secondViewCell;
@property (weak, nonatomic) IBOutlet UIButton *image;

@end
