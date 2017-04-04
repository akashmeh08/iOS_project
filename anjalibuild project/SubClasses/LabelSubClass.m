//
//  LabelSubClass.m
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//
#import "Macro.h"
#import "LabelSubClass.h"

@implementation LabelSubClass

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self =[super initWithCoder:aDecoder];
    if (self) {
        self.font = [UIFont fontWithName:LABEL_FONT size: LABEL_SIZE];
    }
    return self;
    
}
//- (void)drawRect:(CGRect)rect 
// {
//  
//     //self.minimumFontSize = 12;
//     self.adjustsFontSizeToFitWidth = YES;
//     self.font = [UIFont systemFontOfSize:25];
// }

@end
