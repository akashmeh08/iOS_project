//
//  MenuViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "LabelSubClass.h"
#import "MenuViewController.h"
#import "MenuTableViewCell.h"
#import "SWRevealViewController.h"
#import "Header.h"
//#import ""
@interface MenuViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSDictionary *profileData;
}

@property (strong, nonatomic) IBOutlet LabelSubClass *menuProfileTitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *menuImageView;
@property (strong, nonatomic) IBOutlet UITableView *menuTableView;
@end

@implementation MenuViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _menuImageView.layer.borderColor = [UIColor greenColor].CGColor;
    _menuImageView.layer.borderWidth = 1;
    _menuImageView.layer.cornerRadius = 35;
    self.menuImageView.clipsToBounds = YES;
    [self makeWebApiForMenu];
    self.menuTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.menuTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    UITapGestureRecognizer *selectProfileTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onProfileClick)];
    selectProfileTapGesture.numberOfTapsRequired = 1;
    [self.menuImageView addGestureRecognizer:selectProfileTapGesture];

    
}
-(void)onProfileClick
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserProfileViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
    
    [self.navigationController pushViewController:controller animated:YES ];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
   
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)makeWebApiForMenu{
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] init];
    
    [params setValue:@"80" forKey:pUserId];
    
    [[ServiceHelper helper] request:params apiName:kApiMenu withToken:@"" method:POST onViewController:self completionBlock:^(id result, NSError *error) {
        
        NSString *userId = [result objectForKey:@"responseCode"];
        LogInfo("response code ==%@",userId);
        if([userId isEqualToString:@"200"])
        {
            profileData = [[NSDictionary alloc] initWithDictionary:[result objectForKey:@"user_data"]];
            NSString * imageUrl = [profileData objectForKey:pProfileImage];
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
            _menuImageView.image = [UIImage imageWithData:imageData];
            NSString *userName = [[profileData objectForKey:pFisrtname]stringByAppendingString:[profileData objectForKey:pLastname]];
            _menuProfileTitleLabel.text = userName;
            [_menuTableView reloadData];
            
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = (MenuTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
  //  _menuImageView.image = [UIImage imageNamed:@"fruits1"];
  // _menuProfileTitleLabel.text = @"Anjali";
    switch(indexPath.row)
    {
            case 0:
            cell.menuIconImageView.image = [UIImage imageNamed:@"home"];
            cell.menuTitlelabel.text = @"Home";
            return cell;
            case 1:
            cell.menuIconImageView.image = [UIImage imageNamed:@"logout-1"];
            cell.menuTitlelabel.text = @"Log Out";
            return cell;


            
    }
    return nil;
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRevealViewController *revealViewController = self.revealViewController;
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    switch (indexPath.row) {
        case 0:
        {
            
            
            SWRevealViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeScreen"];
            // [self performSegueWithIdentifier: @"revelViewController" sender: self];
            [revealViewController setFrontViewController:controller animated:NO];
            [revealViewController revealToggleAnimated:YES];
            
        }
            break;
        case 1:
        {
            UIAlertController *alert = (UIAlertController*)[UIAlertController alertControllerWithTitle:nil message:@"Are you sure you want to log out?" preferredStyle:UIAlertControllerStyleAlert ];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil];
            UIAlertAction *Cancel = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleCancel handler:^(UIAlertAction *
                                                                                                                    _Nonnull action){
                [self.navigationController popViewControllerAnimated:YES];
            }];

            [alert addAction: Cancel];
                        [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }
                      break;

}
}
    @end;
