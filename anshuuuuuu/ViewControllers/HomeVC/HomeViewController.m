//
//  HomeViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "SWRevealViewController.h"
#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "AddFeedViewController.h"
#import "LikedViewController.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *homeMenuBtn;
@property (strong, nonatomic) IBOutlet UITableView *homeTableView;

@end

@implementation HomeViewController
{
    NSArray *nameArray, *imageArray, *timeArray, *newsFeedArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
      [[self navigationController] setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.
   
    
   // self.homeTableView.rowHeight = UITableViewAutomaticDimension;
   // self.homeTableView.estimatedRowHeight = 272.0;
    SWRevealViewController *revealViewController =self.revealViewController; //[[SWRevealViewController alloc]init];
    if ( revealViewController )
    {
        NSLog(@"hkhdkjsf");
        [self.homeMenuBtn setTarget:self.revealViewController];
        [self.homeMenuBtn setAction: @selector( revealToggle: )];
          [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    self.revealViewController.rearViewRevealWidth = self.view.frame.size.width-120;
}
-(void)customInit
{
    
    nameArray=[[NSArray alloc]initWithObjects:@"Akash Sharma",@"Kunal Arora",@"Sunil Joshi",@"Suraj Joshi",@"Abhishek Tripathi",@"Rahul Mithani",@"GaganDeep",@"Raman Deep",@"Anjali Sharma",@"Priyanshi Gupta", nil];
    imageArray=[[NSArray alloc]initWithObjects:@"profilepic1.png",@"profilepic2.jpg",@"profilepic3.jpg",@"profilepic4.jpg",@"profilepic5.jpg",@"profilepic6.jpg",@"profilepic7.jpg",@"profilepic8.jpg",@"profilepic9.png",@"profilepic10.png",nil];
    newsFeedArray=[[NSArray alloc]initWithObjects:@"profilepic5.png",@"profilepic9.jpg",@"profilepic8.jpg",@"profilepic7.jpg",@"profilepic6.jpg",@"profilepic5.jpg",@"profilepic4.jpg",@"profilepic3.jpg",@"profilepic2.png",@"profilepic1.png",nil];
    timeArray = [[NSArray alloc]initWithObjects:@"5 sec ago", @"10 min ago" ,@"13 min ago", @"18 min ago", @"20 min ago", @"22 min ago", @"26 min ago", @"30 min ago", @"40 min ago", @"1 hr ago",nil];
    
}
-(void)viewWillAppear:(BOOL)animated
{
     [self.navigationController setNavigationBarHidden:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onAddFeedAction:(id)sender {
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddFeedViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"AddFeedViewController"];
    
    [self.navigationController pushViewController:controller animated:YES ];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [nameArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 280.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = (HomeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.homeLikeBtn.tag = 1000 ;
    cell.homeCommentBtn.tag = 2000 ;
    cell.homeShareBtn.tag = 3000 ;
    [cell.homeLikeBtn addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.homeCommentBtn addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [cell.homeShareBtn addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.homeProfileImageView.layer.borderWidth = 1;
    //cell.layer.borderWidth = 1;
    cell.feedImageView.layer.borderWidth = 1;
    cell.homeProfileTitleLabel.text = [nameArray objectAtIndex:indexPath.row];
    cell.self.homeProfileImageView.clipsToBounds = YES;
    cell.homeProfileImageView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    cell.feedImageView.image = [UIImage imageNamed:[newsFeedArray objectAtIndex:indexPath.row]];
    cell.homeTimeLabel.text = [timeArray objectAtIndex:indexPath.row];
    cell.homeDescriptionText.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.";

    return cell;

//    switch (indexPath.row)
//    {
//        case 0:
//            cell.homeProfileImageView.image = [UIImage imageNamed:@"index1"];
//            cell.homeProfileTitleLabel.text = @"Raj";
//            cell.feedImageView.image = [UIImage imageNamed:@"index1"];
//            cell.homeDescriptionText.text = @"This is gud image and its a gud natural images. We are happy to see this image.is is gud image and its a gud natural images. We are happis is gud image and its a gud natural images. We are happ";
//            
//            break;
//        case 1:
//            cell.homeProfileImageView.image = [UIImage imageNamed:@"index"];
//            cell.homeProfileTitleLabel.text = @"Ashish";
//            cell.feedImageView.image = [UIImage imageNamed:@"index"];
//            cell.homeDescriptionText.text = @"This is a gud natural images. We are happis is gud image and its a gud natural images. We are happ.We are happis is gud image and its a gud natural images";
//            
//            break;
//        case 2:
//            cell.homeProfileImageView.image = [UIImage imageNamed:@"index2"];
//            cell.homeProfileTitleLabel.text = @"Sunny Singh";
//            cell.feedImageView.image = [UIImage imageNamed:@"index2"];
//            cell.homeDescriptionText.text = @"This is gud a gud natural images. We are happis is gud image and its a gud natural images.We are happis is gud image and its a gud natural images";
//            
//            break;
//        case 3:
//            cell.homeProfileImageView.image = [UIImage imageNamed:@"index1"];
//            cell.homeProfileTitleLabel.text = @"Raj";
//            cell.feedImageView.image = [UIImage imageNamed:@"index1"];
//            cell.homeDescriptionText.text = @"This is gud image and its a gud natural images. We are happy to see this image.is is gud image and its a gud natural images. We are happis is gud image and its a gud natural images. We are happ";
//            
//            break;
//        case 4:
//            cell.homeProfileImageView.image = [UIImage imageNamed:@"index"];
//            cell.homeProfileTitleLabel.text = @"Ashish";
//            cell.feedImageView.image = [UIImage imageNamed:@"index"];
//            cell.homeDescriptionText.text = @"This is a gud natural images. We are happis is gud image and its a gud natural images. We are happ.We are happis is gud image and its a gud natural images";
//            
//            break;
//
//        case 5:
//            cell.homeProfileImageView.image = [UIImage imageNamed:@"index2"];
//            cell.homeProfileTitleLabel.text = @"Sunny Singh";
//            cell.feedImageView.image = [UIImage imageNamed:@"index2"];
//            cell.homeDescriptionText.text = @"This is gud a gud natural images. We are happis is gud image and its a gud natural images.We are happis is gud image and its a gud natural images";
//            
//            break;

            
//        default:
//            break;
//    }
//    return cell;
//    
    
}

- (void)shareText:(NSString *)text andImage:(UIImage *)image andUrl:(NSURL *)url
{
    NSMutableArray *sharingItems = [NSMutableArray new];
    if (text) {
        [sharingItems addObject:text];
    }
    if (image) {
        [sharingItems addObject:image];
    }
    if (url) {
        [sharingItems addObject:url];
    }
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}
/*-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;
}*/
-(void)onBtnClick:(UIButton*)sender
{
    NSLog(@"Great");
    if(sender.tag == 1000)
    {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LikedViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"LikedViewController"];
        
        [self.navigationController pushViewController:controller animated:YES ];

        
    }
    if(sender.tag == 2000)
    {
        
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LikedViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"CommentViewController"];
        
        [self.navigationController pushViewController:controller animated:YES ];

    }
   if(sender.tag == 3000)
    {
        [self shareText:@"Hello IOS Developer..." andImage:nil andUrl:nil];
    }
}
@end
