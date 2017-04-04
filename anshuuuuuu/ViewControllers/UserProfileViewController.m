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
}
@synthesize title = _title;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _profileImageView.layer.borderWidth = 1;
    _profileImageView.layer.cornerRadius = 40;
    self.profileImageView.clipsToBounds = YES;
    self.navigationItem.backBarButtonItem.title = @"Back";
    self.navigationItem.title = _title;
    _femaleBtn.selected = YES;
    
    _profileImageView.clipsToBounds = YES;

    
    _profileImageView.userInteractionEnabled = NO;
    
    [self.navigationController setNavigationBarHidden:NO];
    UITapGestureRecognizer *selectProfileTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setprofilePicture)];
    selectProfileTapGesture.numberOfTapsRequired = 1;
    [self.profileImageView addGestureRecognizer:selectProfileTapGesture];


    flag = NO;
    
  
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
- (IBAction)onEditClick:(UIButton*)sender {
    
    if([_title isEqualToString:@"Anshu Aggarwal"])
    {
        sender.selected = !sender.selected;
        flag = !flag;
        _profileImageView.userInteractionEnabled = !_profileImageView.userInteractionEnabled;
        NSLog(@"%d",flag);
        [self.userprofileTableView reloadData];
    }
    
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
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField.tag == 303)
    {
        if(textField.text.length <= 9)
        {
            return YES;
        }
        else if ([string isEqualToString:@""])
        {
            return YES;
        }
        else
        {
            return NO;
        }
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
    cell.editTextField.layer.sublayerTransform=CATransform3DMakeTranslation(6.0f, 1.0f, 1.0f);
    
    if(!flag )
    {
        cell.editTextField.userInteractionEnabled = NO;
        cell.editTextField.layer.borderWidth = 0.0;
        cell.editTextField.layer.borderColor = [UIColor whiteColor].CGColor;
        _maleBtn.userInteractionEnabled = NO;
        _femaleBtn.userInteractionEnabled = NO;
    }
    else{
        cell.editTextField.userInteractionEnabled = YES;
        cell.editTextField.layer.borderWidth = 1;
        cell.editTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        cell.editTextField.layer.borderColor = [UIColor colorWithRed:(218/255.0) green:(218/255.0) blue:(218/255.0) alpha:1.0].CGColor;
        _maleBtn.userInteractionEnabled = YES;
        _femaleBtn.userInteractionEnabled = YES;


    }
    
    switch (indexPath.row)
    {
        case 0:
            cell.textFieldTitle.text = @"First Name :";
            cell.editTextField.text = @"Anshu";
            cell.editTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
            cell.editTextField.returnKeyType = UIReturnKeyNext;
            
            break;
        case 1:
            cell.textFieldTitle.text = @"Last Name :";
            cell.editTextField.text = @"Aggarwal";
            cell.editTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
             cell.editTextField.returnKeyType = UIReturnKeyNext;
            break;
        case 2:
            cell.textFieldTitle.text = @"Email         :";
            cell.editTextField.keyboardType = UIKeyboardTypeEmailAddress;
            cell.editTextField.text = @"anshu@gmail.com";
           cell.editTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
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

            cell.textFieldTitle.text = @"Phone No  :";
            cell.editTextField.text = @"9999999999";
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
    
    sender.selected = ! sender.selected;
        if(sender.tag == 210)
        {
            _maleBtn.selected = NO;
            _femaleBtn.selected = YES;
          
           // mObj.userGender = @"Male";
            
        }
        else
        {
            _maleBtn.selected = YES;
            _femaleBtn.selected = NO;
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
    [AlertController actionSheet:@"" message:@"Please select image source" andButtonsWithTitle:@[@"Take Photo",@"Choose Photo",@"Choose from facebook"] onViewController:self dismissedWith:^(NSInteger index, NSString *buttonTitle)
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
