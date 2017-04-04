//
//  ViewVolunteerViewController.m
//  test2
//
//  Created by Sarvada Chauhan on 17/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import "ViewVolunteerViewController.h"
#import "ViewVolunteerTableViewCell.h"
@interface ViewVolunteerViewController ()<UITextFieldDelegate,UITableViewDataSource>
{
    BOOL checked ;
}
@end

@implementation ViewVolunteerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    checked=YES;
    // Do any additional setup after loading the view.
   
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark UITableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ViewVolunteerTableViewCell *cell = (ViewVolunteerTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"maincell"];
     cell.contentView.tag=indexPath.row+8;
    ViewVolunteerTableViewCell *cell1 = (ViewVolunteerTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"maincell2"];
    cell1.addButton.tag= indexPath.row;

    [cell1.addButton addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
//       [cell1.addButton addTarget:self action:@selector(alertMessage) forControlEvents:UIControlEventTouchUpInside];
  
     cell1.secondContentView.tag=indexPath.row+8;
   
if(indexPath.row%2==0)
{
   cell.firstCellView.layer.borderWidth=1;
    cell.firstCellView.layer.cornerRadius=5;
    cell.layer.borderColor=[[UIColor colorWithRed:170.0f/255.0f green:170.0f/255.0f blue:170.0f/255.0f alpha:1.0] CGColor];
    return cell;
}
else
{
     cell1.secondViewCell.layer.borderWidth=1;
     cell1.secondViewCell.layer.cornerRadius=5;
    cell1.layer.borderColor=[[UIColor colorWithRed:170.0f/255.0f green:170.0f/255.0f blue:170.0f/255.0f alpha:1.0] CGColor];
    return cell1;
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
//-(void)addChat;{
//if(!checked)
//{
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Simulator does not support Message Composer!! " preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
//    [alert addAction:ok];
//    checked=FALSE;
//}
//
//else
//{
//}

    - (IBAction)chatBtn:(id)sender {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Simulator does not support Message Composer!! " preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        
    }

- (IBAction)addBtn:(id)sender {

    UIButton *senderButton = (UIButton *)sender;
    [senderButton setImage:[UIImage imageNamed:@"chat"] forState:UIControlStateNormal];
}
//-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    
//    
//    // Is this my Alert View?
//    if (alertView.tag == 100) {
//        //Yes
//        
//        
//        // You need to compare 'buttonIndex' & 0 to other value(1,2,3) if u have more buttons.
//        // Then u can check which button was pressed.
//        if (buttonIndex == 0) {// 1st Other Button
//            
//            [self submitData];
//            
//        }
//        else if (buttonIndex == 1) {// 2nd Other Button
//            
//            
//        }
//        
//    }
//    else {
//        //No
//        // Other Alert View
//        
//    }
//    
//}
-(void) UIButton :(UIButton *)UIButton
  @end

