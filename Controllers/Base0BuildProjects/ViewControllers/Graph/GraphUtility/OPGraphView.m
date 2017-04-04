//
//  SHGraphView.m
//  SHLineGraphView
//
//  Created by Sunil Verma on 14/03/16.
//  Copyright © 2016 Mobiloitte Inc. All rights reserved.
//

#import "OPGraphView.h"
#import "OPLineGraphView.h"
#import "OPBarGraphView.h"
#import "OPPieChartView.h"

@interface OPGraphView()

@property (nonatomic, strong) NSArray *plotsArray;

@end

@implementation OPGraphView


-(void)awakeFromNib
{
    [super awakeFromNib];
}

-(void)plotGraphWithData :(NSMutableArray *)plotsArray
{
    self.plotsArray = [NSArray arrayWithArray:plotsArray];
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    [self performSelector:@selector(plotLineGraph) withObject:nil afterDelay:0.01];
    
   // [self performSelectorOnMainThread:@selector(plotLineGraph) withObject:nil waitUntilDone:YES];

}

-(void)plotBarGraphWithData :(NSMutableArray *)plotsArray
{
    self.plotsArray = [NSArray arrayWithArray:plotsArray];
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    [self performSelector:@selector(plotBarGraph) withObject:nil afterDelay:0.01];

}

-(void)plotPieChartWithData:(NSMutableArray *)plotsArray
{
    self.plotsArray = [NSArray arrayWithArray:plotsArray];
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    [self performSelector:@selector(plotPieChat) withObject:nil afterDelay:0.01];
}


-(void)plotLineGraph
{
    OPLineGraphView *lineGraph = [[OPLineGraphView alloc] initWithFrame:CGRectMake(0, 0,  self.frame.size.width, self.frame.size.height)];

    lineGraph.yAxisRange = self.yAxisRange;
    lineGraph.yAxisSuffix = self.yAxisSuffix;
    lineGraph.xAxisValues = self.xAxisValues;
    lineGraph.themeAttributes = self.themeAttributes;
    
    for (int index = 0; index < self.plotsArray.count; index++) {
        [lineGraph addPlot:[self.plotsArray objectAtIndex:index]];
    }
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [scrollView addSubview:lineGraph];
    
    [scrollView setContentSize:CGSizeMake( self.frame.size.width , 100)];
    
    [self addSubview:scrollView];
    [lineGraph setupTheView];
}


-(void)plotBarGraph
{
        OPBarGraphView* barGraph = [[OPBarGraphView alloc] initWithFrame:CGRectMake(0, 0,  self.frame.size.width, self.frame.size.height)];
    
    barGraph.yAxisRange = self.yAxisRange;
    barGraph.yAxisSuffix = self.yAxisSuffix;
    barGraph.xAxisValues = self.xAxisValues;
    barGraph.themeAttributes = self.themeAttributes;
    
    for (int index = 0; index < self.plotsArray.count; index++) {
        [barGraph addPlot:[self.plotsArray objectAtIndex:index]];
    }
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [scrollView addSubview:barGraph];
    
    [scrollView setContentSize:CGSizeMake( self.frame.size.width , 100)];
    [self addSubview:scrollView];
    [barGraph setupTheView];
}

-(void)plotPieChat
{
    
    OPPieChartView* pieChart = [[OPPieChartView alloc] initWithFrame:CGRectMake(0, 0,  self.frame.size.width, self.frame.size.height)];
    
    pieChart.yAxisRange = self.yAxisRange;
    pieChart.yAxisSuffix = self.yAxisSuffix;
    pieChart.xAxisValues = self.xAxisValues;
    pieChart.themeAttributes = self.themeAttributes;
    
    for (int index = 0; index < self.plotsArray.count; index++) {
        [pieChart addPlot:[self.plotsArray objectAtIndex:index]];
    }
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [scrollView addSubview:pieChart];
    
    [scrollView setContentSize:CGSizeMake( self.frame.size.width , 100)];
    [self addSubview:scrollView];
    [pieChart setupTheView];

    
}

@end
