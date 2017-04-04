//
//  UserListViewController.m
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "UserListViewController.h"
#import "UserListTableViewCell.h"
#import "Macro.h"

@interface UserListViewController ()
{
    NSArray *nameArray, *imageArray;
}

@end

@implementation UserListViewController
{
int count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO];
    self.navigationItem.title = @"User List";
    
    //    UIImage* send = [UIImage imageNamed:@"doneimage.png"];
    //    CGRect frameimg = CGRectMake(0, 0, 45, 30);
    UIButton *someButton = [[UIButton alloc] init ];
    [someButton setTitle:@"Done" forState:UIControlStateNormal];
    //    [someButton setBackgroundImage:send  forState:UIControlStateNormal ];
    [someButton addTarget:self action:@selector(sendToAddFeed)
         forControlEvents:UIControlEventTouchUpInside];
    [someButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=mailbutton;
    [self customInit];
    // Do any additional setup after loading the view.
}
-(void)customInit
{
    
    nameArray=[[NSArray alloc]initWithObjects:@"Sarvada Chauhan",@"Manoj Kumar",@"Akash Mehrotra",@"Anshu Aggrawal",@"Priya Srivastava",@"Anjali Singhal",@"Akash Sharma",@"Raman Deep",@"Anjali Sharma",@"Priyanshi Gupta", nil];

    imageArray=[[NSArray alloc]initWithObjects:@"Image-9.jpg",@"Image-12.png",@"Image-10.jpg",@"Image-9.jpg",@"Image-8.jpg",@"Image-7.jpg",@"Image-12.png",@"Image-2.jpg",@"Image-12.jpg",@"Image-10.jpg",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserListTableViewCell *cell=(UserListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"maincell"];
    cell.userListLabel.text = [nameArray objectAtIndex:indexPath.row];
    cell.userListImage .layer.borderWidth = 1;
    cell.userListImage.layer.cornerRadius = 25;
    cell.userListImage.clipsToBounds = YES;
    cell.userListCheckBox.tag = 900 + indexPath.row;
    [cell.userListCheckBox addTarget:self action:@selector(onCheckBoxTouch:) forControlEvents:UIControlEventTouchUpInside];
    cell.userListImage.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    return cell;
}
-(void)sendToAddFeed {
    [self.navigationController popViewControllerAnimated:YES ];
    {
        if(count >=2)
            [self.navigationController popViewControllerAnimated:YES];
        else
            [AlertController message:@"Please select atleast two friends." onViewController:self];
    }

    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (IBAction)onCheckBoxTouch:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    if(btn.selected)
        count ++;
    else
        count --;
}


@end
