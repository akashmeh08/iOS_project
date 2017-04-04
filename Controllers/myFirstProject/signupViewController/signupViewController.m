//
//  signupViewController.m
//  myFirstProject
//
//  Created by Sarvada Chauhan on 09/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import "signupViewController.h"
#import "NSObject+NSString.h"
@interface signupViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewContainer;
@property (weak, nonatomic) IBOutlet UIView *datePickerView;
- (IBAction)dobButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)doneButton:(id)sender;

- (IBAction)cancelButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *dateOfBirthButton;

@end

@implementation signupViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.viewContainer.layer.borderColor=[UIColor colorWithRed:(218/255.0) green:(218/255.0) blue:(218/255.0) alpha:1.0].CGColor;
    //[self.navigationController.navigationBar setFrame:CGRectMake(0, 0, self.view.frame.size.width,200.0)];
    [[self navigationController]setNavigationBarHidden:NO];
    _datePickerView.hidden=YES;
}
/*- (void)viewWillDisAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}
/*- (void)setPickerHidden:(BOOL)hidden
{
    CGAffineTransform transform = hidden ? CGAffineTransformIdentity : CGAffineTransformMakeTranslation(0, -CGRectGetHeight(self.pickerView.frame));
    
    [UIView animateWithDuration:0.3 animations:^{
        self.pickerView.transform = transform;
    }];
}*/
- (IBAction)dobButton:(id)sender {
    self.datePicker.datePickerMode=UIDatePickerModeDate;
    [self.datePicker setHidden:NO];
    [self.datePickerView setHidden:NO];
    self.datePicker.maximumDate=self.datePicker.date;
}
- (IBAction)doneButton:(id)sender {
    
   //self.dateOfBirthButton.titleLabel.text =[NSString stringWithFormat:@"%@",self.datePicker.date];
    [self.datePickerView setHidden:YES];
    [self.dateOfBirthButton setTitle:[NSString stringWithFormat:@"%@",self.datePicker.date] forState:UIControlStateNormal];
}

- (IBAction)cancelButton:(id)sender {
    [self.datePickerView setHidden:YES];
}
@end
