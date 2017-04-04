//
//  CommentViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "Header.h"
@interface CommentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *commentTableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *viewConstraint;

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"Comments";
    
    self.commentTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.commentTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    _messageTextField.layer.borderWidth = 1;
    _messageTextField.layer.borderColor = [UIColor colorWithRed:(199/255.0) green:(199/255.0) blue:(199/255.0) alpha:1.0].CGColor;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardDidShow: (NSNotification *) notif{
    NSLog(@"UP");
   }

- (void)keyboardDidHide: (NSNotification *) notif{
       NSLog(@"In");
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
    cell.profileImageView.layer.cornerRadius = 21;
    cell.profileImageView.clipsToBounds = YES;
   
  
    
       switch (indexPath.row)
    {
        case 0:
            cell.profileImageView.image = [UIImage imageNamed:@"man1"];

            cell.profileTitleLabel.text = @"Sarvada Chauhan";
            cell.descriptionLabel.text = @"Nice Pic. ";
            break;
        case 1:
            cell.profileImageView.image = [UIImage imageNamed:@"man2"];
            
            cell.profileTitleLabel.text = @"Manoj Kumar Singh";
            cell.descriptionLabel.text = @"Good click. ";
             cell.timeLabel.text = @"7 min ago";
            break;
        case 2:
            cell.profileImageView.image = [UIImage imageNamed:@"man4"];
            
            cell.profileTitleLabel.text = @"Anshu Aggrawal";
            cell.descriptionLabel.text = @"Looking good. ";
            cell.timeLabel.text = @"8 min ago";

            break;
        case 3:
            cell.profileImageView.image = [UIImage imageNamed:@"man1"];
            
            cell.profileTitleLabel.text = @"Sam Chauhan";
            cell.descriptionLabel.text = @"Awesome.";
            cell.timeLabel.text = @"8 min ago";

            break;
        case 4:
            cell.profileImageView.image = [UIImage imageNamed:@"girl2"];
            
            cell.profileTitleLabel.text = @"Priya Srivastava";
            cell.descriptionLabel.text = @"Nice Click:). ";
            break;
        case 5:
            cell.profileImageView.image = [UIImage imageNamed:@"man2"];
            
            cell.profileTitleLabel.text = @"Ashish Gupta";
            cell.descriptionLabel.text = @"Good click. ";
            cell.timeLabel.text = @"7 min ago";
            break;
        case 6:
            cell.profileImageView.image = [UIImage imageNamed:@"man4"];
            
            cell.profileTitleLabel.text = @"Samiksha Vashishth";
            cell.descriptionLabel.text = @"Looking good. ";
            cell.timeLabel.text = @"8 min ago";
            
            break;
        case 7:
            cell.profileImageView.image = [UIImage imageNamed:@"man1"];
            
            cell.profileTitleLabel.text = @"Annu Jha";
            cell.descriptionLabel.text = @"Awesome.";
            cell.timeLabel.text = @"8 min ago";
            break;
        case 8:
            cell.profileImageView.image = [UIImage imageNamed:@"man1"];
            
            cell.profileTitleLabel.text = @"Annu Jha";
            cell.descriptionLabel.text = @"Awesome.";
            cell.timeLabel.text = @"8 min ago";
            break;
        default:
            cell.profileImageView.image = [UIImage imageNamed:@"man5"];
            
            cell.profileTitleLabel.text = @"Akash Mehrotra";
            cell.descriptionLabel.text = @"Nice. ";
            cell.timeLabel.text = @"9 min ago";
            

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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    CGPoint offset = aScrollView.contentOffset;
    CGRect bounds = aScrollView.bounds;
    CGSize size = aScrollView.contentSize;
    UIEdgeInsets inset = aScrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
     NSLog(@"pos: %f of %f", y, h);
    
    float reload_distance = 10;
    if(y > h + reload_distance) {
        NSLog(@"load more rows");
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    _viewConstraint.constant = 250;
     [self.commentTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:9 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _viewConstraint.constant = 0;
    
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

@end
