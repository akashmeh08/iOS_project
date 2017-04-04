//
//  GraphVC.m
//  BaseProject
//
//  Created by Sunil Verma on 17/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "GraphVC.h"
#import "OPGraphView.h"
#import "OPThemeManager.h"


typedef NS_ENUM(NSUInteger, OPGRAPH_TYPE) {
    OPGRAPH_TYPE_LINE =0,
    OPGRAPH_TYPE_BAR,
    OPGRAPH_TYPE_PIE,
};


@interface GraphVC ()
{
    OPThemeManager *themeManager;

}
@property (nonatomic, weak) IBOutlet OPGraphView *graphView;
@end

@implementation GraphVC

- (void)viewDidLoad {
    [super viewDidLoad];
    themeManager = [OPThemeManager sharedManager];
    
    [self lineChartBtnAction:nil];
    
}

-(IBAction)lineChartBtnAction:(id)sender
{
    [self platGraphOFType:OPGRAPH_TYPE_LINE];
}

-(IBAction)barchChartBtn:(id)sender
{
    [self platGraphOFType:OPGRAPH_TYPE_BAR];

}

-(IBAction)pieChartBtn:(id)sender
{
    [self platGraphOFType:OPGRAPH_TYPE_PIE];

}

-(void)platGraphOFType:(OPGRAPH_TYPE)selectedGraphType
{
    
    
    self.graphView.themeAttributes = [self themeAttributes];
    
    self.graphView.yAxisRange = [NSNumber numberWithInteger:100];; // I can be dynamic max range
    
    self.graphView.yAxisSuffix = @""; //@"K";
    
    
    self.graphView.xAxisValues = [self xAxisValues];
    
    
    
    NSMutableArray *plotArray= [NSMutableArray array];
    
        [plotArray addObject:[self getPlot1]];
        
    
    
        [plotArray addObject:[self getPlot2]];
    
    
    
    switch (selectedGraphType) {
        case OPGRAPH_TYPE_LINE:
        {
            [self.graphView plotGraphWithData:plotArray];
            
            
        }
            break;
        case OPGRAPH_TYPE_PIE:
        {
            [self.graphView plotPieChartWithData:plotArray];
            
        }
            break;
            
        case OPGRAPH_TYPE_BAR:
        {
            [self.graphView plotBarGraphWithData:plotArray];
            
        }
            break;
            
        default:
            break;
    }
    
}



#pragma mark Graph methods

-(NSDictionary *)themeAttributes
{
    NSDictionary *attributes = @{
                                 kXAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                 kXAxisLabelFontKey : [UIFont systemFontOfSize:8],
                                 kYAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                 kYAxisLabelFontKey : [UIFont systemFontOfSize:8.0],
                                 kYAxisLabelSideMarginsKey : @20,
                                 kPlotBackgroundLineColorKey :[[UIColor lightGrayColor] colorWithAlphaComponent:0.1] ,
                                 kDotSizeKey : @5
                                 };
    return attributes;
}

-(NSArray *)xAxisValues
{
    
    NSMutableArray *xValue = [NSMutableArray array];
    
    
    
    
    for (int index =0; index < 8; index++) {
        
        NSMutableDictionary *objDict = [NSMutableDictionary dictionary];
        
        
       
            
            [objDict setObject:[NSNumber numberWithInt:index+1] forKey:[NSString stringWithFormat:@"%d",index+1]];
        
        if (index == 5) {
            [objDict setObject:[NSNumber numberWithBool:YES] forKey:kPlotPointHightlightedKey]; // Highlighted option

        }else
        {
            [objDict setObject:[NSNumber numberWithBool:NO] forKey:kPlotPointHightlightedKey];

        }
        
        
        
        [xValue addObject:objDict];
        
    }
    
    
    
    
    return xValue;
    
    
}

-(OPPlot *)getPlot1
{
    OPPlot *_plot1 = [[OPPlot alloc] init];
    
    
    
    
    NSMutableArray *valueArray = [NSMutableArray array];
    
    NSMutableArray *yDisplayValueArray = [NSMutableArray array];
    
    NSArray *values = @[@"23", @"24",@"45", @"60", @"90",@"70",@"40",@"20"];  // This needed to pass dynamic
    
    //  NSInteger totalVoteCount = 0;
    for (int index =0; index < values.count; index++) {
        
        
        NSMutableDictionary *objDict = [NSMutableDictionary dictionary];
        
      
        [objDict setObject:[values objectAtIndex:index] forKey:[NSString stringWithFormat:@"%d",index+1]];
        [valueArray addObject:objDict];
        
        
        // yaxis display value
        
        //  totalVoteCount = totalVoteCount+ [option.voteCount integerValue];
        [yDisplayValueArray addObject:[NSString stringWithFormat:@"%d",index+1]];
    }
    
    
    
    
    _plot1.plottingValues =valueArray;
    
    _plot1.plottingPointsLabels = yDisplayValueArray;
    
    _plot1.totalValue = 100.0;
    
    
    
    
    NSDictionary *_plotThemeAttributes = @{
                                           kPlotFillColorKey : [themeManager.textContentSelectedColor colorWithAlphaComponent:0.2],
                                           kPlotStrokeWidthKey : @1,
                                           kPlotStrokeColorKey : [themeManager.textContentSelectedColor colorWithAlphaComponent:1.0],
                                           kPlotPointFillColorKey : [themeManager.textContentSelectedColor colorWithAlphaComponent:1.0],
                                           kPlotPointValueFontKey : [UIFont systemFontOfSize:14.0]
                                           };
    
    _plot1.plotThemeAttributes = _plotThemeAttributes;
    
    return _plot1;
    
    
}

-(OPPlot *)getPlot2
{
    OPPlot *_plot2 = [[OPPlot alloc] init];
    
    _plot2.plottedIndex = 1;
    
    NSMutableArray *valueArray = [NSMutableArray array];
    
    NSMutableArray *yDisplayValueArray = [NSMutableArray array];

    NSArray *values = @[@"10", @"15",@"55", @"55", @"70",@"50",@"20",@"5"];  // This needed to pass dynamic
    
    //  NSInteger totalVoteCount = 0;
    for (int index =0; index < values.count; index++) {
        
        
        NSMutableDictionary *objDict = [NSMutableDictionary dictionary];
        
        
        [objDict setObject:[values objectAtIndex:index] forKey:[NSString stringWithFormat:@"%d",index+1]];
        [valueArray addObject:objDict];
        
        
        // yaxis display value
        
        //  totalVoteCount = totalVoteCount+ [option.voteCount integerValue];
        [yDisplayValueArray addObject:[NSString stringWithFormat:@"%d",index+1]];
    }
    
    _plot2.plottingValues =valueArray;
    
    _plot2.plottingPointsLabels = yDisplayValueArray;
    _plot2.totalValue = 100.0;
    
    
    
    NSDictionary *_plotThemeAttributes2 = @{
                                            kPlotFillColorKey : [themeManager.blueContentColor colorWithAlphaComponent:0.4],
                                            kPlotStrokeWidthKey : @1,
                                            kPlotStrokeColorKey : themeManager.blueContentColor,
                                            kPlotPointFillColorKey : themeManager.blueContentColor,
                                            kPlotPointValueFontKey : [UIFont systemFontOfSize:14.0]
                                            };
    
    
    
    
    _plot2.plotThemeAttributes = _plotThemeAttributes2;
    
    return _plot2;
    
    
    
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

@end
