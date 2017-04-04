//
//  HomeViewController.m
//  Mobiloitte
//
//  Created by Mobiloitte on 16/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "UserInfo.h"


@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UserInfo *userInfo;
    //NSMutableArray *dataSourceArray;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [[self navigationController]setNavigationBarHidden:YES];
    [self customInit];
}
-(void)customInit
{

    
    userInfo.nameArray=[[NSArray alloc]initWithObjects:@"Ritesh Arora",@"Hemant Suyal",@"Anjali Singhal",@"Mayur Sharma",@"Ashish Jain",@"Sarvada chauhan",@"Karan Singh",@"Prachi Singhal",@"Ramesh Singh",@"Sameer Saraogi ", nil];
   
    
    userInfo.imageView1 =[[NSArray alloc]initWithObjects:@"images0.png",@"images1.jpeg",@"images2.jpeg",@"images3.png",@"images4.png",@"images5.png",@"images6.png",@"images7.png",@"images8.jpeg",@"images9.jpeg",nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   // return dataSourceArray.count;
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = (HomeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"];
    
   // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
       cell.titleLabel.text = [userInfo.nameArray objectAtIndex:indexPath.row];
//    cell.profileImageView.layer.cornerRadius = 34;
//    cell.profileImageView.layer.borderWidth = 1;
    cell.self.profileImageView.clipsToBounds = YES;
    
    cell.selectionStyle = NO;
    
    cell.profileImageView.image = [UIImage imageNamed:[userInfo.imageView1 objectAtIndex:indexPath.row]];
    

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    userInfo.cellNumber=[NSString stringWithFormat:@"%i", indexPath.row];
//    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    DetailsViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
//    controller.user_info=[MUserInfo new];
//    controller.user_info=userInfo;
//    [self.navigationController pushViewController:controller animated:YES ];
    
    
}

@end
