//
//  SignupVC.m
//  BaseProject
//

#import "SignupVC.h"

@interface SignupVC ()

@end

@implementation SignupVC

#pragma mark- Life Cycle of View Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - IBAction Method

-(IBAction)createButtonAction:(id)sender{
    
    [AlertController title:@"" message:@"Account has been created successfully." andButtonsWithTitle:@[@"Ok"] onViewController:self dismissedWith:^(NSInteger index, NSString *buttonTitle) {
    }];
    
    [[UserInfo sharedManager] setFullName:@"Guest User"];

    [APPDELEGATE navigateToHome];
}

#pragma mark - Did Receive Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
