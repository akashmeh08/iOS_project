//
//  OPBarGraphView.m
//  Openia
//
//  Created by Sunil Verma on 31/05/16.
//  Copyright © 2016 Mobiloitte Inc. All rights reserved.
//

#import "OPBarGraphView.h"
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

@implementation OPBarGraphView{
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
    
    //   / [self removeGraph];
    for(OPPlot *plot in _plots) {
        [self drawPlotWithPlot:plot];
    }
    
    
}


//-(void)removeGraph
//{
//    for (UIView *obj  in self.subviews) {
//
//        [obj removeFromSuperview];
//    }
//}
#pragma mark - Actual Plot Drawing Methods

- (void)drawPlotWithPlot:(OPPlot *)plot {
    //draw y-axis labels. this has to be done first, so that we can determine the left margin to leave according to the
    //y-axis lables.
    [self drawYLabels:plot];
    
    //draw x-labels
    [self drawXLabels:plot];
    
    //draw the grey lines
    [self drawLines:plot];
    
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
    
    NSDictionary *theme = plot.plotThemeAttributes;
    
    
  
    
    
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
    
    
    int count = (int)_xAxisValues.count;
    for(int i=0; i< count; i++){
        CGPoint point = plot.xPoints[i];
        
        NSDictionary *dict = [_xAxisValues objectAtIndex:i];

        CAShapeLayer *graphLayer = [CAShapeLayer layer];
        graphLayer.frame = self.bounds;
        graphLayer.fillColor = [UIColor clearColor].CGColor;
        graphLayer.backgroundColor = [UIColor clearColor].CGColor;
        [graphLayer setLineWidth:3];
        graphLayer.lineCap = kCALineCapRound;
        CGMutablePathRef graphPath = CGPathCreateMutable();
        if ([[dict valueForKey:kPlotPointHightlightedKey] boolValue]) {
            
            
            [graphLayer setStrokeColor:((UIColor *)theme[kPlotStrokeColorKey]).CGColor];

        }else
        {
            [graphLayer setStrokeColor:[((UIColor *)theme[kPlotStrokeColorKey]) colorWithAlphaComponent:.6].CGColor];
  
        }

        
        if (plot.plottedIndex ==1) {
            CGPathMoveToPoint(graphPath, NULL, point.x +2, self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE);
            
            CGPathAddLineToPoint(graphPath, NULL, point.x +2, point.y);
        }else
        {
            CGPathMoveToPoint(graphPath, NULL, point.x - 2, self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE);
            
            CGPathAddLineToPoint(graphPath, NULL, point.x -2, point.y);
        }
       

        
        graphLayer.path = graphPath;
        [self.layer addSublayer:graphLayer];

        NSLog(@" .............  %@",dict);
        
    }
    
    
    
    //animation
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //    animation.duration = 1;
    //    animation.fromValue = @(0.0);
    //    animation.toValue = @(1.0);
    //    [graphLayer addAnimation:animation forKey:@"strokeEnd"];
    
    
    
    
}

- (void)drawXLabels:(OPPlot *)plot {
    int xIntervalCount = (int)_xAxisValues.count;
    double xIntervalInPx = PLOT_WIDTH / _xAxisValues.count;
    
    //initialize actual x points values where the circle will be
    plot.xPoints = calloc(sizeof(CGPoint), xIntervalCount);
    
    for(int i=0; i < xIntervalCount; i++){
        CGPoint currentLabelPoint = CGPointMake((xIntervalInPx * i) + _leftMarginToLeave, self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE);
        CGRect xLabelFrame = CGRectMake(currentLabelPoint.x , currentLabelPoint.y, xIntervalInPx, BOTTOM_MARGIN_TO_LEAVE);
        
        plot.xPoints[i] = CGPointMake((int) xLabelFrame.origin.x + (xLabelFrame.size.width /2) , (int) 0);
        
        UILabel *xAxisLabel = [[UILabel alloc] initWithFrame:xLabelFrame];
        xAxisLabel.backgroundColor = [UIColor clearColor];
        xAxisLabel.font = (UIFont *)_themeAttributes[kXAxisLabelFontKey];
        
        xAxisLabel.textColor = (UIColor *)_themeAttributes[kXAxisLabelColorKey];
        xAxisLabel.textAlignment = NSTextAlignmentCenter;
        
        NSDictionary *dic = [_xAxisValues objectAtIndex:i];
        __block NSString *xLabel = nil;
        [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            if (![key isEqualToString:kPlotPointHightlightedKey]) {
                xLabel = (NSString *)obj;
                
            }
        }];
        
        xAxisLabel.text = [NSString stringWithFormat:@"%@", xLabel];
        [self addSubview:xAxisLabel];
    }
}

- (void)drawYLabels:(OPPlot *)plot {
    //  double yRange = [_yAxisRange doubleValue]; // this value will be in dollars
    //  double yIntervalValue = yRange / INTERVAL_COUNT;
    //  double intervalInPx = (self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE ) / (INTERVAL_COUNT +1);
    //
    //  NSMutableArray *labelArray = [NSMutableArray array];
    //  float maxWidth = 0;
    //
    //  for(int i= INTERVAL_COUNT + 1; i >= 0; i--){
    //    CGPoint currentLinePoint = CGPointMake(_leftMarginToLeave, i * intervalInPx);
    //    CGRect lableFrame = CGRectMake(0, currentLinePoint.y - (intervalInPx / 2), 100, intervalInPx);
    //
    //    if(i != 0) {
    //      UILabel *yAxisLabel = [[UILabel alloc] initWithFrame:lableFrame];
    //      yAxisLabel.backgroundColor = [UIColor clearColor];
    //      yAxisLabel.font = (UIFont *)_themeAttributes[kYAxisLabelFontKey];
    //      yAxisLabel.textColor = (UIColor *)_themeAttributes[kYAxisLabelColorKey];
    //      yAxisLabel.textAlignment = NSTextAlignmentCenter;
    //      float val = (yIntervalValue * (10 - i));
    //      if(val > 0){
    //        yAxisLabel.text = [NSString stringWithFormat:@"%.1f%@", val, _yAxisSuffix];
    //      } else {
    //        yAxisLabel.text = [NSString stringWithFormat:@"%.0f", val];
    //      }
    //      [yAxisLabel sizeToFit];
    //      CGRect newLabelFrame = CGRectMake(0, currentLinePoint.y - (yAxisLabel.layer.frame.size.height / 2), yAxisLabel.frame.size.width, yAxisLabel.layer.frame.size.height);
    //      yAxisLabel.frame = newLabelFrame;
    //
    //      if(newLabelFrame.size.width > maxWidth) {
    //        maxWidth = newLabelFrame.size.width;
    //      }
    //
    //      [labelArray addObject:yAxisLabel];
    //      [self addSubview:yAxisLabel];
    //    }
    //  }
    //
    //  _leftMarginToLeave = maxWidth + [_themeAttributes[kYAxisLabelSideMarginsKey] doubleValue];
    //
    //  for( UILabel *l in labelArray) {
    //    CGSize newSize = CGSizeMake(_leftMarginToLeave, l.frame.size.height);
    //    CGRect newFrame = l.frame;
    //    newFrame.size = newSize;
    //    l.frame = newFrame;
    //  }
}

- (void)drawLines:(OPPlot *)plot {
    
    CAShapeLayer *linesLayer = [CAShapeLayer layer];
    linesLayer.frame = self.bounds;
    linesLayer.fillColor = [UIColor clearColor].CGColor;
    linesLayer.backgroundColor = [UIColor clearColor].CGColor;
    linesLayer.strokeColor = ((UIColor *)_themeAttributes[kPlotBackgroundLineColorKey]).CGColor;
    linesLayer.lineWidth = 1;
    
    CGMutablePathRef linesPath = CGPathCreateMutable();
    
    double intervalInPx = (self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE) / (INTERVAL_COUNT + 1);
    for(int i= INTERVAL_COUNT + 1; i > 0; i--){
        
        CGPoint currentLinePoint = CGPointMake(_leftMarginToLeave, (i * intervalInPx));
        
        CGPathMoveToPoint(linesPath, NULL, currentLinePoint.x, currentLinePoint.y);
        CGPathAddLineToPoint(linesPath, NULL, currentLinePoint.x + PLOT_WIDTH, currentLinePoint.y);
    }
    
    linesLayer.path = linesPath;
    [self.layer addSublayer:linesLayer];
}

#pragma mark - UIButton event methods

- (void)clicked:(id)sender
{
    @try {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
        lbl.backgroundColor = [UIColor clearColor];
        UIButton *btn = (UIButton *)sender;
        NSUInteger tag = btn.tag;
        
        OPPlot *_plot = objc_getAssociatedObject(btn, kAssociatedPlotObject);
        NSString *text = [_plot.plottingPointsLabels objectAtIndex:tag];
        
        //	NSDictionary *dict = [_plot.plottingValues objectAtIndex:tag];
        
        
        //  [_plot.plottingValues objectAtIndex:text];
        //	lbl.text =  [[[dict allValues] firstObject] stringValue];
        
        lbl.text = text;
        lbl.textColor = [UIColor whiteColor];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.font = (UIFont *)_plot.plotThemeAttributes[kPlotPointValueFontKey];
        [lbl sizeToFit];
        lbl.frame = CGRectMake(0, 0, lbl.frame.size.width + 5, lbl.frame.size.height);
        
        CGPoint point =((UIButton *)sender).center;
        point.y -= 8;
        
        NSDictionary *theme = _plot.plotThemeAttributes;
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [OPPopoverView showPopoverAtPoint:point inView:self withContentView:lbl backgroundCollor:((UIColor *)theme[kPlotPointFillColorKey]) delegate:nil];
//        });
    }
    @catch (NSException *exception) {
        NSLog(@"plotting label is not available for this point");
    }
}

//#pragma mark - Theme Key Extern Keys
//
//NSString *const kXAxisLabelColorKey         = @"kXAxisLabelColorKey";
//NSString *const kXAxisLabelFontKey          = @"kXAxisLabelFontKey";
//NSString *const kYAxisLabelColorKey         = @"kYAxisLabelColorKey";
//NSString *const kYAxisLabelFontKey          = @"kYAxisLabelFontKey";
//NSString *const kYAxisLabelSideMarginsKey   = @"kYAxisLabelSideMarginsKey";
//NSString *const kPlotBackgroundLineColorKey = @"kPlotBackgroundLineColorKey";
//NSString *const kDotSizeKey                 = @"kDotSizeKey";

@end
