//
//  SignUpViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "SignUpViewController.h"

#import "Macro.h"
@interface SignUpViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *signupImageView;


    

@end

@implementation SignUpViewController
{
    UserInfo *mObj;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *selectProfileTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setProfilePicture)];
    selectProfileTapGesture.numberOfTapsRequired = 1;
    [self.signupImageView addGestureRecognizer:selectProfileTapGesture];
    [self customInit];
}




- (void)setProfilePicture
{
    [AlertController actionSheet:@"" message:@"Please select image source" andButtonsWithTitle:@[@"Take Photo",@"Choose Photo",@"Choose From Facebook"] onViewController:self dismissedWith:^(NSInteger index, NSString *buttonTitle)
    
     {
         
         UIImagePickerController *profileImagePicker = [[UIImagePickerController alloc] init];
         profileImagePicker.delegate = self;
         profileImagePicker.allowsEditing = YES;
         
         if (!index)
         {
             if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
             {
                 profileImagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
                 [self presentViewController:profileImagePicker animated:YES completion:NULL];
             }
             else
             {
                 [AlertController title:@"" message:@"Camera is not available" onViewController:self];
             
             }
         }
         else if (index == 1)
         {
             [self presentViewController:profileImagePicker animated:YES completion:NULL];
         }
     }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    
    [self.signupImageView setImage:image];
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) customInit
{
    _signupImageView.layer.borderColor = [UIColor greenColor].CGColor;
//    _signupImageView.layer.borderWidth = ;
    _signupImageView.layer.cornerRadius = 50;
    
    mObj = [[UserInfo alloc]init];
    mObj.userFirstName = @Blank;
    mObj.userLastName = @Blank;
    mObj.userEmail = @Blank;
    mObj.userMobileNumber = @Blank;
    mObj.userPassword = @Blank;
    mObj.userConfirmPassword = @Blank;
    mObj.userGender = @Blank;
    mObj.tickTerms = @Blank;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma Textfield value assign in model class;
-(void)textChanged:(UITextField *)textField
{
    switch (textField.tag)
    {
        case 200:
            mObj.userFirstName = (NSString *) textField.text;
            break;
        case 201:
            mObj.userLastName = (NSString *) textField.text;
            break;
        case 202:
            mObj.userEmail = (NSString *) textField.text;
            break;
        case 203:
            mObj.userMobileNumber = (NSString *) textField.text;
            break;
        case 204:
            mObj.userPassword = (NSString *) textField.text;
            break;
        case 205:
            mObj.userConfirmPassword = (NSString *) textField.text;
            break;
            
        default:
            break;
    }
    
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
#pragma Keyboard methods
-(void)dismissKeyboard{
    [self.view endEditing:YES];
    
}
#pragma UITableView inititialisation
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SignUpTableViewCell *cell1 = (SignUpTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    SignUpTableViewCell *cell2 = (SignUpTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell2"];

    [cell1.signupTextField addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    cell1.signupTextField.tag = 200 + indexPath.row;
    cell1.signupTitleLabel.text = @"Enter Name:";
    [cell1.signupTextField setKeyboardType:UIKeyboardTypeAlphabet];
    cell1.signupTextField.secureTextEntry = NO;
    cell1.signupTextField.delegate = self;
    NSLog(@"%@",mObj.userGender);
    if([mObj.userGender isEqualToString:@"Male"])
        cell2.maleBtn.selected = YES;
    else if([mObj.userGender isEqualToString:@"Female"])
        cell2.femaleBtn.selected = YES;
    if([mObj.tickTerms isEqualToString:@"YES"])
        cell2.termsCheckBtn.selected = YES;
     cell2.selectionStyle=UITableViewCellSelectionStyleNone;
     cell1.selectionStyle=UITableViewCellSelectionStyleNone;
    switch(indexPath.row)
    {
        case 0:
            cell1.signupTitleLabel.text = @"First Name:";
            
            cell1.signupTextField.placeholder = @"First Name";
            cell1.signupTextField.autocapitalizationType =UITextAutocapitalizationTypeWords;
            cell1.signupTextField.returnKeyType = UIReturnKeyNext;
            cell1.signupTextField.text = mObj.userFirstName;
            return cell1;
        case 1:
            cell1.signupTitleLabel.text = @"Last Name:";
            
            cell1.signupTextField.placeholder = @"Last Name";
            cell1.signupTextField.autocapitalizationType =UITextAutocapitalizationTypeWords;
            cell1.signupTextField.returnKeyType = UIReturnKeyNext;
             cell1.signupTextField.text = mObj.userLastName;
            return cell1;
        case 2:
            cell1.signupTitleLabel.text = @"Email:";
            [cell1.signupTextField setKeyboardType:UIKeyboardTypeEmailAddress];
            cell1.signupTextField.placeholder = @"Email";
                       cell1.signupTextField.returnKeyType = UIReturnKeyNext;
             cell1.signupTextField.text = mObj.userEmail;
            return cell1;
        case 3:
        {
            UIToolbar *toolbar = [[UIToolbar alloc] init];
            [toolbar setBarStyle:UIBarStyleBlackTranslucent];
            [toolbar sizeToFit];
            UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
            UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissKeyboard)];
            doneButton.tag = 3001;
            NSArray *itemsArray = [NSArray arrayWithObjects:flexButton, doneButton, nil];
            
            // [flexButton release];
            //[doneButton release];
            [toolbar setItems:itemsArray];
            
            [cell1.signupTextField setInputAccessoryView:toolbar];
            
            
            cell1.signupTitleLabel.text = @"Phone No:";
            cell1.signupTextField.placeholder = @"Phone No";
            [cell1.signupTextField setKeyboardType:UIKeyboardTypeNumberPad ];
            
            cell1.signupTextField.returnKeyType = UIReturnKeyNext;
            cell1.signupTextField.text = mObj.userMobileNumber;
            return cell1;
            
        }
        case 4:
            cell1.signupTitleLabel.text = @"Password";
            cell1.signupTextField.placeholder = @"Password";
           cell1.signupTextField.secureTextEntry=YES;
            cell1.signupTextField.returnKeyType = UIReturnKeyNext;
           cell1.signupTextField.text = mObj.userPassword;
            return cell1;
        case 5:
            cell1.signupTitleLabel.text = @"Confirm Password";
            cell1.signupTextField.placeholder = @"Confirm Password";
           cell1.signupTextField.secureTextEntry=YES;
            cell1.signupTextField.returnKeyType = UIReturnKeyDone;
            cell1.signupTextField.text = mObj.userConfirmPassword;
            return cell1;
        case 6:
            return cell2;
        default:
            break;
    }
    return nil;
    
    
    
}
- (IBAction)onGenderBtnAction:(UIButton*)sender {
    
    UIButton *maleBtn = (UIButton *)[self.view viewWithTag:210];
    UIButton *femaleBtn = (UIButton *)[self.view viewWithTag:211];
   
    if(sender.tag == 210)
    {
        maleBtn.selected = YES;
        femaleBtn.selected = NO;
        mObj.userGender = @"Male";
        
    }
    else
    {
        maleBtn.selected = NO;
        femaleBtn.selected = YES;
        mObj.userGender = @"Female";
    }
}

- (IBAction)onTermsCheckBtn:(UIButton*)sender {
    sender.selected = !sender.selected;
    if(sender.selected)
        mObj.tickTerms = @"YES";
    else
        mObj.tickTerms = @"NO";
}
- (IBAction)signUpBtnAction:(id)sender {
    
    NSString *result = @SUCESS_REGISTRATION;
    
    if([mObj.userFirstName isEqualToString:@Blank])
    {
        
        result = @BLANK_FirstNAME;
    }
    else if ([mObj.userLastName isEqualToString:@Blank])
    {
        result=@BLANK_LastNAME;
    }
    else if ([mObj.userEmail isEqualToString:@Blank])
    {
        result=@BLANK_EMAIL;
    }
    else if (![mObj.userEmail isValidEmail])
    {
        result=@VALID_EMAIL;
    }
    else if (![mObj.userMobileNumber isValidPhoneNumber])
    {
        result = @VALID_PHONE;
    }
    else if ([mObj.userPassword isEqualToString:@Blank] )
    {
        result= @BLANK_PASSWORD;
    }
    else if (mObj.userPassword.length<6 )
    {
        result= @VALID_PASSWORD;
    }
    else if ([mObj.userConfirmPassword isEqualToString:@Blank] )
    {
        result=@BLANK_CONFIRM_PASSWORD;
    }
    else if (![mObj.userPassword isEqualToString: mObj.userConfirmPassword] )
    {
        result=@PASSWORD_CONFIRM_PASSWORD_NOT_MATCH;
    }
    else if ([mObj.userGender isEqualToString:@Blank])
    {
        result=@"Please select gender.";
    }
    
    if([result isEqualToString:@SUCESS_REGISTRATION])
    {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HomeViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        
        [self.navigationController pushViewController:controller animated:YES ];
    }
    else
    {
        [AlertController message:result onViewController:self];
    }

    
}
@end
