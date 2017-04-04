//
//  LikeViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "LikeViewController.h"
#import "LikeTableViewCell.h"
#import "Header.h"
@interface LikeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *liketableView;

@end

@implementation LikeViewController

{
  
    UserInfo *mObj;

    int count;
    NSArray *nameList;
    NSArray *likeList;
    NSMutableArray *checkObjectArray, *selectionArray;
}
  @synthesize delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    count = 0;
     selectionArray = [[NSMutableArray alloc] init];
    nameList = [[NSArray alloc]initWithObjects:@"Anjali",@"Anil",@"Pooja",@"Mayur",@"Shuruti",@"Ritesh",@"Neha",@"Anjali",@"Anil",@"Pooja",@"Mayur",@"Shuruti",@"Ritesh",@"Neha",@"Anjali",@"Anil",@"Pooja",@"Mayur",@"Shuruti",@"Ritesh",@"Neha",@"Anjali",@"Anil",@"Pooja",@"Mayur",@"Shuruti",@"Ritesh", nil];
    // Do any additional setup after loading the view.
    self.liketableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.liketableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.navigationItem.title = @"User list";
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonAction)];
    self.navigationItem.rightBarButtonItem = rightBtn;
  
    mObj = [[UserInfo alloc]init];
    checkObjectArray = [[NSMutableArray alloc]init];
    for(int a = 0; a < nameList.count; a++)
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
-(void)doneButtonAction
{
    
    for (UserInfo *check in checkObjectArray) {
        if (check.isCheck) {
            count++;
        }
    }
  
   
    if(count > 1)
    {
          for(int i =0;i< nameList.count; i++)
    {
        UserInfo *mobjLike = [checkObjectArray objectAtIndex:i];
        if(mobjLike.isCheck)
        {
            //NSLog(@"ghfdfgs=%@",[nameList objectAtIndex:i]);
            
            [selectionArray addObject:[nameList objectAtIndex:i]];
            [delegate sendData:selectionArray];
        }
    }
        [self.navigationController popViewControllerAnimated:YES];

    }
    else
        [AlertController message:@"Please select at least two friends." onViewController:self];
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
     return nameList.count;
    
}
/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //if you want only one cell to be selected use a local NSIndexPath property instead of array. and use the code below
    //self.selectedIndexPath = indexPath;
    
    //the below code will allow multiple selection
    if ([cellSelected containsObject:indexPath])
    {
        [cellSelected removeObject:indexPath];
    }
    else
    {
        [cellSelected addObject:indexPath];
    }
    [tableView reloadData];
} */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LikeTableViewCell *cell = (LikeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.likeProfileImageView.layer.borderWidth = 1;
    cell.likeProfileImageView.layer.cornerRadius = 15;
    cell.likeProfileImageView.clipsToBounds = YES;
    cell.likeCheckBoxBtn.tag = 900 + indexPath.row;
   // [cell.likeCheckBoxBtn setImage: [UIImage imageNamed:@"check.png"] forState:UIControlStateSelected];
  //   [cell.likeCheckBoxBtn setImage: [UIImage imageNamed:@"uncheck.png"] forState:UIControlStateSelected];

    
    UserInfo *obj = [checkObjectArray objectAtIndex:indexPath.row];
    [cell.likeCheckBoxBtn setSelected:obj.isCheck];
    [cell.likeCheckBoxBtn addTarget:self action:@selector(onCheckBoxBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.likeProfileTitlelabel.text = [nameList objectAtIndex:indexPath.row];
    cell.likeProfileImageView.image = [UIImage imageNamed:@"man1"];
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
