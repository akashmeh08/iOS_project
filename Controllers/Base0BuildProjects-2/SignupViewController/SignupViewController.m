//
//  SignupViewController.m
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "SignupViewController.h"
#import "SignUpTableViewCell.h"
#import "Macro.h"
@interface SignupViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIToolbarDelegate>
{
    UserInfo *mobj;
}

@property (weak, nonatomic) IBOutlet UIImageView *signUpImage;
@property (weak, nonatomic) IBOutlet UITableView *signUpTableView;

@end
@implementation SignupViewController

- (void)viewDidLoad {
   // [[self navigationController] setNavigationBarHidden:NO];
   // self.navigationItem.title = @"SignUp";
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO];
    self.navigationItem.title = @"SignUp";
    self.signUpTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mobj = [[UserInfo alloc]init];
    mobj.userFirstName=@"";
    mobj.userLastName=@"";
    mobj.userEmail=@"";
    mobj.userMobileNumber=@"";
    mobj.userPassword=@"";
    mobj.userConfirmPassword=@"";
    mobj.userGender=@"";
    mobj.tickTerms = @BLANK;
    
    UITapGestureRecognizer *selectProfileTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setProfilePicture)];
    selectProfileTapGesture.numberOfTapsRequired = 1;
    [self.signUpImage addGestureRecognizer:selectProfileTapGesture];
    [self customInit];
    // Do any additional setup after loading the view.
}

-(void)customInit {
    [self.signUpImage setUserInteractionEnabled:YES];
    
    _signUpImage.layer.borderWidth = 1;
    _signUpImage.layer.cornerRadius = 50;
    self.signUpImage.clipsToBounds = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];  //to dismiss keyboard
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)textChanged:(UITextField *)textField
{
    switch (textField.tag)
    {
        case 50:
            mobj.userFirstName = (NSString *) textField.text;
            break;
        case 51:
            mobj.userLastName = (NSString *) textField.text;
            break;
        case 52:
            mobj.userEmail = (NSString *) textField.text;
            break;
        case 53:
            mobj.userMobileNumber = (NSString *) textField.text;
            break;
        case 54:
            mobj.userPassword = (NSString *) textField.text;
            break;
        case 55:
            mobj.userConfirmPassword = (NSString *) textField.text;
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
- (void)onRadioBtnTouch:(UIButton *)sender {
    
    UIButton *maleBtn = (UIButton *)[self.view viewWithTag:1004];
    UIButton *femaleBtn = (UIButton *)[self.view viewWithTag:1005];
    switch (sender.tag) {
        case 1004:
            femaleBtn.selected = NO;
            maleBtn.selected = YES;
            mobj.userGender = @"Male";
            break;
        case 1005:
            femaleBtn.selected = YES;
            maleBtn.selected = NO;
            mobj.userGender = @"Female";
            break;
            
        default:
            break;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
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
    int movementDistance = -90;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = movementDistance;
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
    return 7;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SignUpTableViewCell *cell1 = (SignUpTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell1" ];
    SignUpTableViewCell *cell2 = (SignUpTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell2" ];
    cell2.maleBtn.tag = 1004;
    cell2.femaleBtn.tag = 1005;
    
    [cell2.maleBtn addTarget:self action:@selector(onRadioBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
    [cell2.femaleBtn
     addTarget:self action:@selector(onRadioBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
    
    cell1.signUpTextField .delegate = self;
    cell1.signUpTextField.tag = 50+indexPath.row;
    switch(indexPath.row)
    {
        case 0:
            cell1.signUpLabel.text = @"First Name:";
            cell1.signUpTextField.placeholder = @"First Name";
            cell1.signUpTextField.autocapitalizationType=UITextAutocapitalizationTypeWords;
            cell1.signUpTextField.returnKeyType = UIReturnKeyNext;
            return cell1;
        case 1:
            cell1.signUpLabel.text = @"Last Name:";
            cell1.signUpTextField.placeholder = @"Last Name";
            cell1.signUpTextField.autocapitalizationType=UITextAutocapitalizationTypeWords;
            cell1.signUpTextField.returnKeyType = UIReturnKeyNext;
            return cell1;
        case 2:
            cell1.signUpLabel.text = @"Email:";
            cell1.signUpTextField.placeholder = @"Email";
            cell1.signUpTextField.autocapitalizationType=UITextAutocapitalizationTypeWords;
            cell1.signUpTextField.returnKeyType = UIReturnKeyNext;
            return cell1;
        case 3:
            cell1.signUpLabel.text = @"Phone No:";
            cell1.signUpTextField.placeholder = @"Phone No";
            [cell1.signUpTextField setKeyboardType:UIKeyboardTypeNumberPad];
            cell1.signUpTextField.returnKeyType = UIReturnKeyNext;
            return cell1;
        case 4:
            cell1.signUpLabel.text = @"Password:";
            cell1.signUpTextField.placeholder = @"Password";
            cell1.signUpTextField.secureTextEntry=YES;
            cell1.signUpTextField.returnKeyType = UIReturnKeyNext;
            return cell1;
        case 5:
            cell1.signUpLabel.text = @" Confirm Password:";
            cell1.signUpTextField.placeholder = @"Confirm Password";
            cell1.signUpTextField.secureTextEntry=YES;
            cell1.signUpTextField.returnKeyType = UIReturnKeyDone;
            return cell1;
        case 6:
            return cell2;
    }
    return nil;
}

#pragma mark - UIImagePicker Delegate method

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    
    [self.signUpImage setImage:image];
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

//Action sheet cases to select from gallary or camera
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

- (IBAction)onBtnClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    if(btn.selected)
    {
        mobj.tickTerms = @"YES";
    }
    else {
        mobj.tickTerms = @"NO";
    }
}
- (IBAction)onSubmitt:(id)sender {
    NSString *result = @SUCCESS_REGISTRATION;
    
    if([mobj.userFirstName isEqualToString:@BLANK])
    {
        
        result = @BLANK_FirstNAME;
    }
    else if ([mobj.userLastName isEqualToString:@BLANK])
    {
        result=@BLANK_LastNAME;
    }
    else if ([mobj.userEmail isEqualToString:@BLANK])
    {
        result=@BLANK_EMAIL;
    }
    else if (![mobj.userEmail isValidEmail])
    {
        result=@VALID_EMAIL;
    }
    else if (![mobj.userMobileNumber isValidPhoneNumber])
    {
        result = @VALID_PHONE;
    }
    else if ([mobj.userPassword isEqualToString:@BLANK] )
    {
        result= @BLANK_PASSWORD;
    }
    else if (mobj.userPassword.length<6 )
    {
        result= @MIN_PASSWORD;
    }
    else if ([mobj.userConfirmPassword isEqualToString:@BLANK] )
    {
        result=@BLANK_CONFIRM_PASSWORD;
    }
    else if (![mobj.userPassword isEqualToString: mobj.userConfirmPassword] )
    {
        result=@PASSWORD_CONFIRM_PASSWORD_NOT_MATCH;
    }
    else if ([mobj.userGender isEqualToString:@BLANK])
    {
        result=@"Please select gender.";
    }
    else if([mobj.tickTerms isEqualToString:@"NO"])
    {
        result = @"Please select terms & conditions.";
    }
    if([result isEqualToString:@SUCCESS_REGISTRATION])
    {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"home"];
    [self.navigationController pushViewController:controller animated:YES ];
    }   else
    {
        [AlertController message:result onViewController:self];
    }
}


@end
