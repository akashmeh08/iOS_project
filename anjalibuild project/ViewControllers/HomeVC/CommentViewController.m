//
//  CommentViewController.m
//  BaseProject
//
//  Created by Anjali on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "Header.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardOnScreen:) name:UIKeyboardDidShowNotification object:nil];
    //NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardOffScreen:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title  = @"Comments";
}


-(void)keyboardOnScreen:(NSNotification *)notification
{
    NSDictionary *info  = notification.userInfo;
    NSValue      *value = info[UIKeyboardFrameEndUserInfoKey];
    
    CGRect rawFrame      = [value CGRectValue];
    CGRect keyboardFrame = [self.view convertRect:rawFrame fromView:nil];
    
    NSLog(@"keyboardFrame: %@", NSStringFromCGRect(keyboardFrame));
    _constraintViewBottom.constant = keyboardFrame.size.height;
}

-(void)keyboardOffScreen:(NSNotification *)notification
{
    _constraintViewBottom.constant = 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentTableViewCell *cell = (CommentTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.commentImageView.layer.borderWidth = 1;
    //cell.layer.borderWidth = 1;
    cell.commentImageView.layer.borderWidth = 1;
    cell.commentImageView.layer.cornerRadius = 40;
    switch (indexPath.row)
    {
        case 0:
            cell.commentImageView.image = [UIImage imageNamed:@"index1"];
            cell.nameImageView.text = @" Anjali";
          cell.commentTimeSpan.text = @"5 mins ago.";
            cell.commentLabel.text = @"You are looking very nice, nice to see you.Where are you now a days.";
            
            break;
        case 1:
            cell.commentImageView.image = [UIImage imageNamed:@"index"];
            cell.nameImageView.text = @" Manish";
            cell.commentTimeSpan.text = @"10 mins ago.";
            cell.commentLabel.text = @"Waaaw. Amazing atmosphere here.nice to see you.Where are you now a days";
            
            break;
        case 2:
            cell.commentImageView.image = [UIImage imageNamed:@"index2"];
            cell.nameImageView.text = @" Hemant";
            cell.commentTimeSpan.text = @"15 mins ago.";
            cell.commentLabel.text = @"How are you.nice to see you.Where are you now a days";
            
        case 3:
            cell.commentImageView.image = [UIImage imageNamed:@"index1"];
            cell.nameImageView.text = @" Anjali";
            cell.commentTimeSpan.text = @"15 mins ago.";
            cell.commentLabel.text = @"You are looking very nice, nice to see you.";
            
            break;
        case 4:
            cell.commentImageView.image = [UIImage imageNamed:@"index"];
            cell.nameImageView.text = @" Manish";
            cell.commentLabel.text = @"Waaaw.ice to see you.Where are you now a daysice to see you.Where are you now a days";
             cell.commentTimeSpan.text = @"25 mins ago.";
            break;
        case 5:
            cell.commentImageView.image = [UIImage imageNamed:@"index2"];
            cell.nameImageView.text = @" Hemant";
             cell.commentTimeSpan.text = @"25 mins ago.";
            cell.commentLabel.text = @"How are you.nice to see you.Where are you now a days.";
            
            break;
            
            
            
        default:
            break;
    }
    
    return cell;
    
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    //  textField.autocapitalizationType = UITextAutocapitalizationTypeWords ;
 //   _constraintsView.constant = +250;
    
   // if(textField.frame.origin.y)
       // [self animateTextField:textField up:YES];
    
   
    
    [_myTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:true];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
   // [self animateTextField:textField up:NO];
  // _constraintViewBottom.constant = -250;
    
}
/*-(void)animateTextField:(UITextField*)textField up:(BOOL)up
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
*/

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)sendButtonClick:(id)sender {
    _commentTextField.text = @"";
}
@end
