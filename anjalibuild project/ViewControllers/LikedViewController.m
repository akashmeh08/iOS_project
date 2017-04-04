//
//  LikedViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "LikedViewController.h"
#import "LikedTableViewCell.h"
#import "UserProfileViewController.h"
@interface LikedViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *likedTableView;

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
    return  22;
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
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man1"] forState:UIControlStateNormal];
            cell.profileTitleLabel .text = @"Anjali";
            return cell;
            break;
            
        case 1:
           [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man2"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Pooja";
            return cell;
            break;
        case 2:
           [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Mayur";
            return cell;
            break;
        case 3:
          [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Neha";
            return cell;
            break;
        case 4:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man1"] forState:UIControlStateNormal];
            cell.profileTitleLabel .text = @"Anjali";
            return cell;
            break;
            
        case 5:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man2"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Pooja";
            return cell;
            break;
        case 6:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Mayur";
            return cell;
            break;
        case 7:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Neha";
            return cell;
            break;
        case 8:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man1"] forState:UIControlStateNormal];
            cell.profileTitleLabel .text = @"Anjali";
            return cell;
            break;
            
        case 9:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man2"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Pooja";
            return cell;
            break;
        case 10:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Mayur";
            return cell;
            break;
        case 11:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Neha";
            return cell;
            break;
        case 12:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Mayur";
            return cell;
            break;
        case 13:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Neha";
            return cell;
            break;
        case 14:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man1"] forState:UIControlStateNormal];
            cell.profileTitleLabel .text = @"Anjali";
            return cell;
            break;
            
        case 15:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man2"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Pooja";
            return cell;
            break;
        case 16:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Mayur";
            return cell;
            break;
        case 17:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Neha";
            return cell;
            break;
        case 18:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man1"] forState:UIControlStateNormal];
            cell.profileTitleLabel .text = @"Anjali";
            return cell;
            break;
            
        case 19:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man2"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Pooja";
            return cell;
            break;
        case 20:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Mayur";
            return cell;
            break;
        case 21:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"man4"] forState:UIControlStateNormal];
            cell.profileTitleLabel.text = @"Neha";
            return cell;
            break;
            default:
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
