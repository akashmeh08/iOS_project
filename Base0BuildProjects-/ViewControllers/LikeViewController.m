//
//  LikeViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//


#import "Header.h"

@interface LikeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *liketableView;
@property (nonatomic , strong)NSMutableArray   *feedListArray;
@end

@implementation LikeViewController

{
    NSMutableArray *checkObjectArray, *selectedUserList;
//    DelegateProtocol *delegateObj;
    NSArray *nameList;
     NSArray *likeList;
     NSArray *imageList;
    int count;
    UserInfo *mObj;
}
@synthesize delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    count = 0;
//delegateObj = [[DelegateProtocol alloc]init];
    nameList = [[NSArray alloc]initWithObjects:@"Sarvada Chauhan",@"Anshu Aggrawal",@"Manoj Kumar Sing",@"Akash Mehrotra",@"Priya Srivastava",@"Anchal Singh",@"Akash Sharma",@"Anjali Singhal",@"Samiksha Vashishtha",@"Kritu Jha",@"Ram Chandra",@"Sam Chauhan",@"Mehek Mittal",@"Raj Sir",@"Anu Malik",@"Chitranshi",@"Diksha Bisht",@"Neha Arora",nil];
    self.liketableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.liketableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.navigationItem.title = @"User list";
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonAction)];
    self.navigationItem.rightBarButtonItem = rightBtn;
     self.navigationItem.backBarButtonItem.title = @"Back";
    [self makeWebApiForLogin];
//    mObj = [[UserInfo alloc]init];
      self.feedListArray = [[NSMutableArray alloc] init];
    checkObjectArray = [[NSMutableArray alloc]init];
    for(int a=0; a<nameList.count; a++)
    {
        UserInfo *mobj1 = [[UserInfo alloc]init];
        mobj1.isCheck = NO;
        [checkObjectArray addObject:mobj1];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)doneButtonAction
{
    for (UserInfo *check in checkObjectArray) {
        if (check.isCheck) {
            count++;
        }
        }
    if(count >1)
    {
        //selectedUserList = [[NSMutableArray alloc]init];
        for(int a=0;a < nameList.count; a ++ )
        {
            UserInfo *obj = [checkObjectArray objectAtIndex:a];
            if(obj.isCheck)
                [selectedUserList addObject:[nameList objectAtIndex:a]];
        }
       [delegate sendData:selectedUserList];
        NSLog(@"count ====%d",selectedUserList.count);
        [self.navigationController popViewControllerAnimated:YES];
}
    else
    {
        [AlertController message:@"Please select atleast two friends." onViewController:self];
    }
    }


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.feedListArray count];
    
}
-(void)makeWebApiForLogin{
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] init];
    
      [params setValue:[NSUSERDEFAULT  objectForKey:@_USER_ID_LOCAL] forKey:pUserId];
    
//    [params setValue:(self.loginPasswordTextField.text) forKey:pPassword];
    
    [[ServiceHelper helper] request:params apiName:kApiUserList withToken:YES method:POST onViewController:self completionBlock:^(id result, NSError *error) {
        if ([[result objectForKey:@_RESPONSE_CODE] integerValue] == 200)
            
        {
            
            
            
            // TODO
            
            if ([[result objectForKey:pUserList] isKindOfClass:[NSArray class]])
                
            {
                
                
                
                self.feedListArray = [FeedList getAllFeedItems:[result objectForKey:pUserList]];
                
                [self.liketableView  reloadData];
                
                
                
            }
            
        }
        
        else
            
        {
            [AlertController message: [result objectForKey:@_RESPONSE_MESSAGE] onViewController:self];
        }
        
    }];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LikeTableViewCell *cell = (LikeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.likeProfileImageView.layer.borderWidth = 1;
    cell.likeProfileImageView.layer.cornerRadius = 15;
    cell.likeProfileImageView.clipsToBounds = YES;
    UserInfo *obj = [checkObjectArray objectAtIndex:indexPath.row];
    [cell.likeCheckBoxBtn setSelected:obj.isCheck];
    cell.likeCheckBoxBtn.tag = 900 + indexPath.row;
    FeedList *objFeed = [self.feedListArray objectAtIndex:indexPath.row];
    [cell.likeCheckBoxBtn addTarget:self action:@selector(onCheckBoxBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//    cell.likeProfileTitlelabel.text = [nameList objectAtIndex:indexPath.row];
    [cell.likeProfileImageView sd_setImageWithURL:[NSURL URLWithString:objFeed.privateUserImage]placeholderImage:nil];
    cell.likeProfileTitlelabel.text = [objFeed privateUserName];
    return cell;

}
-(void)onCheckBoxBtnAction:(UIButton*)sender
{
    UserInfo *obj = [checkObjectArray objectAtIndex:sender.tag%900];
    sender.selected = !sender.selected;
    obj.isCheck = sender.selected;
    [self.liketableView reloadData];
}
@end
