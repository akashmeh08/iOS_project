//
//  SHGraphView.h
//  SHLineGraphView
//
//  Created by Sunil Verma on 14/03/16.
//  Copyright © 2016 Mobiloitte Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OPPlot.h"
#import "OPLineGraphView.h"
@interface OPGraphView : UIView



@property (nonatomic, strong) NSArray *xAxisValues;

/**
 *  the maximum y-value possible in the graph. make sure that the y-value is not in the plotting points is not greater
 *  then this number. otherwise the graph plotting will show wrong results.
 */
@property (nonatomic, strong) NSNumber *yAxisRange;

/**
 *  y-axis values are calculated according to the yAxisRange passed. so you do not have to pass the explicit labels for
 *  y-axis, but if you want to put any suffix to the calculated y-values, you can mention it here (e.g. K, M, Kg ...)
 */
@property (nonatomic, strong) NSString *yAxisSuffix;

/**
 *  readyonly dictionary that stores all the plots in the graph.
 */
@property (nonatomic, readonly, strong) NSMutableArray *plots;

/**
 *  theme attributes dictionary. you can specify graph theme releated attributes in this dictionary. if this property is
 *  nil, then a default theme setting is applied to the graph.
 */
@property (nonatomic, strong) NSDictionary *themeAttributes;



-(void)plotGraphWithData :(NSMutableArray *)plotsArray;

-(void)plotBarGraphWithData :(NSMutableArray *)plotsArray;

-(void)plotPieChartWithData:(NSMutableArray *)plotsArray;
@end
