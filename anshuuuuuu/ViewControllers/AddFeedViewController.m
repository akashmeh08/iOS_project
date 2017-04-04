//
//  AddFeedViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "AddFeedViewController.h"
#import "LikeViewController.h"
#import "OptionsPickerSheetView.h"
#import "Header.h"
@interface AddFeedViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *feedImageView;
@property (strong, nonatomic) IBOutlet UITextView *descritptionTextView;
- (IBAction)publicRadioBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *privateradioBtn;
@property (strong, nonatomic) IBOutlet UIButton *publicRadioBtn;

@end

@implementation AddFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _feedImageView.userInteractionEnabled = YES;
    _feedImageView.clipsToBounds = YES;

    //self.navigationItem.backBarButtonItem.tit
    _feedImageView.contentMode = UIViewContentModeCenter;
    

    
    _publicRadioBtn.selected = YES;
    [self.navigationController setNavigationBarHidden:NO];
    UITapGestureRecognizer *selectProfileTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setprofilePicture)];
    selectProfileTapGesture.numberOfTapsRequired = 1;
    [self.feedImageView addGestureRecognizer:selectProfileTapGesture];

    [self customInit];
    
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
- (IBAction)onSubmitBtn:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];

}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if([textView.text isEqualToString:@"Write here."])
    {
        textView.textColor = [UIColor blackColor];
        textView.text = @"";
    }
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@""])
    {   textView.text = @"Write here.";
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
        }
    }
    else
    {
        if(!sender.selected)
            _privateradioBtn.selected = YES;
        if(sender.selected)
            _publicRadioBtn.selected = NO;
            
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LikeViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"LikeViewController"];
        
        [self.navigationController pushViewController:controller animated:YES ];
        
    }
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
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

@end
