//
//  EandCViewController.m
//  EandC
//
//  Created by Mobiloitte on 18/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "EandCViewController.h"
//#import "CustomCell.h"
#import "SWRevealViewController.h"


@interface EandCViewController ()<UITableViewDataSource,
UITableViewDelegate>
{
    NSArray *cell0SubMenuItemsArray;
    //NSArray *cell1SubMenuItemsArray;
    BOOL isSection0Cell0Expanded;
   // BOOL isSection1Cell1Expanded;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;


@end

@implementation EandCViewController
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    cell0SubMenuItemsArray = @[@"Uttarakhand", @"Delhi", @"Uttar Pradesh", @"AP"];
    SWRevealViewController *revealViewController = self.revealViewController;
   // cell1SubMenuItemsArray= @[@"Uttarakhand", @"Delhi", @"Uttar Pradesh", @"AP"];
    
    if ( revealViewController )
    {
        [self.menuButton setTarget:self.revealViewController];
        [self.menuButton setAction: @selector( revealToggle: )];
        // [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
   
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.view setNeedsLayout];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
# pragma mark - UITableView Delegate and Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)//&&(section ==1))
    {
        int cellCount = 2; // Default count - if not a single cell is expanded
        
        if (isSection0Cell0Expanded)//&&(isSection1Cell1Expanded))
        {
            cellCount += [cell0SubMenuItemsArray count];
            //cellCount += [cell1SubMenuItemsArray count];

        }
        
        return cellCount;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellId = @"CellId";
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strCellId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if (indexPath.section == 0)//||(indexPath.section==1))
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"Country";
            cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
            
            UIImageView *accessoryImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
            
            if (isSection0Cell0Expanded) // Set accessory view according to cell state - EXPANDED / NOT EXPANDED
            {
                accessoryImageView.image = [UIImage imageNamed:@"images-4.png"];
                cell.detailTextLabel.text = @"";
            }
            else
            {
                accessoryImageView.image = [UIImage imageNamed:@"images-5.png"];
                cell.detailTextLabel.text = @"";
            }
            
            cell.accessoryView = accessoryImageView;
        }
        else
        {
            if (isSection0Cell0Expanded && [cell0SubMenuItemsArray count] >= indexPath.row) // Check Expanded status and do the necessary changes
            {
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [cell0SubMenuItemsArray objectAtIndex:indexPath.row - 1]];
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.backgroundColor = [UIColor whiteColor];
            }
            else
            {
                cell.textLabel.text = @"Union Territories";
                cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
             

            }
        }}return cell;}
        /*if (indexPath.row == 1)
        {
            cell.textLabel.text = @"Union Territories";
            cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
            
            UIImageView *accessoryImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
            
            if (isSection1Cell1Expanded) // Set accessory view according to cell state - EXPANDED / NOT EXPANDED
            {
                accessoryImageView.image = [UIImage imageNamed:@"images-4.png"];
                cell.detailTextLabel.text = @"";
            }
            else
            {
                accessoryImageView.image = [UIImage imageNamed:@"images-5.png"];
                cell.detailTextLabel.text = @"";
            }
            
            cell.accessoryView = accessoryImageView;
        }
        else
        {
            if (isSection0Cell0Expanded && [cell0SubMenuItemsArray count] >= indexPath.row) // Check Expanded status and do the necessary changes
            {
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [cell0SubMenuItemsArray objectAtIndex:indexPath.row - 1]];
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.backgroundColor = [UIColor whiteColor];
            }
            else
            {
                cell.textLabel.text = @"Union Territories";
                cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
                
                
            }
        }

    }*/
    
   // return cell;


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        // Change status of a cell reload table
        
        isSection0Cell0Expanded = !isSection0Cell0Expanded;
        
        if (isSection0Cell0Expanded)
        {
            NSArray *cells = [NSArray arrayWithObjects:
                              [NSIndexPath indexPathForRow:1 inSection:0],
                              [NSIndexPath indexPathForRow:2 inSection:0],
                              [NSIndexPath indexPathForRow:3 inSection:0],
                              [NSIndexPath indexPathForRow:4 inSection:0],
                              nil];
            
            [CATransaction begin];
            
            [CATransaction setCompletionBlock:^{
                [tableView reloadData];
            }];
            
            [tableView beginUpdates];
            [tableView insertRowsAtIndexPaths:cells withRowAnimation:UITableViewRowAnimationFade];
            [tableView endUpdates];
            
            [CATransaction commit];
            
        }
        else
        {
            NSArray *cells = [NSArray arrayWithObjects:
                              [NSIndexPath indexPathForRow:1 inSection:0],
                              [NSIndexPath indexPathForRow:2 inSection:0],
                              [NSIndexPath indexPathForRow:3 inSection:0],
                              [NSIndexPath indexPathForRow:4 inSection:0],
                              nil];
            
            [CATransaction begin];
            
            [CATransaction setCompletionBlock:^{
                [tableView reloadData];
            }];
            
            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:cells withRowAnimation:UITableViewRowAnimationFade];
            [tableView endUpdates];
            
            [CATransaction commit];
        }}
     /*   if (indexPath.row == 0)
        {
            // Change status of a cell reload table
            
            isSection0Cell1Expanded = !isSection0Cell1Expanded;
            
            if (isSection1Cell1Expanded)
       //     {
                NSArray *cells = [NSArray arrayWithObjects:
                                  [NSIndexPath indexPathForRow:1 inSection:0],
                                  [NSIndexPath indexPathForRow:2 inSection:0],
                                  [NSIndexPath indexPathForRow:3 inSection:0],
                                  [NSIndexPath indexPathForRow:4 inSection:0],
                                  nil];
                
                [CATransaction begin];
                
                [CATransaction setCompletionBlock:^{
                    [tableView reloadData];
                }];
                
                [tableView beginUpdates];
                [tableView insertRowsAtIndexPaths:cells withRowAnimation:UITableViewRowAnimationFade];
                [tableView endUpdates];
                
                [CATransaction commit];
                
            }
            else
            {
                NSArray *cells = [NSArray arrayWithObjects:
                                  [NSIndexPath indexPathForRow:1 inSection:0],
                                  [NSIndexPath indexPathForRow:2 inSection:0],
                                  [NSIndexPath indexPathForRow:3 inSection:0],
                                  [NSIndexPath indexPathForRow:4 inSection:0],
                                  nil];
                
                [CATransaction begin];
                
                [CATransaction setCompletionBlock:^{
                    [tableView reloadData];
                }];
                
                [tableView beginUpdates];
                [tableView deleteRowsAtIndexPaths:cells withRowAnimation:UITableViewRowAnimationFade];
                [tableView endUpdates];
                
                [CATransaction commit];
            }

    }*/
}

@end
