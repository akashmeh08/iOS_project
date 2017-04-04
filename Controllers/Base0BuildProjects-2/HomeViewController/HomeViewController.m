//
//  HomeViewController.m
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "HomeViewController.h"
#import "Macro.h"
@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *nameArray, *imageArray ,*timeArray ,*newsFeedArray;
}
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;
@end

@implementation HomeViewController
- (IBAction)addFeedButton:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddFeedViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"AddFeed"];
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   [[self navigationController] setNavigationBarHidden:YES];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuBarButton setTarget:self.revealViewController];
        [self.menuBarButton setAction: @selector( revealToggle: )];
    }
    self.revealViewController.rearViewRevealWidth = self.view.frame.size.width - 140;
    [self customInit];
    // Do any additional setup after loading the view.

}


-(void)customInit
{
    
nameArray=[[NSArray alloc]initWithObjects:@"Sarvada Chauhan",@"Manoj Kumar",@"Akash Mehrotra",@"Anshu Aggrawal",@"Priya Srivastava",@"Anjali Singhal",@"Akash Sharma",@"Raman Deep",@"Sarvada Chauhan",@"Manoj Kumar", nil];
    imageArray=[[NSArray alloc]initWithObjects:@"Image-9.jpg",@"Image-12.png",@"Image-10.jpg",@"Image-9.jpg",@"Image-8.jpg",@"Image-7.jpg",@"Image-12.png",@"Image-2.jpg",@"Image-9.jpg",@"Image-12.png",nil];
 newsFeedArray=[[NSArray alloc]initWithObjects:@"Image-2.jpg",@"Image-3.jpg",@"Image-4.jpg",@"Image-5.jpg",@"Image-1.jpg",@"Image.jpg",@"Image-2.jpg",@"Image-2.jpg",@"Image-3.jpg",@"Image-3.jpg",nil];
timeArray = [[NSArray alloc]initWithObjects:@"5 sec ago", @"10 min ago" ,@"13 min ago", @"18 min ago", @"20 min ago", @"22 min ago", @"26 min ago", @"30 min ago",@"5 sec ago",@"3 min ago",nil];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [nameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = (HomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"maincell"];
    
    cell.homeLabel.text = [nameArray objectAtIndex:indexPath.row];
    //cell.homeProfileImage.layer.cornerRadius = 50;
    cell.homeProfileImage.layer.borderWidth = 1;
   // cell.self.homeProfileImage.clipsToBounds = YES;
    
    cell.homeProfileImage.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    
    cell.uploadedImage.image = [UIImage imageNamed:[newsFeedArray objectAtIndex:indexPath.row]];
    cell.timeLabel.text = [timeArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
