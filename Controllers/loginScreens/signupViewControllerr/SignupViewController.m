//
//  signupViewController.m
//  loginScreens
//
//  Created by Sarvada Chauhan on 15/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import "SignupViewController.h"

#import "SignupTableViewCell.h"
#import "ModalClass.h"
@interface SignupViewController ()<UITextFieldDelegate,UITableViewDataSource>
{
    ModalClass *obj;
}
@end
@implementation SignupViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    obj =[[ModalClass alloc]init];
    //[self.navigationController.navigationBar setFrame:CGRectMake(0, 0, self.view.frame.size.width,200.0)];
[[self navigationController]setNavigationBarHidden:NO];
    
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 70;
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
       SignupTableViewCell *cell = (SignupTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"main"];
   
  cell.signupTextField.tag=indexPath.row+8;
    
   switch(indexPath.row)
  {
       case 0:
            cell.signupLabel.text=@"First Name";
            cell.signupTextField.placeholder=@"First Name";
            cell.signupTextField.delegate =self;
           //cell.textField.text=obj.emailId;
            break;
       case 1:
            cell.signupLabel.text=@"Last Name";
            cell.signupTextField.placeholder=@"Last Name";
           // cell.textField.text=obj.emailId;
            cell.signupTextField.delegate =self;

            break;
        case 2:
           cell.signupLabel.text=@"Email";
            cell.signupTextField.placeholder=@"Email";
            //cell.textField.text=obj.emailId;
            cell.signupTextField.delegate =self;

            break;
       case 3:
            cell.signupLabel.text=@"Mobile Number";
            cell.signupTextField.placeholder=@"Mobile Number";
            //cell.textField.text=obj.emailId;
            cell.signupTextField.delegate =self;

            break;
        case 4:
            cell.signupLabel.text=@"Password";
            cell.signupTextField.placeholder=@"Password";
           // cell.textField.text=obj.emailId;
            cell.signupTextField.delegate =self;

            break;
        case 5:
            cell.signupLabel.text=@"Confirm Password";
            cell.signupTextField.placeholder=@"Confirm Password";
            cell.signupTextField.delegate =self;

            //cell.textField.text=obj.emailId;
          break;
         }
   
    return cell;

}

@end
