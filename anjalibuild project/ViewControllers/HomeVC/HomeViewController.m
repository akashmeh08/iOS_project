//
//  HomeViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "Header.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *homeMenuBtn;
@property (nonatomic , strong)NSMutableArray   *feedListArray;
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    SWRevealViewController *revealViewController =self.revealViewController; //[[SWRevealViewController alloc]init];
    if ( revealViewController )
    {
        NSLog(@"hkhdkjsf");
        [self.homeMenuBtn setTarget:self.revealViewController];
        [self.homeMenuBtn setAction: @selector( revealToggle: )];
          [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    self.revealViewController.rearViewRevealWidth = self.view.frame.size.width-120;
   
    self.feedListArray = [[NSMutableArray alloc] init];
    
    [self getAllFeeds];
    
    }

-(void)viewWillAppear:(BOOL)animated
{
     [self.navigationController setNavigationBarHidden:YES];
}
-(void)addFeed
{
   
    
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [self.feedListArray count];
}

// delegate methode
// [self getAllFeeds];

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = (HomeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.homeLikeBtn.tag = 1000 ;
    cell.homeCommentBtn.tag = 2000 ;
    cell.homeShareBtn.tag = 3000 ;
    [cell.homeLikeBtn addTarget:self action:@selector(onBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.homeCommentBtn addTarget:self action:@selector(onBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    

    [cell.homeShareBtn addTarget:self action:@selector(onBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.homeProfileImageView.layer.borderWidth = 1;
    //cell.layer.borderWidth = 1;
    cell.feedImageView.layer.borderWidth = 1;
    
    
    FeedList  *objFeed = [self.feedListArray objectAtIndex:indexPath.row];
    
    NSLog(@"Feed items === User Profile  ,  sfgdg  ===%@  %@", objFeed.userProfileImage, objFeed.userFullname);
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:objFeed.userProfileImage ]];
    cell.homeProfileImageView.image = [UIImage imageWithData:imageData];

    
    
    NSString *userName = [[profileData objectForKey:pFisrtname]stringByAppendingString:[profileData objectForKey:pLastname]];
    _menuProfileTitleLabel.text = userName;
    cell.feedImageView.image = [UIImage imageNamed:@"index1"];
    cell.homeDescriptionText.text = @"You are looking very nice, nice to see you. How is your day,You are looking very nice, nice to see you. How is your day .";
    

    
    
    
  /*  switch (indexPath.row)
    {
        case 0:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index1"];
            cell.homeProfileTitleLabel.text = @"Anjali";
            cell.feedImageView.image = [UIImage imageNamed:@"index1"];
            cell.homeDescriptionText.text = @"You are looking very nice, nice to see you. How is your day,You are looking very nice, nice to see you. How is your day .";
            
            break;
        case 1:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index"];
            cell.homeProfileTitleLabel.text = @"Manish";
            cell.feedImageView.image = [UIImage imageNamed:@"index"];
            cell.homeDescriptionText.text = @"Waaaw. Good to hear this from you, i want to meet with you .You are looking ";
            
            break;
        case 2:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index2"];
            cell.homeProfileTitleLabel.text = @"Hemant";
            cell.feedImageView.image = [UIImage imageNamed:@"index2"];
            cell.homeDescriptionText.text = @"How are you. You are looking very nice, nice to see you.";
            break;
            
        case 3:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index1"];
            cell.homeProfileTitleLabel.text = @"Anjali";
            cell.feedImageView.image = [UIImage imageNamed:@"index1"];
            cell.homeDescriptionText.text = @"You are looking very nice, nice to see you. How is your day, i missed you a lot.You are looking very nice, nice to see you. How is your day";
            
            break;
        case 4:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index"];
            cell.homeProfileTitleLabel.text = @"Manish";
            cell.feedImageView.image = [UIImage imageNamed:@"index"];
            cell.homeDescriptionText.text = @"Waaaw.You are looking very nice, nice to see you.  i missed you a lot.You are looking very nice, nice to see you. How is your day";
            
            break;
        case 5:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index2"];
            cell.homeProfileTitleLabel.text = @"Hemant";
            cell.feedImageView.image = [UIImage imageNamed:@"index2"];
            cell.homeDescriptionText.text = @"How are you. You are looking very nice,  nice to see you. How is your day, i missed you.You are looking very nice, nice to see you. How is your day";

            break;
        case 7:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index1"];
            cell.homeProfileTitleLabel.text = @"Anjali";
            cell.feedImageView.image = [UIImage imageNamed:@"index1"];
            cell.homeDescriptionText.text = @"You are looking very nice, nice to see you. How is your day, i missed you a lot.You are looking very nice, nice to see you. How is your day";
            
            break;
        case 8:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index"];
            cell.homeProfileTitleLabel.text = @"Manish";
            cell.feedImageView.image = [UIImage imageNamed:@"index"];
            cell.homeDescriptionText.text = @"Waaaw. Good to hear this from you, i want to meet with you . You are very friendly.You are looking very nice, nice to see you. How is your day ";
            
            break;
        case 9:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index2"];
            cell.homeProfileTitleLabel.text = @"Hemant";
            cell.feedImageView.image = [UIImage imageNamed:@"index2"];
            cell.homeDescriptionText.text = @"How are you. You are looking very nice, nice to see you. How is your day, i missed you a lot.";
            
        case 10:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index1"];
            cell.homeProfileTitleLabel.text = @"Anjali";
            cell.feedImageView.image = [UIImage imageNamed:@"index1"];
            cell.homeDescriptionText.text = @"You are looking very nice, nice to see you. You are looking very nice, nice to see you..";
            
            break;
        case 11:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index"];
            cell.homeProfileTitleLabel.text = @"Manish";
            cell.feedImageView.image = [UIImage imageNamed:@"index"];
            cell.homeDescriptionText.text = @"Waaaw.You are looking very nice, nice to see you. You are looking very nice";
            
            break;
        case 12:
            cell.homeProfileImageView.image = [UIImage imageNamed:@"index2"];
            cell.homeProfileTitleLabel.text = @"Hemant";
            cell.feedImageView.image = [UIImage imageNamed:@"index2"];
            cell.homeDescriptionText.text = @"How are you. You are looking very nice, nice to see you. You are looking very nice.";
            
            break;
            default:
            break;
    }*/
    
    
    
    return cell;
    
    
}

-(void)onBtnAction:(UIButton*)sender
{
    NSLog(@"Great");
    if(sender.tag == 1000)
    {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LikedViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"LikedViewController"];
        
        [self.navigationController pushViewController:controller animated:YES ];

        
    }
    if(sender.tag == 3000)
    {
        NSString *texttoshare = @"Diaries"; //this is your text string to share
        UIImage *imagetoshare =  [UIImage imageNamed:@"index"]; //this is your image to share
        NSArray *activityItems = @[texttoshare, imagetoshare];
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
        activityVC.excludedActivityTypes = @[UIActivityTypeMail,UIActivityTypeMessage,UIActivityTypePostToFacebook,UIActivityTypePostToTwitter,UIActivityTypePrint];
        [self presentViewController:activityVC animated:TRUE completion:nil];
        
    }
}
- (IBAction)commentAction:(UIButton *)sender {
    if(sender.tag == 2000)
    {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CommentViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"CommentViewController"];
        
        [self.navigationController pushViewController:controller animated:YES ];
        
        
    }
    
    

}


-(void)getAllFeeds{
    
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] init];
    
    [params setValue:[NSUSERDEFAULT  objectForKey:@_USER_ID_LOCAL] forKey:pUserId];

    
    [[ServiceHelper helper] request:params apiName:kgetAllFeeds withToken:@"" method:POST onViewController:self completionBlock:^(id result, NSError *error) {
      
      
        if ([[result objectForKey:@_RESPONSE_CODE] integerValue] == 200) {
            
            // TODO
            if ([[result objectForKey:pPostList] isKindOfClass:[NSArray class]]){
                
            self.feedListArray = [FeedList getAllFeedItems:[result objectForKey:pPostList]];
                
                [self.homeTableView  reloadData];
                
            }
            
            
        }else{
            
            [AlertController message: [result objectForKey:@_RESPONSE_MESSAGE] onViewController:self];
        }
        
        
    }];




}





@end
