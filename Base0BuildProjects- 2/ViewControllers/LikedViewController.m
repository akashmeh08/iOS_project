//
//  LikedViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//


#import "Header.h"
@interface LikedViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *likedTableView;
@property (weak, nonatomic) IBOutlet UILabel *lableLiked;

@end

@implementation LikedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"Liked list";

    self.likedTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.likedTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LikedTableViewCell *cell = (LikedTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.profileImageView.layer.borderWidth = 1;
    cell.profileImageView.layer.cornerRadius = 15;
    cell.profileImageView.clipsToBounds = YES;
    //cell.likeCheckBoxBtn.tag = 900 + indexPath.row;
    //[cell.likeCheckBoxBtn addTarget:self action:@selector(onCheckBoxBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.profileImageView.tag = 100 +indexPath.row;
    [cell.profileImageView addTarget:self action:@selector(onImageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    switch (indexPath.row) {
        case 0:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"girl4"] forState:UIControlStateNormal];
            cell.profileTitleLabel .text = @"Sarvada Chauhan";
           cell.timeLabel.text = @"6 min ago.";
            return cell;
            break;
            
        case 1:
           [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man2"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Atul Sharma";
           cell.timeLabel.text = @"8 min ago.";

            return cell;
            break;
        case 2:
           [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"girl3"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Priya srivastava";
            cell.timeLabel.text = @"10 min ago.";
            return cell;
            break;
        case 3:
          [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Manoj Kumar Singh";
            cell.timeLabel.text = @"15 min ago.";
            return cell;
            break;
        case 4:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"girl2"] forState:UIControlStateNormal];
            cell.profileTitleLabel .text = @"Kritu Singh";
            cell.timeLabel.text = @"6 min ago.";
            return cell;
            break;
            
        case 5:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"girl1"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Anshu agrawal";
            cell.timeLabel.text = @"8 min ago.";
            
            return cell;
            break;
        case 6:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"girl4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Pia Oberoy";
            cell.timeLabel.text = @"10 min ago.";
            return cell;
            break;
        case 7:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man2"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Manoj Kumar Singh";
            cell.timeLabel.text = @"15 min ago.";
            return cell;
            break;

        case 8:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"girl4"] forState:UIControlStateNormal];
            cell.profileTitleLabel .text = @"Kirti Singh";
            cell.timeLabel.text = @"6 min ago.";
            return cell;
            break;
            
        case 9:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man2"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Ashish Singh";
            cell.timeLabel.text = @"8 min ago.";
            
            return cell;
            break;
        case 10:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"girl3"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Anu Singh";
            cell.timeLabel.text = @"10 min ago.";
            return cell;
            break;
        case 11:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Anshika Jha";
            cell.timeLabel.text = @"15 min ago.";
            return cell;
            break;
        case 12:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"girl2"] forState:UIControlStateNormal];
            cell.profileTitleLabel .text = @"Ritu Goel";
            cell.timeLabel.text = @"6 min ago.";
            return cell;
            break;
            
        case 13:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"girl1"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Anjali Singhal";
            cell.timeLabel.text = @"8 min ago.";
            
            return cell;
            break;
        case 14:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"girl4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Sonika Singh";
            cell.timeLabel.text = @"10 min ago.";
            return cell;
            break;
        default:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man5"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Akash Mehrotra";
            cell.timeLabel.text = @"15 min ago.";
            return cell;
            break;
    }
    return nil;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)onImageBtnAction:(UIButton*)sender
{
    NSLog(@"hgjh");
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserProfileViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
    
    [self.navigationController pushViewController:controller animated:YES ];

}

@end
