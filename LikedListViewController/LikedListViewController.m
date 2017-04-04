//
//  LikedListViewController.m
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "LikedListViewController.h"
#import "Macro.h"

@interface LikedListViewController ()
{
    NSArray *nameArray, *imageArray, *timeArray;
}@end

@implementation LikedListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO];
    self.navigationItem.title = @"Liked List";
    [self customInit];
    // Do any additional setup after loading the view.
}
-(void)customInit
{
    
    nameArray=[[NSArray alloc]initWithObjects:@"Sarvada Chauhan",@"Manoj Kumar",@"Akash Mehrotra",@"Anshu Aggrawal",@"Priya Srivastava",@"Anjali Singhal",@"Akash Sharma",@"Raman Deep",@"Sarvada Chauhan",@"Manoj Kumar", nil];
    imageArray=[[NSArray alloc]initWithObjects:@"Image-9.jpg",@"Image-12.png",@"Image-10.jpg",@"Image-9.jpg",@"Image-8.jpg",@"Image-7.jpg",@"Image-12.png",@"Image-2.jpg",@"Image-9.jpg",@"Image-12.png",@"Image-12.png",nil];
    timeArray = [[NSArray alloc]initWithObjects:@"5 sec ago", @"10 min ago" ,@"13 min ago", @"18 min ago", @"20 min ago", @"22 min ago", @"26 min ago", @"30 min ago",@"5 sec ago",@"2 min",nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [nameArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LikedListTableViewCell *cell=(LikedListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"maincell"];
    if(cell == nil)
    {
        cell = [[LikedListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"maincell"];
    }

    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //cell.userInteractionEnabled = NO;
    cell.likedListNameLabel.text = [nameArray objectAtIndex:indexPath.row];
    //     cell.homeProfileImage.layer.cornerRadius = 34;
    //    cell.homeProfileImage.layer.borderWidth = 1;
    //    cell.self.userListImage.clipsToBounds = YES;
    //    cell.likedListImage.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    //    cell.newsFeedImage.image = [UIImage imageNamed:[newsFeedArray objectAtIndex:indexPath.row]];
    cell.likedListTimeLabel.text = [timeArray objectAtIndex:indexPath.row];
    return cell;
}


@end
