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
{
    NSArray *nameArray, *imageArray;
}
@property (strong, nonatomic) IBOutlet UITableView *liketableView;

@end

@implementation LikeViewController

{
    
int count;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    count = 0;
    // Do any additional setup after loading the view.
    self.liketableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.liketableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.navigationItem.title = @"Userlist";
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonAction)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
  [self customInit];
}
-(void)customInit
{
    
    nameArray=[[NSArray alloc]initWithObjects:@"Akash Sharma",@"Kunal Arora",@"Sunil Joshi",@"Suraj Joshi",@"Abhishek Tripathi",@"Rahul Mithani",@"GaganDeep",@"Raman Deep",@"Anjali Sharma",@"Priyanshi Gupta",@"Akash Sharma",@"Kunal Arora",@"Sunil Joshi",@"Suraj Joshi",@"Abhishek Tripathi",@"Rahul Mithani",@"GaganDeep",@"Raman Deep",@"Anjali Sharma",@"Priyanshi Gupta", nil];
    imageArray=[[NSArray alloc]initWithObjects:@"profilepic1.png",@"profilepic2.jpg",@"profilepic3.jpg",@"profilepic4.jpg",@"profilepic5.jpg",@"profilepic6.jpg",@"profilepic7.jpg",@"profilepic8.jpg",@"profilepic9.png",@"profilepic10.png",@"profilepic1.png",@"profilepic2.jpg",@"profilepic3.jpg",@"profilepic4.jpg",@"profilepic5.jpg",@"profilepic6.jpg",@"profilepic7.jpg",@"profilepic8.jpg",@"profilepic9.png",@"profilepic10.png",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)doneButtonAction
{
    if(count >=2)
        [self.navigationController popViewControllerAnimated:YES];
    else
        [AlertController message:@"Please select atleast two friends." onViewController:self];
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
    return 20;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LikeTableViewCell *cell = (LikeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.likeProfileImageView.layer.borderWidth = 1;
    cell.likeProfileImageView.layer.cornerRadius = 15;
    cell.likeProfileImageView.clipsToBounds = YES;
    cell.likeCheckBoxBtn.tag = 900 + indexPath.row;
    [cell.likeCheckBoxBtn addTarget:self action:@selector(onCheckBoxBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.likeProfileImageView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
  cell.likeProfileTitlelabel.text = [nameArray objectAtIndex:indexPath.row];
//    switch (indexPath.row) {
//        case 0:
//            
//            cell.likeProfileImageView.image = [UIImage imageNamed:@"man1"];
//            cell.likeProfileTitlelabel.text = @"Raj Sir";
//            return cell;
//            break;
//       
//        case 1:
//            cell.likeProfileImageView.image = [UIImage imageNamed:@"man2"];
//            cell.likeProfileTitlelabel.text = @"Ashish";
//            return cell;
//            break;
//        case 2:
//            cell.likeProfileImageView.image = [UIImage imageNamed:@"man4"];
//            cell.likeProfileTitlelabel.text = @"Sunny";
//            return cell;
//            break;
//        case 3:
//            cell.likeProfileImageView.image = [UIImage imageNamed:@"man4"];
//            cell.likeProfileTitlelabel.text = @"Ravi";
//            return cell;
//            break;
//            
//        default:
//            break;
//    }
    return cell;
}

-(void)onCheckBoxBtnAction:(UIButton*)sender
{
    sender.selected = !sender.selected;
    if(sender.selected)
        count ++;
    else
        count --;
}
@end
