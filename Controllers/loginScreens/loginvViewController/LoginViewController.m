//
//  loginViewController.m
//  loginScreens
//
//  Created by Sarvada Chauhan on 15/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//
#import "SignupViewController.h"
#import "LoginViewController.h"
#import "TableViewCell.h"
#import "ModalClass.h"
#import "NSObject+NSString.h"
@interface LoginViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    ModalClass *obj;
    int state;
}
@end

@implementation LoginViewController
BOOL checked;
- (void)viewDidLoad {
    [super viewDidLoad];
     [self.navigationController setNavigationBarHidden:YES];
    
   obj =[[ModalClass alloc]init];
    checked = YES;
    [self customInit];
    state=0;
    //[self.navigationController.navigationBar setFrame:CGRectMake(0, 0, self.view.frame.size.width,200.0)];
   // [[self navigationController]setNavigationBarHidden:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
 [self.navigationController setNavigationBarHidden:YES];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    switch (textField.tag) {
        case 10:
            obj.emailId=textField.text;
            break;
        case 11:
            obj.password=textField.text;
            break;
            
        default:
            break;
    }
   NSLog(@"%@",obj.emailId);
    return true;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper Methods
-(void)customInit {
              UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(hideKeyboard)];
              [self.view addGestureRecognizer:tap];  //to dismiss keyboard
}

-(void) hideKeyboard {
    [self.view endEditing:YES];
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"maincell"];
    cell.textField.tag=indexPath.row+10;
    switch(indexPath.row)
    {
        case 0:
            cell.label.text=@"Username";
            cell.textField.placeholder=@"Email id";
            cell.textField.text=obj.emailId;
            cell.textField.delegate = self;
            break;
        case 1:
            cell.label.text=@"Password";
            cell.textField.placeholder=@"Password";
            cell.textField.secureTextEntry=TRUE;
           cell.textField.text=obj.password;
            cell.textField.delegate = self;
            break;
    }
   
    return cell;
}

- (IBAction)rememberMeButton:(id)sender {
    if(!checked){
        [_checkBox setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
        checked = YES;
    }
    else if(checked){
        [_checkBox setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        checked = NO;
    }
}
\
- (IBAction)submitButton:(id)sender {
   // Validation *vobj=[[Validation alloc]init];
   // NSString *result=[vobj isVaildate:(NSString *) obj.emailId :(NSString *)obj.password];
    NSString *result=@"you are successfully logged in.";
    if([obj.emailId isEqualToString:@""])
    {
        result= @"Please enter username";
    }else if(![obj.emailId isValidEmail:obj.emailId ]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please enter valid emailId" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if(obj.password.length<8)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Password should be greter than 8 characters" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
//   else if([obj.password isEqualToString:@""])
//    {
//        result= @"Please enter password";
//    }
  
    
  
//    UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:nil  message:result  preferredStyle:UIAlertControllerStyleAlert];
//    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }]];
//    [self presentViewController:alertController animated:YES completion:nil];
}


- (IBAction)signupButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignupViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"SignupViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
