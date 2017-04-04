//
//  CommentViewController.m
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "CommentViewController.h"
#import "Macro.h"

@interface CommentViewController ()<UITextFieldDelegate>
{
    NSArray *nameArray, *imageArray, *timeArray;
}
@property (weak, nonatomic) IBOutlet UITextField *typingTextField;
@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO];
    self.navigationItem.title = @"Comments";
    [self customInit];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)customInit
{
    
    nameArray=[[NSArray alloc]initWithObjects:@"Akash Sharma",@"Kunal Arora",@"Sunil Joshi",@"Suraj Joshi",@"Abhishek Tripathi",@"Rahul Mithani",@"GaganDeep",@"Raman Deep",@"Anjali Sharma",@"Priyanshi Gupta", nil];
    imageArray=[[NSArray alloc]initWithObjects:@"profilepic1",@"profilepic2",@"profilepic3",@"profilepic4",@"profilepic5",@"profilepic6",@"profilepic7",@"profilepic8",@"profilepic9",@"profilepic10",nil];
    timeArray = [[NSArray alloc]initWithObjects:@"5 sec ago", @"10 min ago" ,@"13 min ago", @"18 min ago", @"20 min ago", @"22 min ago", @"26 min ago", @"30 min ago", @"40 min ago", @"1 hr ago",nil];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.returnKeyType == UIReturnKeyDone){
        
        [self.view endEditing:YES];
    }
    
    return YES;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - keyboard movements
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = -keyboardSize.height;
        self.view.frame = f;
    }];
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = 0.0f;
        self.view.frame = f;
    }];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentTableViewCell *cell=(CommentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"maincell"];
    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //cell.userInteractionEnabled = NO;
    cell.commentNameLabel.text = [nameArray objectAtIndex:indexPath.row];
    cell.commentImage.layer.cornerRadius = 25;
    cell.commentImage.layer.borderWidth = 1;
    cell.self.commentImage.clipsToBounds = YES;
    cell.commentImage.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    //    cell.newsFeedImage.image = [UIImage imageNamed:[newsFeedArray objectAtIndex:indexPath.row]];
    cell.commentTimeLabel.text = [timeArray objectAtIndex:indexPath.row];
    return cell;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (IBAction)onSendAction:(id)sender {
    _typingTextField.text = @"";
}
@end
