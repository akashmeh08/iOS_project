//
//  OPTheamManager.h
//  Openia
//
//  Created by Sunil Verma on 24/02/16.
//  Copyright © 2016 Mobiloitte Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface OPThemeManager : NSObject

@property (nonatomic, readonly) UIColor *headerBgColor;

@property (nonatomic, readonly) UIColor *iconSelectedColor;
@property (nonatomic, readonly) UIColor *iconUnselectedColor;

@property (nonatomic, readonly) UIColor *cellBgColor;
@property (nonatomic, readonly) UIColor *cellContentBgColor;

@property (nonatomic, readonly) UIColor *textContentColor;
@property (nonatomic, readonly) UIColor *textContentSelectedColor;

@property (nonatomic, readonly) UIColor *blueContentColor;

@property (nonatomic, readonly) UIColor *footerLineColor;
@property (nonatomic, readonly) UIColor *headerLineColor;

@property (nonatomic,assign) BOOL isDarkTheme;

+(id)sharedManager;
-(void)updateTheam:(BOOL)isDark;

@end
