//
//  SendAccessCodeViewController.m
//  BaseProject
//
//  Created by Mobiloitte on 25/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "SendAccessCodeViewController.h"
#import "LoginViewController.h"

@interface SendAccessCodeViewController ()
{
    //UILabel *progress;
    NSTimer *timer;
    int currMinute;
    int currSeconds;
}


- (IBAction)submitButton:(id)sender;
- (IBAction)resendButton:(id)sender;
    
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@end
int totalSeconds;
@implementation SendAccessCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // progress=[[UILabel alloc] initWithFrame:CGRectMake(80, 15, 100, 50)];
    //progress.textColor=[UIColor redColor];
    [_timerLabel setText:@"Time : 3:00"];
    //progress.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_timerLabel];
    currMinute=3;
    currSeconds=00;
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"Forgot Password";
    self.navigationController.navigationBar.topItem.title = @"Back";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
  
}
-(void)start
{
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
}
-(void)timerFired
{
    if((currMinute>0 || currSeconds>=0) && currMinute>=0)
    {
        if(currSeconds==0)
        {
            currMinute-=1;
            currSeconds=59;
        }
        else if(currSeconds>0)
        {
            currSeconds-=1;
        }
        if(currMinute>-1)
            [_timerLabel setText:[NSString stringWithFormat:@"%@%d%@%02d",@"Time : ",currMinute,@":",currSeconds]];
    }
    else
    {
        [timer invalidate];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitButton:(id)sender
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:controller animated:YES ];
}

- (IBAction)resendButton:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"Code resend on your device." preferredStyle:UIAlertControllerStyleAlert ];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
