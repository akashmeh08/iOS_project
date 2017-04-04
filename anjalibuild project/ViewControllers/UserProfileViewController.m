//
//  UserProfileViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "UserProfileViewController.h"
#import "UserProfileTableViewCell.h"
#import "Header.h"
#import "OptionsPickerSheetView.h"
@interface UserProfileViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UIButton *maleBtn;
@property (strong, nonatomic) IBOutlet UIButton *femaleBtn;
@property (strong, nonatomic) IBOutlet UITableView *userprofileTableView;

@end

@implementation UserProfileViewController
{
    bool flag;
    NSDictionary *profileData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _profileImageView.layer.borderWidth = 1;
    _profileImageView.layer.cornerRadius = 40;
    self.profileImageView.clipsToBounds = YES;
    self.navigationItem.backBarButtonItem.title = @"Back";
    self.navigationItem.title = @"Anjali";
    
        _femaleBtn.selected = YES;
    
    _profileImageView.userInteractionEnabled = NO;
    
    [self.navigationController setNavigationBarHidden:NO];
    UITapGestureRecognizer *selectProfileTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setprofilePicture)];
    selectProfileTapGesture.numberOfTapsRequired = 1;
    [self.profileImageView addGestureRecognizer:selectProfileTapGesture];


    flag = NO;
    
  
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];  //to dismiss keyboard
    [self makeWebApiForUserProfile];
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}
-(void)makeWebApiForUserProfile{
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] init];
    
    [params setValue:@"80" forKey:pUserId];
    
    [[ServiceHelper helper] request:params apiName:kApiMenu withToken:@"" method:POST onViewController:self completionBlock:^(id result, NSError *error) {
        
        NSString *userId = [result objectForKey:@"responseCode"];
        LogInfo("response code ==%@",userId);
        if([userId isEqualToString:@"200"])
        {
            profileData = [[NSDictionary alloc] initWithDictionary:[result objectForKey:@"user_data"]];
            NSString * imageUrl = [profileData objectForKey:pProfileImage];
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
            
            _profileImageView.image = [UIImage imageWithData:imageData];
           // NSString *userName = [[profileData objectForKey:pFisrtname]stringByAppendingString:[profileData objectForKey:pLastname]];
            //.text = userName;
            [_userprofileTableView reloadData];
            
        }
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onEditClick:(UIButton*)sender {
    
    sender.selected = !sender.selected;
    flag = !flag;
    _profileImageView.userInteractionEnabled = !_profileImageView.userInteractionEnabled;
    NSLog(@"%d",flag);
    [self.userprofileTableView reloadData];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UserProfileTableViewCell *cell = (UserProfileTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.editTextField.keyboardType = UIKeyboardTypeDefault;
    cell.editTextField.delegate = self;
    cell.editTextField.tag = 300 + indexPath.row;
    if(!flag )
    {
        cell.editTextField.userInteractionEnabled = NO;
        cell.editTextField.layer.borderWidth = 0.0;
        cell.editTextField.layer.borderColor = [UIColor whiteColor].CGColor;
        _femaleBtn.userInteractionEnabled = NO;
        _maleBtn.userInteractionEnabled = NO;
        
    }
    else{
        cell.editTextField.userInteractionEnabled = YES;
        cell.editTextField.layer.borderWidth = 1;
        cell.editTextField.layer.borderColor = [UIColor colorWithRed:(218/255.0) green:(218/255.0) blue:(218/255.0) alpha:1.0].CGColor;
        _femaleBtn.userInteractionEnabled = YES;
        _maleBtn.userInteractionEnabled = YES;

    }
    
    switch (indexPath.row)
    {
        case 0:
            cell.textFieldTitle.text = @"First Name:";
            cell.editTextField.text =[profileData objectForKey:pFisrtname];
            cell.editTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
            cell.editTextField.returnKeyType = UIReturnKeyNext;
            
            break;
        case 1:
            cell.textFieldTitle.text = @"Last Name:";
            cell.editTextField.text = [profileData objectForKey:pLastname];
            cell.editTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
             cell.editTextField.returnKeyType = UIReturnKeyNext;
            break;
        case 2:
            cell.textFieldTitle.text = @"Email:";
            cell.editTextField.text = [profileData objectForKey:pEmail];
            cell.editTextField.keyboardType = UIKeyboardTypeEmailAddress;
            
            cell.editTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
             cell.editTextField.returnKeyType = UIReturnKeyNext;
            break;
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
            
            [cell.editTextField setInputAccessoryView:toolbar];

            cell.textFieldTitle.text = @"Phone No:";
            cell.editTextField.text =[profileData objectForKey:pPhoneNumber];
            cell.editTextField.keyboardType = UIKeyboardTypeNumberPad;
            cell.editTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        }
            break;
        default:
            break;
    }
    return cell;

}
//-(void)dismissKeyboard
//{
//    [self.view endEditing:YES];
//}
- (IBAction)onGenderBtnAction:(UIButton*)sender {
    
    UIButton *maleBtn = (UIButton *)[self.view viewWithTag:210];
        UIButton *femaleBtn = (UIButton *)[self.view viewWithTag:211];
    sender.selected = !sender.selected;
        if(sender.tag == 210)
        {
            maleBtn.selected = YES;
            femaleBtn.selected = NO;
           // mObj.userGender = @"Male";
            
        }
        else
        {
            maleBtn.selected = NO;
            femaleBtn.selected = YES;
            //mObj.userGender = @"Female";
        }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    
    [self.profileImageView setImage:image];
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

//Action sheet cases to select from gallary or camera
- (void)setprofilePicture
{
    [AlertController actionSheet:@"" message:@"Please select image source" andButtonsWithTitle:@[@"Take Photo",@"Choose Photo"] onViewController:self dismissedWith:^(NSInteger index, NSString *buttonTitle)
     {
         //NSLog(@"hiiiouiouiouiouo");
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
                 [AlertController message:@"Camera is not available" onViewController:self];
             }
         }
         else if (index == 1)
         {
             [self presentViewController:profileImagePicker animated:YES completion:NULL];
         }
     }];
}

@end
