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
#import "TandPViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"

@interface SignUpViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *arrCapElements;
    BOOL flag, check;
    UserInfo *mObj;
    
}
@property (weak, nonatomic) IBOutlet UILabel *captchLabel;

@property (weak, nonatomic) IBOutlet UITextField *captchaTextfield;
@property (weak, nonatomic) IBOutlet UIButton *captchaImage;
//property (weak, nonatomic) IBOutlet UIButton *onRoleBtnClick;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customInit];
    [self.navigationController setNavigationBarHidden:NO];
  self.navigationItem.title = @"Sign Up";
    arrCapElements = [[NSArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    [self load_captcha ];
    flag = NO;
    check = NO;
     mObj = [[UserInfo alloc]init];
    
    [self customInit];
    

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];  //to dismiss keyboard
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"Sign Up";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)load_captcha{
    
    @try {
        
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        _captchLabel.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];

        //Captcha_label.textColor=[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        
        NSUInteger elmt1,elmt2,elmt3,elmt4,elmt5,elmt6;
        
        elmt1 = arc4random() % [arrCapElements count];
        
        elmt2= arc4random() % [arrCapElements count];
        
        elmt3 = arc4random() % [arrCapElements count];
        
        elmt4 = arc4random() % [arrCapElements count];
        
        elmt5 = arc4random() % [arrCapElements count];
        
        elmt6 = arc4random() % [arrCapElements count];
        
        
        
        NSString *Captcha_string = [NSString stringWithFormat:@"%@%@%@%@%@%@",arrCapElements[elmt1-1],arrCapElements[elmt2-1],arrCapElements[elmt3-1],arrCapElements[elmt4-1],arrCapElements[elmt5-1],arrCapElements[elmt6-1]];
        _captchLabel.text = Captcha_string;
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"%@",exception);
        
    }
    
}


-(void) customInit
{
  
    mObj.userEmail = @Blank;
    mObj.userPassword = @Blank;
    mObj.userConfirmPassword = @Blank;
    mObj.userRole = @Blank;
    mObj.tickTerms = @Blank;
    
//    _signupImageView.userInteractionEnabled = YES;
    
    [self.navigationController setNavigationBarHidden:NO];
    UITapGestureRecognizer *selectProfileTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setprofilePicture)];
    selectProfileTapGesture.numberOfTapsRequired = 1;
//    [self.signupImageView addGestureRecognizer:selectProfileTapGesture];
   
}

#pragma Textfield value assign in model class;
-(void)textChanged:(UITextField *)textField
{
    switch (textField.tag)
    {
        case 200:
            mObj.userEmail = (NSString *) textField.text;
           break;
        case 201:
            mObj.userPassword = (NSString *) textField.text;
            break;
        case 202:
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
    
    return 4;
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
    NSLog(@"%@",mObj.userRole);
    if([mObj.userRole isEqualToString:@"King"])
        cell2.kingBtn.selected = YES;
    else if([mObj.userGender isEqualToString:@"Queen"])
        cell2.queenBtn.selected = YES;
       else if([mObj.userRole isEqualToString:@"Girl"])
        
        cell2.girlBtn.selected = YES;
    
    else if([mObj.userRole isEqualToString:@"boy"])
         cell2.boyBtn.selected = YES;
    if([mObj.tickTerms isEqualToString:@"YES"])
        cell2.termsCheckBtn.selected = YES;


    switch(indexPath.row)
    {
//        case 0:
//            cell1.signupTitleLabel.text = @"First Name:";
//            
//            cell1.signupTextField.placeholder = @"First Name";
//            cell1.signupTextField.autocapitalizationType =UITextAutocapitalizationTypeWords;
//            cell1.signupTextField.returnKeyType = UIReturnKeyNext;
//            cell1.signupTextField.text = mObj.userFirstName;
//            return cell1;
//        case 1:
//            cell1.signupTitleLabel.text = @"Last Name:";
//            
//            cell1.signupTextField.placeholder = @"Last Name";
//            cell1.signupTextField.autocapitalizationType =UITextAutocapitalizationTypeWords;
//            cell1.signupTextField.returnKeyType = UIReturnKeyNext;
//             cell1.signupTextField.text = mObj.userLastName;
//            return cell1;
        case 0:
            cell1.signupTitleLabel.text = @"Email:";
            [cell1.signupTextField setKeyboardType:UIKeyboardTypeEmailAddress];
            cell1.signupTextField.placeholder = @"Email";
                       cell1.signupTextField.returnKeyType = UIReturnKeyNext;
             cell1.signupTextField.text = mObj.userEmail;
            return cell1;
 
        case 1:
            cell1.signupTitleLabel.text = @"Password:";
            cell1.signupTextField.placeholder = @"Password";
           cell1.signupTextField.secureTextEntry=YES;
            cell1.signupTextField.returnKeyType = UIReturnKeyNext;
           cell1.signupTextField.text = mObj.userPassword;
            return cell1;
        case 2:
            cell1.signupTitleLabel.text = @"Confirm Password:";
            cell1.signupTextField.placeholder = @"Confirm Password";
           cell1.signupTextField.secureTextEntry=YES;
            cell1.signupTextField.returnKeyType = UIReturnKeyDone;
            cell1.signupTextField.text = mObj.userConfirmPassword;
            return cell1;
        case 3:
            return cell2;
        default:
            break;
    }
    return nil;
    }

- (IBAction)onRoleBtn:(UIButton*)sender
{
    
    UIButton *kingBtn = (UIButton *)[self.view viewWithTag:210];
    UIButton *queenBtn = (UIButton *)[self.view viewWithTag:211];
      UIButton *girlBtn = (UIButton *)[self.view viewWithTag:212];
    UIButton *boyBtn = (UIButton *)[self.view viewWithTag:213];
    if(sender.tag == 210)
     {
        kingBtn.selected = YES;
        queenBtn.selected = NO;
        boyBtn.selected = NO;
        girlBtn.selected = NO;
         check = YES;
        mObj.userRole = @"King";
        
    }
    else if(sender.tag== 211)
    {
        kingBtn.selected = NO;
        queenBtn.selected = YES;
        boyBtn.selected = NO;
        girlBtn.selected = NO;
         check = YES;
        mObj.userRole = @"Queen";
    }
    else if(sender.tag== 212)
    {
        kingBtn.selected = NO;
        queenBtn.selected = NO;
        boyBtn.selected = NO;
        girlBtn.selected = YES;
         check = YES;
        mObj.userRole = @"Girl";
    }
    else if(sender.tag== 213)
    {
        kingBtn.selected = NO;
        queenBtn.selected = NO;
        boyBtn.selected = YES;
        girlBtn.selected = NO;
         check = YES;
        mObj.userGender = @"Boy";
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
//    //NSString *imageBase64 = [self imageEncode];
//    [params setValue:TRIM_SPACE(mObj.userFirstName) forKey:pFirstName];
//    [params setValue:TRIM_SPACE(mObj.userLastName) forKey:pLastName];
    [params setValue:TRIM_SPACE(mObj.userEmail) forKey:pEmail];
    [params setValue:TRIM_SPACE(mObj.userPassword) forKey:pPassword];
         [params setValue:TRIM_SPACE(mObj.userPassword) forKey:puserRole];
//    [params setValue:TRIM_SPACE(mObj.userGender) forKey:pGender];
//    //[params setValue:imageBase64 forKey:pImage];
//    [params setValue:_DeviceType forKey:pDeviceType];
//    [params setValue:@"" forKey:pDeviceToken];
//    [[ServiceHelper helper] request:params apiName:kApiUsers withToken:YES method:POST onViewController:self completionBlock:^(id result, NSError *error) {
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
//        if([[result objectForKey:@_RESPONSE_CODE ] integerValue]== 200)
//        {
//            [NSUSERDEFAULT setValue:[result objectForKey:@"userId"] forKey:@_USER_ID_LOCAL];
//            [NSUSERDEFAULT synchronize];
//            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            SWRevealViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeScreen"];
//            [self.navigationController pushViewController:controller animated:YES ];
//        }
//        else
//        {
//            [AlertController message:@_RESPONSE_MESSAGE onViewController:self];
//        }
//    }];
   }
}

    -(BOOL)validateEmail{
    
    NSString *result = @SUCESS_REGISTRATION;
    
        
    if ([mObj.userEmail isEqualToString:@Blank])
    {
        result=@BLANK_EMAIL;
    }
    else if ([mObj.userEmail isValidEmail])
    {
        result=@VALID_EMAIL;
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
    else if([_captchaTextfield.text isEqualToString:@Blank]){
        result = @BLANK_CAPTCHA;
    }
        //   else if(![_captchaLabel.text isEqualToString: _captchTextField.text]){
        //       result = @VALID_CAPTCHA;
        //   }
    else if (!check)
    {
        result = @"Please choose one User Role.";
    }

      else if (!flag)
    {
        result = @"Please accept Terms & Policies.";
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
    
    
//    [self.signupImageView setImage:image];
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

//Action sheet cases to select from gallary or camera
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
          if (textField.text.length >=64 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            return YES;
            
        }
    
    }


- (IBAction)termsAndPolicyButton:(id)sender
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TandPViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"TandPViewController"];
    [self.navigationController pushViewController:controller animated:YES ];

}
@end
