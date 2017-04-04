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
{
    NSArray *nameList;
    NSArray *timeList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //nameList = [NSArray alloc]initWithObjects:@"Raj",@"Sunny",@"Raj", nil;
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"Likedlist";
    self.navigationItem.leftBarButtonItem.title = @"Back";
    
    timeList = [[NSArray alloc]initWithObjects:@"5 sec ago", @"10 min ago" ,@"13 min ago", @"18 min ago", @"20 min ago", @"22 min ago", @"26 min ago", @"30 min ago", @"40 min ago", @"1 hr ago",@"1 hr ago",@"1 hr ago",@"2 hr ago",@"3 hr ago",@"4 hr ago",nil];
    nameList=[[NSArray alloc]initWithObjects:@"Anshu Aggarwal",@"Kunal Arora",@"Sunil Joshi",@"Suraj Joshi",@"Abhishek Tripathi",@"Rahul Mithani",@"GaganDeep",@"Raman Deep",@"Anjali Sharma",@"Priyanshi Gupta",@"Akash Sharma",@"Kunal Arora",@"Sunil Joshi",@"Suraj Joshi",@"Abhishek Tripathi" ,nil];

    self.likedTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.likedTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return nameList.count;
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
    cell.timeLabel.text = [timeList objectAtIndex:indexPath.row];
    cell.profileTitleLabel.text = [nameList objectAtIndex:indexPath.row];
    switch (indexPath.row) {
        case 0:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic5"] forState:UIControlStateNormal];
//            cell.profileTitleLabel .text = @"Raj Sir";
            return cell;
            break;
            
        case 1:
           [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic2"] forState:UIControlStateNormal];
//            cell.profileTitleLabel.text = @"Ashish";
            return cell;
            break;
        case 2:
           [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic3"] forState:UIControlStateNormal];
//            cell.profileTitleLabel.text = @"Sunny";
            return cell;
            break;
        case 3:
          [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic4"] forState:UIControlStateNormal];
//            cell.profileTitleLabel.text = @"Ravi";
            return cell;
        case 4:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic1"] forState:UIControlStateNormal];
//            cell.profileTitleLabel.text = @"Ravi";
            return cell;
            break;
        case 5:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic6"] forState:UIControlStateNormal];
            //            cell.profileTitleLabel.text = @"Ravi";
            return cell;
            break;
        case 6:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic7"] forState:UIControlStateNormal];
            //            cell.profileTitleLabel.text = @"Ravi";
            return cell;
            break;
        case 7:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic8"] forState:UIControlStateNormal];
            //            cell.profileTitleLabel.text = @"Ravi";
            return cell;
            break;
        case 8:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic9"] forState:UIControlStateNormal];
            //            cell.profileTitleLabel.text = @"Ravi";
            return cell;
            break;
        case 9:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic10"] forState:UIControlStateNormal];
            //            cell.profileTitleLabel.text = @"Ravi";
            return cell;
            break;
        case 10:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic1"] forState:UIControlStateNormal];
            //            cell.profileTitleLabel.text = @"Ravi";
            return cell;
            break;
        case 11:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic6"] forState:UIControlStateNormal];
            //            cell.profileTitleLabel.text = @"Ravi";
            return cell;
            break;
        case 12:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic4"] forState:UIControlStateNormal];
            //            cell.profileTitleLabel.text = @"Ravi";
            return cell;
            break;
        case 13:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic2"] forState:UIControlStateNormal];
            //            cell.profileTitleLabel.text = @"Ravi";
            return cell;
            break;
        case 14:
            [cell.profileImageView setBackgroundImage:[UIImage imageNamed:@"profilepic9"] forState:UIControlStateNormal];
            //            cell.profileTitleLabel.text = @"Ravi";
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
    switch (sender.tag)
    {
        case 100:
            controller.title = @"Anshu Aggarwal";
            break;
        case 101:
            controller.title = @"Kunal Arora";
            break;
        case 102:
            controller.title = @"Sunil Joshi";
            break;
        case 103:
            controller.title = @"Suraj Joshi";
            break;
        case 104:
            controller.title = @"Abhishek Tripathi";
            break;
        case 105:
            controller.title = @"Rahul Mithani";
            break;
        case 106:
            controller.title = @"GaganDeep";
            break;
        case 107:
            controller.title = @"Raman Deep";
            break;
        case 108:
            controller.title = @"Anjali Sharma";
            break;
        case 109:
            controller.title = @"Priyanshi Gupta";
            break;
        case 110:
            controller.title = @"Akash Sharma";
            break;
        case 111:
            controller.title = @"Kunal Arora";
            break;
        case 112:
            controller.title = @"Sunil Joshi";
            break;
        case 113:
            controller.title = @"Suraj Joshi";
            break;
        case 114:
            controller.title = @"Abhishek Tripathi";
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:controller animated:YES ];

}

@end
