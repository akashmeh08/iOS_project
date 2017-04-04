//
//  LoginVC.m
//  BaseProject
//

#import "LoginVC.h"

@interface LoginVC () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField        * emailTextField;
@property (weak, nonatomic) IBOutlet UITextField        * passwordTextField;

@end

@implementation LoginVC

#pragma mark- Life Cycle of View Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - IBAction Method

-(IBAction)loginButtonAction:(id)sender{
    
    [[UserInfo sharedManager] setFullName:@"Guest User"];
    
    [APPDELEGATE navigateToHome];
//    HomeVC * homeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
//    [self.navigationController pushViewController:homeVC animated:true];
}

-(IBAction)signupButtonAction:(id)sender{
    
    SignupVC * signupVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SignupVC"];
    [self.navigationController pushViewController:signupVC animated:true];
}

#pragma mark - Web Service Method For Login

-(void)makeWebApiForLogin{
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] init];
    [params setValue:TRIM_SPACE(self.emailTextField.text) forKey:pEmail];
    [params setValue:self.passwordTextField.text forKey:pPassword];
    
//    [[ServiceHelper helper] request:params apiName:kApiLogin withToken:@"" method:POST onViewController:self completionBlock:^(id result, NSError *error) {
//        
////        HomeVC * homeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
////        [self.navigationController pushViewController:homeVC animated:true];
////    }];
}

#pragma mark - UITextField Delegate Method

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.emailTextField) 
        [self.passwordTextField becomeFirstResponder];
    else
        [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - Did Receive Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
