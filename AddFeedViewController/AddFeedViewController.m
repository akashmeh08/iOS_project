//
//  AddFeedViewController.m
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "UserListViewController.h"
#import "AddFeedViewController.h"
#import "Macro.h"

@interface AddFeedViewController ()<UIImagePickerControllerDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *addFeedImage;
@property (weak, nonatomic) IBOutlet UIView *privateListView;
@property (weak, nonatomic) IBOutlet UIButton *publicRadioBtn;
@property (weak, nonatomic) IBOutlet UIButton *privateRadioBtn;

@end

@implementation AddFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _privateListView.hidden = YES;
    [[self navigationController] setNavigationBarHidden:NO];
    self.navigationItem.title = @"Add Feed";
    UITapGestureRecognizer *selectProfileTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setProfilePicture)];
    selectProfileTapGesture.numberOfTapsRequired = 1;
    [self.addFeedImage addGestureRecognizer:selectProfileTapGesture];
    [self customInit];
    
    // Do any additional setup after loading the view.
}

-(void)customInit {
    [self.addFeedImage setUserInteractionEnabled:YES];
    
    _addFeedImage.layer.borderWidth = 1;
    //   _addFeedImage.layer.cornerRadius = 37;
      self.addFeedImage.clipsToBounds = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];  //to dismiss keyboard
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _privateListView.hidden = NO;
    _publicRadioBtn.selected = NO;
    //   [[self navigationController]setNavigationBarHidden:YES];
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

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if([textView.text isEqualToString:@"Write here."])
    {
        textView.textColor = [UIColor blackColor];
        textView.text = @"";
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}


- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@""])
    {   textView.text = @"Write here.";
        textView.textColor = [UIColor colorWithRed:(218/255.0) green:(218/255.0) blue:(218/255.0) alpha:1.0];
    }
    return true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UIImagePicker Delegate method

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    
    [self.addFeedImage setImage:image];
    
    
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
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }

- (IBAction)onPrivateClick:(UIButton *)sender {
    
    _privateRadioBtn.selected = !_privateRadioBtn.selected;
    if(_privateRadioBtn.selected) {
        _publicRadioBtn.selected = !_publicRadioBtn;
    }
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserListViewController
    * controller = [storyboard instantiateViewControllerWithIdentifier:@"maincell"];
    [self.navigationController pushViewController:controller animated:YES ];
}
- (IBAction)onPublicClick:(UIButton*)sender {
    _privateRadioBtn.selected = NO;
    _publicRadioBtn.selected = YES;

}
- (IBAction)onPrivateBtnClick:(UIButton*)sender {
    _privateRadioBtn.selected = YES;
    _publicRadioBtn.selected = NO;
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserListViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"maincell"];
    [self.navigationController pushViewController:controller animated:YES ];
    }
- (IBAction)onSaveClick:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"home"];
    [self.navigationController pushViewController:controller animated:YES ];
    
}
@end
