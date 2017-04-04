//
//  OPPieChartView.m
//  Openia
//
//  Created by Sunil Verma on 31/05/16.
//  Copyright © 2016 Mobiloitte Inc. All rights reserved.
//

#import "OPPieChartView.h"
#import "OPLineGraphView.h"
#import "OPPlot.h"
#import <math.h>
#import <objc/runtime.h>

#define BOTTOM_MARGIN_TO_LEAVE 30.0
#define TOP_MARGIN_TO_LEAVE 30.0
//#define INTERVAL_COUNT 9
#define INTERVAL_COUNT 5
#define PLOT_WIDTH (self.bounds.size.width - _leftMarginToLeave)

#define kAssociatedPlotObject @"kAssociatedPlotObject"
@implementation OPPieChartView{
    float _leftMarginToLeave;
}


- (instancetype)init {
    if((self = [super init])) {
        [self loadDefaultTheme];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self loadDefaultTheme];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadDefaultTheme];
    }
    return self;
}

- (void)loadDefaultTheme {
    _themeAttributes = @{
                         kXAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                         kXAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                         kYAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                         kYAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                         kYAxisLabelSideMarginsKey : @10,
                         kPlotBackgroundLineColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                         kDotSizeKey : @10.0
                         };
}

- (void)addPlot:(OPPlot *)newPlot;
{
    if(nil == newPlot) {
        return;
    }
    
    if(_plots == nil){
        _plots = [NSMutableArray array];
    }
    [_plots addObject:newPlot];
}

- (void)setupTheView
{
    for(OPPlot *plot in _plots) {
        [self drawPlotWithPlot:plot];
    }
}


#pragma mark - Actual Plot Drawing Methods

- (void)drawPlotWithPlot:(OPPlot *)plot {
    
    [self drawXLabels:plot];
    
    /*
     actual plot drawing
     */
    [self drawPlot:plot];
}

- (int)getIndexForValue:(NSNumber *)value forPlot:(OPPlot *)plot {
    for(int i=0; i< _xAxisValues.count; i++) {
        NSDictionary *d = [_xAxisValues objectAtIndex:i];
        __block BOOL foundValue = NO;
        [d enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSNumber *k = (NSNumber *)key;
            if([k doubleValue] == [value doubleValue]) {
                foundValue = YES;
                *stop = foundValue;
            }
        }];
        if(foundValue){
            return i;
        }
    }
    return -1;
}

- (void)drawPlot:(OPPlot *)plot {
    
    
    
    double yRange = [_yAxisRange doubleValue]; // this value will be in dollars
    double yIntervalValue = yRange / INTERVAL_COUNT;
    
    //logic to fill the graph path, ciricle path, background path.
    [plot.plottingValues enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *dic = (NSDictionary *)obj;
        
        __block NSNumber *_key = nil;
        __block NSNumber *_value = nil;
        
        [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            _key = (NSNumber *)key;
            _value = (NSNumber *)obj;
        }];
        
        int xIndex = [self getIndexForValue:_key forPlot:plot];
        
        //x value
        double height = self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE;
        double y = height - ((height / ([_yAxisRange doubleValue] + yIntervalValue)) * [_value doubleValue]);
        (plot.xPoints[xIndex]).x = ceil((plot.xPoints[xIndex]).x);
        (plot.xPoints[xIndex]).y = ceil(y);
    }];
    
    //move to initial point for path and background.
    
    
    
    NSArray *colorArray =  [NSArray arrayWithObjects:[UIColor colorWithRed:97.0/255 green:159.0/255 blue:197.0/255 alpha:1],[UIColor colorWithRed:136.0/255 green:188.0/255 blue:222.0/255 alpha:1],[UIColor colorWithRed:177.0/255 green:132.0/255 blue:196.0/255 alpha:1],[UIColor colorWithRed:101.0/255 green:113.0/255 blue:125.0/255 alpha:1],[UIColor colorWithRed:230.0/255 green:123.0/255 blue:111.0/255 alpha:1],[UIColor colorWithRed:230.0/255 green:157.0/255 blue:92.0/255 alpha:1],[UIColor colorWithRed:237.0/255 green:206.0/255 blue:80.0/255 alpha:1],[UIColor colorWithRed:102.0/255 green:211.0/255 blue:149.0/255 alpha:1],[UIColor colorWithRed:177.0/255 green:132.0/255 blue:196.0/255 alpha:1], nil];
    
    int count = (int)_xAxisValues.count;
    
    float startAngle = 0;
    for(int i=0; i< count; i++){
        
        NSDictionary *dict = [_xAxisValues objectAtIndex:i];
        
        
        NSDictionary *valueDict = plot.plottingValues[i];
        
        
        float yValue = [[[valueDict allValues] firstObject] floatValue];
        
        float progress  = (float) yValue/plot.totalValue;
        
        
        NSLog(@"bbbbbbbbbbbbbbbb  %@     %f   %f",valueDict,progress,yValue);
        
        CAShapeLayer *circle = [CAShapeLayer layer];
        float endAngle = (M_PI*2)*progress + startAngle;
        
        CGPoint center = self.center;
        
        if (plot.plottedIndex ==1) {
            
            
            circle.path =  [UIBezierPath bezierPathWithArcCenter:center  radius: 25.0 startAngle:startAngle endAngle:endAngle clockwise:YES].CGPath;
            circle.lineWidth = 10;
            
            
        }else
        {
            if ([[dict valueForKey:kPlotPointHightlightedKey] boolValue]) {
                
                circle.path =  [UIBezierPath bezierPathWithArcCenter:center  radius: 57.0 startAngle:startAngle endAngle:endAngle clockwise:YES].CGPath;
                
            }else
            {
                circle.path =  [UIBezierPath bezierPathWithArcCenter:center  radius: 55.0 startAngle:startAngle endAngle:endAngle clockwise:YES].CGPath;
            }
            
            circle.lineWidth = 20;
            CGPoint lblCenter = CGPointMake(center.x + 75*cos((startAngle +endAngle)/2.0) , center.y + 75*sin((endAngle+startAngle)/2.0));
      
      
              NSDictionary *dic = [_xAxisValues objectAtIndex:i];
              __block NSString *xLabel = nil;
              [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
      
                  if (![key isEqualToString:kPlotPointHightlightedKey]) {
                      xLabel = (NSString *)obj;
      
                  }
              }];
      

            [self addLabelAtPoint:lblCenter andValue:[NSString stringWithFormat:@"%@", xLabel] textColor:(UIColor *)[colorArray objectAtIndex:i]];
        }
        
        
        
        startAngle = endAngle;
        circle.fillColor = [UIColor clearColor].CGColor;
        circle.strokeColor =  ((UIColor *)[colorArray objectAtIndex:i]).CGColor; //(UIColor *)theme[kPlotStrokeColorKey]).CGColor;
        [self.layer addSublayer:circle];
        
        
        
        
    }
    
    
    
    
    
    
    
}


-(void)addLabelAtPoint:(CGPoint )point andValue:(NSString *)value textColor:(UIColor *)color{
    
    UILabel *xAxisLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    xAxisLabel.backgroundColor = [UIColor clearColor];
    xAxisLabel.font = (UIFont *)_themeAttributes[kXAxisLabelFontKey];
    
    xAxisLabel.text =value;
    xAxisLabel.textColor = color;
    xAxisLabel.textAlignment = NSTextAlignmentCenter;
    xAxisLabel.center = point;
    
    [self addSubview:xAxisLabel];
}

- (void)drawXLabels:(OPPlot *)plot {
    
    int xIntervalCount = (int)_xAxisValues.count;
        //initialize actual x points values where the circle will be
    plot.xPoints = calloc(sizeof(CGPoint), xIntervalCount);
    
   
}



@end
