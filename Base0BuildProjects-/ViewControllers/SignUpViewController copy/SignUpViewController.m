//
//  SignUpViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//


#import "UserInfo.h"
#import "Macro.h"
#import "Header.h"
#import "OptionsPickerSheetView.h"

@interface SignUpViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIImageView *signupImageView;



    

@end

@implementation SignUpViewController
{
    UserInfo *mObj;
    bool flag;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    flag = NO;
    [self customInit];
    
}


    

-(NSString*) imageEncode
{
    UIImage * profileImage = _signupImageView.image;
    NSData *imageData=UIImagePNGRepresentation(profileImage);
    NSString *base64 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"Sign Up";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) customInit
{
    _signupImageView.layer.borderColor = [UIColor greenColor].CGColor;
    _signupImageView.layer.borderWidth = 1;
    _signupImageView.layer.cornerRadius = 50;
    self.signupImageView.clipsToBounds = YES;

    
    mObj = [[UserInfo alloc]init];
    mObj.userFirstName = @Blank;
    mObj.userLastName = @Blank;
    mObj.userEmail = @Blank;
    mObj.userMobileNumber = @Blank;
    mObj.userPassword = @Blank;
    mObj.userConfirmPassword = @Blank;
    mObj.userGender = @Blank;
    mObj.tickTerms = @Blank;
    
    _signupImageView.userInteractionEnabled = YES;
    
    [self.navigationController setNavigationBarHidden:NO];
    UITapGestureRecognizer *selectProfileTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setprofilePicture)];
    selectProfileTapGesture.numberOfTapsRequired = 1;
    [self.signupImageView addGestureRecognizer:selectProfileTapGesture];
   
}

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
            cell1.signupTitleLabel.text = @"Password:";
            cell1.signupTextField.placeholder = @"Password";
           cell1.signupTextField.secureTextEntry=YES;
            cell1.signupTextField.returnKeyType = UIReturnKeyNext;
           cell1.signupTextField.text = mObj.userPassword;
            return cell1;
        case 5:
            cell1.signupTitleLabel.text = @"Confirm Password:";
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
    {    mObj.tickTerms = @"YES";
    
        flag = YES;
    }
    else
    {
        mObj.tickTerms = @"NO";
        flag = NO;
    }
}

- (IBAction)signUpBtnAction:(id)sender {
    if ([self validateEmail]) {
    NSMutableDictionary * params = [[NSMutableDictionary alloc] init];
    NSString *imageBase64 = [self imageEncode];
    [params setValue:TRIM_SPACE(mObj.userFirstName) forKey:pFirstName];
        
    [params setValue:TRIM_SPACE(mObj.userLastName) forKey:pLastName];
    [params setValue:TRIM_SPACE(mObj.userEmail) forKey:pEmail];
    [params setValue:TRIM_SPACE(mObj.userMobileNumber) forKey:pContactNumber];
    [params setValue:TRIM_SPACE(mObj.userPassword) forKey:pPassword];
    [params setValue:TRIM_SPACE(mObj.userGender) forKey:pGender];
    [params setValue:imageBase64 forKey:pImage];
    [params setValue:_DeviceType forKey:pDeviceType];
    [params setValue:@"" forKey:pDeviceToken];
    [[ServiceHelper helper] request:params apiName:kApiUsers withToken:YES method:POST onViewController:self completionBlock:^(id result, NSError *error) {
//        NSString *userID = [result objectForKey:@"responseCode"];
//        if([userID isEqualToString:@"401"])
//        {
//            [AlertController message:@"Email already exist." onViewController:self];
//            
//        }
//        else
//        {
//            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            SWRevealViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeScreen"];
//            [self.navigationController pushViewController:controller animated:YES];
//        }
//    }];
        if([[result objectForKey:@_RESPONSE_CODE ] integerValue]== 200)
        {
            [NSUSERDEFAULT setValue:[result objectForKey:@"userId"] forKey:@_USER_ID_LOCAL];
            [NSUSERDEFAULT synchronize];
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            SWRevealViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeScreen"];
            [self.navigationController pushViewController:controller animated:YES ];
        }
        else
        {
            [AlertController message:@_RESPONSE_MESSAGE onViewController:self];
        }
    }];
    }
}

    -(BOOL)validateEmail{
    
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
    else if ([mObj.userEmail isValidEmail])
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
    else if (!flag)
    {
        result = @"Please accept terms & policies.";
    }
    
    if([result isEqualToString:@SUCESS_REGISTRATION])
    {
       //[self makeWebApiForSignUp];
        return true;
    }
    else
    {
        [AlertController message:result onViewController:self];
    }
    return false;

    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    
    [self.signupImageView setImage:image];
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

//Action sheet cases to select from gallary or camera
- (void)setprofilePicture
{
    [AlertController actionSheet:@"" message:@"Please select image source." andButtonsWithTitle:@[@"Take Photo",@"Choose Photo",@"Choose from facebook"] onViewController:self dismissedWith:^(NSInteger index, NSString *buttonTitle)
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
                 [AlertController message:@"Camera is not available." onViewController:self];
             }
         }
         else if (index == 1)
         {
             [self presentViewController:profileImagePicker animated:YES completion:NULL];
         }
     }];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // NSCharacterSet *MYCHAR = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"];
    if(textField.tag == 203)
    {
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        for (int i = 0; i < [string length]; i++)
        {
            unichar c = [string characterAtIndex:i];
            if (![myCharSet characterIsMember:c])
            {
                return NO;
            }
        }
        if([string isEqualToString:@""])
        {
            return YES;
        }
        if(textField.text.length <= 9 )
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    
    if(string.length > 64)
    {
        string = [string substringFromIndex:64];
        textField.text = string;
        return NO;
    }
    else
    {
        if((textField.tag == 200)||(textField.tag == 201))
        {
            NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"];
            for (int i = 0; i < [string length]; i++)
            {
                unichar c = [string characterAtIndex:i];
                if (![myCharSet characterIsMember:c])
                {
                    return NO;
                }
            }
            
        }
        if (textField.text.length >=64 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            return YES;
            
        }
    }
    
    
}


- (IBAction)termsAndPolicyButton:(id)sender
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TandPViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"TandPViewController"];
    [self.navigationController pushViewController:controller animated:YES ];

}
@end
