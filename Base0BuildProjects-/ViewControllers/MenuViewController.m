//
//  MenuViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "Header.h"

@interface MenuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet LabelSubClass *menuProfileTitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *menuImageView;
@property (strong, nonatomic) IBOutlet UITableView *menuTableView;
@end

@implementation MenuViewController
{
    UserInfo *mObj;
    NSDictionary *profileData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _menuImageView.layer.borderColor = [UIColor greenColor].CGColor;
    _menuImageView.layer.borderWidth = 1;
    _menuImageView.layer.cornerRadius = 35;
    self.menuImageView.clipsToBounds = YES;
    
    self.menuTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.menuTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _menuImageView.userInteractionEnabled = YES;
    //[self makeWebApiForLogin];
    [self.navigationController setNavigationBarHidden:NO];
    UITapGestureRecognizer *selectProfileTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onProfileClick)];
    selectProfileTapGesture.numberOfTapsRequired = 1;
    [self.menuImageView addGestureRecognizer:selectProfileTapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)onProfileClick
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserProfileViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
    //controller.title = @"Sarvada Chauhan";
     controller.profiledata = profileData;
    [self.navigationController pushViewController:controller animated:YES ];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = (MenuTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
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
//-(void)makeWebApiForLogin{
//    
//    NSMutableDictionary * params = [[NSMutableDictionary alloc] init];
//    [params setValue:[NSUSERDEFAULT objectForKey:@_USER_ID_LOCAL] forKey:pUserId];
//    [[ServiceHelper helper] request:params apiName:kApiGetProfile  withToken:YES method:POST onViewController:self completionBlock:^(id result, NSError *error) {
//        NSString *userID = [result objectForKey:@"responseCode"];
//        if([[result objectForKey:@_RESPONSE_CODE] integerValue] == 200)
//        {
//            profileData = [[NSDictionary alloc]initWithDictionary:[result objectForKey:@"profile_data"]];
//            
//            NSString *imageURL = [profileData objectForKey:@"image"];
//            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
//            _menuImageView.image = [UIImage imageWithData:imageData];
//            NSString *username = [[profileData objectForKey:@"first_name"] stringByAppendingString:[profileData objectForKey:@"last_name"]];
//            _menuProfileTitleLabel.text = username;
//            
//            mObj.userName = username;
//        }
//    }];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRevealViewController *revealViewController = self.revealViewController;
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    switch (indexPath.row) {
        case 0:
        {
            
            
            SWRevealViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeScreen"];
            [revealViewController setFrontViewController:controller animated:NO];
            [revealViewController revealToggleAnimated:YES];
            
        }
            break;
        case 1:
            
        {  
            UIAlertController *alert = (UIAlertController *) [UIAlertController alertControllerWithTitle:nil message :@"Are you sure you want to log out?" preferredStyle:UIAlertControllerStyleAlert]; 
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil];
            UIAlertAction *Cancel = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
                
                LoginViewController * homeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                [self.navigationController pushViewController:homeVC animated:true];
            }];
            
            [alert addAction : Cancel];
            [alert addAction :ok];
            [self presentViewController:alert animated:YES completion :nil];
            
        }
            
        break;
    }
}

    @end;
