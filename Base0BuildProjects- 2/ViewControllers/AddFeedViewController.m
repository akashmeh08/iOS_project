//
//  AddFeedViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//


#import "Header.h"

@interface AddFeedViewController ()
{
    NSString *userPrivacy;
}
@property (strong, nonatomic) IBOutlet UIImageView *feedImageView;
@property (strong, nonatomic) IBOutlet UITextView *descritptionTextView;
- (IBAction)publicRadioBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *privateradioBtn;
@property (strong, nonatomic) IBOutlet UIButton *publicRadioBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameListLable;

@end

@implementation AddFeedViewController
@synthesize delegate;
#pragma mark- View Life Cycle Method
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _feedImageView.userInteractionEnabled = YES;
      _feedImageView.clipsToBounds = YES;
    [self.navigationController setNavigationBarHidden:NO];
    _feedImageView.contentMode = UIViewContentModeCenter;

    UITapGestureRecognizer *selectProfileTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setprofilePicture)];
    selectProfileTapGesture.numberOfTapsRequired = 1;
    [self.feedImageView addGestureRecognizer:selectProfileTapGesture];
    _publicRadioBtn.selected = YES;
    [self.feedImageView addGestureRecognizer:selectProfileTapGesture];
    userPrivacy = @"public";
    [self customInit];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];  //to dismiss keyboard
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}
-(void)sendData:(NSMutableArray *)array
{
    
    _nameListLable.text = @" ";

    _nameListLable.hidden = NO;
    _privateradioBtn.selected = YES;
    _publicRadioBtn.selected = NO;
    userPrivacy = @"private";
    for(int a = 0; a < array.count; a++)
    {
        _nameListLable.text = [_nameListLable.text stringByAppendingString:[array objectAtIndex:a]];
        _nameListLable.text = [_nameListLable.text stringByAppendingString:@"\n"];
    }
    //NSLog(@"%d", array.count);
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    
    [self.feedImageView setImage:image];
    //_feedImageView.contentMode =
    _feedImageView.contentMode = UIViewContentModeScaleAspectFill;
    
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
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

-(void)addFeedApi {
    NSMutableDictionary * params = [[NSMutableDictionary alloc] init];
    NSString *imageBase64 = [self imageEncode];
    [params setValue:(self.descritptionTextView.text) forKey:pDescription];
    [params setValue:@" " forKey:pUserList];
    [params setValue:[NSUSERDEFAULT objectForKey:@_USER_ID_LOCAL]forKey:pUserId];
    [params setValue:@"public" forKey:pPrivacy];
    [params setValue:imageBase64 forKey:pUserImage];
    [params setValue:_DeviceType forKey:pDeviceType];
    [params setValue:@"" forKey:pDeviceToken];
    [[ServiceHelper helper] request:params apiName:kApiAddFeed  withToken:YES method:POST onViewController:self completionBlock:^(id result, NSError *error) {
        if([[result objectForKey:@_RESPONSE_CODE] integerValue] == _RESPONSE_SUCCESS_CODE)        {
            //[AlertController message:@_RESPONSE_MESSAGE onViewController:self];
            [self.delegate RefreshData];
            [self. navigationController popViewControllerAnimated:YES];
        }
        else{
            [AlertController message:@_RESPONSE_MESSAGE onViewController:self];
        }
    }];
}
-(NSString *)imageEncode {
    UIImage *profileImage = _feedImageView.image;
    NSData *imageData = UIImagePNGRepresentation(profileImage);
    NSString *base64 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onSubmitBtn:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
[self addFeedApi];
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if([textView.text isEqualToString:@"Write here..."])
    {
        textView.textColor = [UIColor blackColor];
        textView.text = @"";
    }
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@""])
    {   textView.text = @"Write here...";
        textView.textColor = [UIColor colorWithRed:(218/255.0) green:(218/255.0) blue:(218/255.0) alpha:1.0];
    }
    return true;
}
-(void)customInit
{
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"Add feed";
    _feedImageView.layer.borderWidth = 1;
   _feedImageView.layer.borderColor = [UIColor colorWithRed:(199/255.0) green:(199/255.0) blue:(199/255.0) alpha:1.0].CGColor;
    _descritptionTextView.layer.borderWidth = 1;
    _descritptionTextView.layer.borderColor = [UIColor colorWithRed:(199/255.0) green:(199/255.0) blue:(199/255.0) alpha:1.0].CGColor;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)textViewDidEndEditing:(UITextView*)textView

{
    [self animateTextField:textView up:NO];
    
}
-(void)animateTextField:(UITextView*) textView up:(BOOL)up
{
    
    
    int movementDistance = -60; // tweak as needed
    
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSLog(@"textViewShouldBeginEditing:");
    if(textView.frame.origin.y)
        [self animateTextField:textView up:YES];
    return YES;
}

- (IBAction)publicRadioBtn:(UIButton*)sender {
    
    sender.selected = !sender.selected;
    if(sender.tag == 100)
    {
        if(sender.selected)
        {
            _privateradioBtn.selected = NO;
            userPrivacy = @"public";
        }
    
    
        else if(!sender.selected)
        {
            userPrivacy = @"public";
    _publicRadioBtn.selected = YES;
    _nameListLable.text = @" ";
    _privateradioBtn.selected = NO;
        }
    }

else
{
    if(!sender.selected && ![_nameListLable.text isBlank])
        userPrivacy = @"private";
    _privateradioBtn.selected = YES;
    if(sender.selected && [_nameListLable.text isBlank])
        userPrivacy = @"public";
    _privateradioBtn.selected = NO;
    //            _publicRadioBtn.selected = YES;
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LikeViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"LikeViewController"];
    controller.delegate = self;
    [self.navigationController pushViewController:controller animated:YES ];
    
}

}



@end
