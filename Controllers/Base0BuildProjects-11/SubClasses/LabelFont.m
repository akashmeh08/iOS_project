//
//  LabelFont.m
//  MobiloitteTest2017March
//
//  Created by Akash sharma on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "LabelFont.h"
#import "Macro.h"

@implementation LabelFont


- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont fontWithName:LABEL_FONT size:12];
    }
    return self;
}

@end
