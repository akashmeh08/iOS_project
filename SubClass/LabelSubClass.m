//
//  LabelSubClass.m
//  MobiloitteTest2017March
//
//  Created by Sarvada Chauhan on 27/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "LabelSubClass.h"
#import "Macro.h"
@implementation LabelSubClass

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self =[super initWithCoder:aDecoder];
    if (self) {
        self.font = [UIFont fontWithName:LABEL_FONT size: LABEL_SIZE];
    }
    return self;
    
}

@end
