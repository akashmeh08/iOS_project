//
//  OPBarGraphView.h
//  Openia
//
//  Created by Sunil Verma on 31/05/16.
//  Copyright © 2016 Mobiloitte Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OPPlot;

@interface OPBarGraphView : UIView


/**
 *  an Array of dictionaries specifying the key/value pair where key is the object which will identify a particular
 *  x point on the x-axis line. and the value is the label which you want to show on x-axis against that point on x-axis.
 *  the keys are important here as when plotting the actual points on the graph, you will have to use the same key to
 *  specify the point value for that x-axis point.
 */
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

/**
 *  this method will add a Plot to the graph.
 *
 *  @param newPlot the Plot that you want to draw on the Graph.
 */
- (void)addPlot:(OPPlot *)newPlot;

/**
 *  this method is the actual method which starts the drawing of the graph and does all the magic. call this method when
 *  you are ready and want to show the graph.
 */
- (void)setupTheView;

@end
