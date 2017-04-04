//
//  MenuViewController.m
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "MenuViewController.h"
#import "Macro.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (weak, nonatomic) IBOutlet UIButton *menuProfileImage;
@property (weak, nonatomic) IBOutlet UILabel *menuProfileLabel;

@end

@implementation MenuViewController
{
    NSArray *menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    _menuProfileImage.layer.borderWidth = 1;
    _menuProfileImage.layer.cornerRadius = 40;
    self.menuProfileImage.clipsToBounds = YES;
    
    self.listTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.listTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    // Do any additional setup after loading the view.
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = (MenuTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"maincell"];
    
    _menuProfileLabel.text = @"Sarvada Chauhan";
    switch(indexPath.row)
    {
        case 0:
          //  cell.menuImage.image = [UIImage imageNamed:@"menuicon"];
            cell.menuImage.image = [UIImage imageNamed:@"menuicon"];
            cell.menuLabel.text = @"Home";
            return cell;
        case 1:
            cell.menuImage.image = [UIImage imageNamed:@"logoutImage"];
            cell.menuLabel.text = @"Logout";
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
            
            SWRevealViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
            // [self performSegueWithIdentifier: @"revelViewController" sender: self];
            [revealViewController setFrontViewController:controller animated:NO];
            [revealViewController revealToggleAnimated:YES];
            
        }
            break;
        case 1:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"Are you sure you want to logout?" preferredStyle:UIAlertControllerStyleAlert ];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *Cancel = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                LoginViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"login"];
                [self.navigationController pushViewController:controller animated:YES];
                
            }];
            [alert addAction:ok];
            [alert addAction:Cancel];
            [self presentViewController:alert animated:YES completion:nil];
            break;
        }
    }
}
- (IBAction)onImageClick:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserProfileViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"login"];
    [self.navigationController pushViewController:controller animated:YES];
    
}
@end
