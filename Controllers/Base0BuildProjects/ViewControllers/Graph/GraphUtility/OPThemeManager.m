//
//  OPTheamManager.m
//  Openia
//
//  Created by Sunil Verma on 24/02/16.
//  Copyright © 2016 Mobiloitte Inc. All rights reserved.
//

#import "OPThemeManager.h"


@interface OPThemeManager()

@property (nonatomic, strong) UIColor *pvtHeaderBgColor;

@property (nonatomic, strong) UIColor *pvtIconSelectedColor;
@property (nonatomic, strong) UIColor *pvtIconUnselectedColor;

@property (nonatomic, strong) UIColor *pvtCellBgColor;
@property (nonatomic, strong) UIColor *pvtContentBgColor;

@property (nonatomic, strong) UIColor *pvtTextContentColor;
@property (nonatomic, strong) UIColor *pvtTextContentSelectedColor;
@property (nonatomic, strong) UIColor *pvtBlueContentColor;

@property (nonatomic, strong) UIColor *pvtFooterLineColor;
@property (nonatomic, strong) UIColor *pvtHeaderLineColor;


@end

static OPThemeManager *manager = nil;



@implementation OPThemeManager

+(id)sharedManager
{
    
    if (!manager) {
        manager =  [[OPThemeManager alloc] init];
        manager.isDarkTheme = YES;
        [manager updateTheam:NO];
    }
    return manager;
}


-(UIColor *)headerBgColor
{
    return self.pvtHeaderBgColor;
}

-(UIColor *)iconSelectedColor
{
    return self.pvtIconSelectedColor;
}
-(UIColor *)iconUnselectedColor
{
    return self.pvtIconUnselectedColor;
}

-(UIColor *)cellBgColor
{
    return self.pvtCellBgColor;
    
}
-(UIColor *)cellContentBgColor
{
    return self.pvtContentBgColor;
}

-(UIColor *)textContentColor
{

    return self.pvtTextContentColor;
    
}
-(UIColor *)textContentSelectedColor
{
    return self.pvtTextContentSelectedColor;
}
-(UIColor *)blueContentColor
{
    return self.pvtBlueContentColor;
}

-(UIColor *)footerLineColor
{
    return self.pvtFooterLineColor;
}
-(UIColor *)headerLineColor
{
    return self.pvtHeaderLineColor;
    
}


-(void)updateTheam:(BOOL)isDark
{
    self.isDarkTheme = isDark;
    if (isDark) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

        self.pvtHeaderBgColor = [UIColor colorWithRed:5.0/255 green:6.0/255 blue:6.0/255 alpha:1.0];
        
        self.pvtIconSelectedColor =[UIColor colorWithRed:239.0/255 green:68.0/255 blue:84.0/255 alpha:1.0];
        self.pvtIconUnselectedColor = [UIColor colorWithRed:128.0/255 green:128.0/255 blue:128.0/255 alpha:1.0];;
        
        self.pvtCellBgColor  =[UIColor colorWithRed:17.0/255 green:17.0/255 blue:17.0/255 alpha:1.0];
        self.pvtContentBgColor = [UIColor colorWithRed:19.0/255 green:19.0/255 blue:19.0/255 alpha:1.0];
        
        self.pvtTextContentColor = [UIColor colorWithRed:255.0/255 green:255.0/255 blue:255.0/255 alpha:1.0];
        self.pvtBlueContentColor = [UIColor colorWithRed:66.0/255 green:188.0/255 blue:225.0/255 alpha:1];
        self.pvtTextContentSelectedColor =[UIColor colorWithRed:239.0/255 green:68.0/255 blue:84.0/255 alpha:1.0];
        self.pvtFooterLineColor  =[UIColor colorWithRed:0.0/255 green:174.0/255 blue:239.0/255 alpha:1.0];
        self.pvtHeaderLineColor = [UIColor colorWithRed:66.0/255 green:188.0/255 blue:225.0/255 alpha:1];

    }else
    {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];

        self.pvtHeaderBgColor = [UIColor colorWithRed:229.0/255 green:230.0/255 blue:231.0/255 alpha:1.0];
        
        
        self.pvtIconSelectedColor =[UIColor colorWithRed:239.0/255 green:68.0/255 blue:84.0/255 alpha:1.0];
        self.pvtIconUnselectedColor = [UIColor colorWithRed:128.0/255 green:128.0/255 blue:128.0/255 alpha:1.0];;
        
        self.pvtCellBgColor  =[UIColor colorWithRed:255.0/255 green:255.0/255 blue:255.0/255 alpha:1.0];
        self.pvtContentBgColor = [UIColor colorWithRed:229.0/255 green:230.0/255 blue:231.0/255 alpha:1.0];
        
        self.pvtTextContentColor = [UIColor colorWithRed:49.0/255 green:50.0/255 blue:49.0/255 alpha:1.0];
        self.pvtBlueContentColor = [UIColor colorWithRed:66.0/255 green:188.0/255 blue:225.0/255 alpha:1];
        self.pvtTextContentSelectedColor =[UIColor colorWithRed:239.0/255 green:68.0/255 blue:84.0/255 alpha:1.0];

        self.pvtFooterLineColor  =[UIColor colorWithRed:0.0/255 green:174.0/255 blue:239.0/255 alpha:1.0];
        self.pvtHeaderLineColor = [UIColor colorWithRed:66.0/255 green:188.0/255 blue:225.0/255 alpha:1];
    }
    
}

@end
