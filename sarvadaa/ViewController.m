//
//  ViewController.m
//  sarvadaa
//
//  Created by Mobiloitte on 20/02/17.
//  Copyright © 2017 mobiloittefirst1app. All rights reserved.
//

#import "ViewController.h"
#import<Foundation/Foundation.h>

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textFieldTf1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UIButton *DobDb;
@property (weak, nonatomic) IBOutlet UITextView *textView4;
@property (weak, nonatomic) IBOutlet UIButton *signUp;
@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UILabel *phoneNo;
@property (weak, nonatomic) IBOutlet UILabel *BirthDay;
@property (weak, nonatomic) IBOutlet UILabel *addRess;

@end

@implementation ViewController

#pragma mark-View Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
#pragma mark-Text Field Delegates
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"Begin Editing");
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange) range replacementString: (NSString *) string{
    NSLog(@"Change Characters=%@",string);
    if(textField == _textFieldTf1)
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        if(_textFieldTf1.text.length >= 25 && range.length==0)
        {
            return NO;
        }
        if([string isEqualToString:filtered] || [string isEqualToString:@" "])
            return YES;
    }
    if(textField == _textField2)
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        if(_textField2.text.length >= 25 && range.length==0)
        {
            return NO;
        }
        if([string isEqualToString:filtered] || [string isEqualToString:@" "])
            return YES;
    }

    if(textField == _textField3)
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"+-0123456789"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        if(_textField3.text.length >= 20 && range.length==0)
        {
            return NO;
        }
        if([string isEqualToString:filtered] || [string isEqualToString:@" "])
            return YES;
    }

    else
        return NO;
    return NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"End editing");
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.returnKeyType==UIReturnKeyNext) {
        UITextField *tf=(UITextField *)[self.view viewWithTag:textField.tag+1];
        [tf becomeFirstResponder];
    }else
    {
        [self.view endEditing:YES];
    }
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma mark-Memory Warning Methods
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
