//
//  HomeViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "Header.h"
#import "Macro.h"
#import "CommentViewController.h"
#import "UIImageView+WebCache.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,RefreshHomeData>
@property(strong,nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *homeMenuBtn;
@property (nonatomic , strong)NSMutableArray   *feedListArray;
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:YES];
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
    
    
    
    _refreshControl = [[UIRefreshControl alloc]init];
    
    [self.homeTableView addSubview:_refreshControl];
    
    [_refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
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
-(void)RefreshData
{
    [self getAllFeeds];
    
}
#pragma mark- Add Feed Method
- (IBAction)onAddFeedAction:(id)sender {
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddFeedViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"AddFeedViewController"];
    controller.delegate=self;
    [self.navigationController pushViewController:controller animated:YES ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_feedListArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ 
    HomeTableViewCell *cell = (HomeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil)
    {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.homeLikeBtn.tag = 1000 ;
    cell.homeCommentBtn.tag = 2000 ;
    cell.homeShareBtn.tag = 3000 ;
    [cell.homeLikeBtn addTarget:self action:@selector(onBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.homeCommentBtn addTarget:self action:@selector(onBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.homeShareBtn addTarget:self action:@selector(onBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    FeedList *objFeed = [self.feedListArray objectAtIndex:indexPath.row];
    [cell.homeProfileImageView sd_setImageWithURL:[NSURL URLWithString:objFeed.userProfileImage] placeholderImage:nil];
    cell.homeProfileTitleLabel.text = [objFeed userFullname];
     [cell.feedImageView sd_setImageWithURL:[NSURL URLWithString:objFeed.feedBannerImageURL ] placeholderImage:nil];
    cell.feedImageView.layer.borderWidth = 1;
    cell.homeDescriptionText.text = [objFeed feedDescription];
    cell.homeTimeLabel.text =[ objFeed feedPostTime];
    cell.homeProfileTitleLabel.text = objFeed.userFullname;
    
    NSString *likecount = [@"Likes("stringByAppendingString:[NSString stringWithFormat:@"%@",objFeed.feedlikeCount]];
    likecount = [likecount stringByAppendingString:@")"];
    [cell.homeLikeBtn setTitle:likecount forState:UIControlStateNormal];
    NSLog(@"likecount = %@",likecount);
    NSString *commentcount = [@"Comments("stringByAppendingString:[NSString stringWithFormat:@"%@",objFeed.feedCommentCount]];
    commentcount = [commentcount stringByAppendingString:@")"];
    [cell.homeCommentBtn setTitle:commentcount forState:UIControlStateNormal];
    NSLog(@"commentcount =%@",commentcount);
           //NSLog(@"Feed items === User Profile  ,  sfgdg  ===%@  %@", objFeed.userProfileImage, objFeed.userFullname);
   return cell;

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

    -(void)onBtnAction:(UIButton*)sender
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
            CommentViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"CommentViewController"];
            
            [self.navigationController pushViewController:controller animated:YES ];
            
            
        }

        
        if(sender.tag == 3000)
        {
//            NSString *texttoshare = @"Diaries"; //this is your text string to share
//            UIImage *imagetoshare =  [UIImage imageNamed:@"index"]; //this is your image to share
//            NSArray *activityItems = @[texttoshare, imagetoshare];
//            UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
//            activityVC.excludedActivityTypes = @[UIActivityTypeMail,UIActivityTypeMessage,UIActivityTypePostToFacebook,UIActivityTypePostToTwitter,UIActivityTypePrint];
//            [self presentViewController:activityVC animated:TRUE completion:nil];
   [self shareText:@"Hello IOS Developer..." andImage:nil andUrl:nil];
        }
    }

-(void)getAllFeeds{
        
        
        NSMutableDictionary * params = [[NSMutableDictionary alloc] init];
        
        [params setValue:[NSUSERDEFAULT objectForKey:@_USER_ID_LOCAL]forKey:pUserId];
        
        
        [[ServiceHelper helper] request:params apiName:kApiGetFeed withToken:YES method:POST onViewController:self completionBlock:^(id result, NSError *error) {
            
            
            if ([[result objectForKey:@_RESPONSE_CODE] integerValue] == 200)
            {
                
                // TODO
                if ([[result objectForKey:pPostList] isKindOfClass:[NSArray class]])
                {
                    
                    self.feedListArray = [FeedList getAllFeedItems:[result objectForKey:pPostList]];
                    
                    [self.homeTableView  reloadData];
                    
                }
                
                
            }
            else
            {
                
                [AlertController message: [result objectForKey:@_RESPONSE_MESSAGE] onViewController:self];
            }
            
            
        }];
        
        
        
        
}
- (void)refreshTable {
    
    //TODO: refresh your data
    
    [_refreshControl endRefreshing];
    
    [self.homeTableView reloadData];
    
    
}

@end
