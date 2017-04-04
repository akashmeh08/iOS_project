//
//  CommentViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentTableViewCell.h"
#import "Header.h"
@interface CommentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *commentTableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *viewConstraint;
@property (nonatomic, assign) BOOL shouldScrollToLastRow;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomConstantOfTable;
@property (strong, nonatomic) IBOutlet UIView *textfieldcontaineView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topTableContant;
@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"Comments";
    
//    self.commentTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.commentTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardDidShow:)
//                                                 name:UIKeyboardDidShowNotification
//                                               object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardDidHide:)
//                                                 name:UIKeyboardDidHideNotification
//                                               object:nil];
    _messageTextField.layer.borderWidth = 1;
    _messageTextField.layer.borderColor = [UIColor colorWithRed:(199/255.0) green:(199/255.0) blue:(199/255.0) alpha:1.0].CGColor;
    
    
//    _bottomConstantOfTable.constant = _bottomConstantOfTable.constant + 265;
    //_topTableContant.constant = _topTableContant.constant +272;
    
//    NSInteger sectionsAmount = [_commentTableView numberOfSections];
//    NSInteger rowsAmount = [_commentTableView numberOfRowsInSection:sectionsAmount-1];
//    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:(rowsAmount - 1) inSection:(sectionsAmount - 1)];
//    NSLog(@"hgjhg");
    // NSLog(@"fghfg%d",(int)lastCellIndexPath);
//    [_commentTableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
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
//- (void)keyboardDidShow: (NSNotification *) notif{
//    NSLog(@"UP");
//    _viewConstraint.constant = _viewConstraint.constant + 253;
//
//    
//}
//- (void)keyboardDidHide: (NSNotification *) notif{
//    // Do something here
//    NSLog(@"In");
//    _viewConstraint.constant = _viewConstraint.constant - 253;
//
//}
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentTableViewCell *cell = (CommentTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
       cell.profileImageView.layer.borderWidth = 1;
    cell.profileImageView.layer.borderColor = [UIColor purpleColor].CGColor;
    cell.profileImageView.layer.cornerRadius = 15;
    cell.profileImageView.clipsToBounds = YES;
    switch (indexPath.row)
    {
        case 0:
            cell.profileImageView.image = [UIImage imageNamed:@"man1"];

            cell.profileTitleLabel.text = @"Anshu";
            cell.descriptionLabel.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu. ";
            break;
        case 1:
            cell.profileImageView.image = [UIImage imageNamed:@"man2"];
            
            cell.profileTitleLabel.text = @"Manoj";
            cell.descriptionLabel.text = @"The comments plugin lets people comment on content on your site using their Facebook account. ";
            break;
        case 2:
            cell.profileImageView.image = [UIImage imageNamed:@"man4"];
            
            cell.profileTitleLabel.text = @"Sarvada";
            cell.descriptionLabel.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu. ";
            break;
        case 3:
            cell.profileImageView.image = [UIImage imageNamed:@"man1"];
            
            cell.profileTitleLabel.text = @"Ravi";
            cell.descriptionLabel.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu. ";
            break;
        default:
            cell.profileImageView.image = [UIImage imageNamed:@"man2"];
            
            cell.profileTitleLabel.text = @"Samkisha";
            cell.descriptionLabel.text = @"The comments plugin lets people comment on content on your site using their Facebook account. ";
            break;
    }
    
    return cell;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.returnKeyType==UIReturnKeyNext)
    {
        UITextField *tf=(UITextField *)[self.view viewWithTag:textField.tag+1];
        [tf becomeFirstResponder];
    }
    else
    {
        [self.view endEditing:YES];
    }
    return YES;
}
- (IBAction)onSendBtnAction:(id)sender {
    _messageTextField.text = @Blank;
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    CGPoint offset = aScrollView.contentOffset;
    CGRect bounds = aScrollView.bounds;
    CGSize size = aScrollView.contentSize;
    UIEdgeInsets inset = aScrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    // NSLog(@"offset: %f", offset.y);
    // NSLog(@"content.height: %f", size.height);
    // NSLog(@"bounds.height: %f", bounds.size.height);
    // NSLog(@"inset.top: %f", inset.top);
    // NSLog(@"inset.bottom: %f", inset.bottom);
     NSLog(@"pos: %f of %f", y, h);
    
    float reload_distance = 10;
    if(y > h + reload_distance) {
        NSLog(@"load more rows");
    }
}

/*-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    //  textField.autocapitalizationType = UITextAutocapitalizationTypeWords ;
    
    
    if(textField.frame.origin.y)
        [self animateTextField:textField up:YES];
    
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
    
}
-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    
    
    int movementDistance = -253; // tweak as needed
    
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    return YES;
}
*/

@end
