//
//  ButtonTitleColor.m
//  MobiloitteTest2017March
//
//  Created by Akash sharma on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "ButtonTitleColor.h"
#import "Macro.h"

@implementation ButtonTitleColor

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithCoder:(NSCoder*)coder {
    self = [super initWithCoder:coder];
    if (self) {
        
        [[self titleLabel] setFont:[UIFont fontWithName:LABEL_FONT size:20]];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        if(self.state == UIControlStateHighlighted) {
            [self setBackgroundColor:[UIColor greenColor]];
        }
        else {
            [self setBackgroundColor:[UIColor greenColor]];
        }
    }
    return self;
}
@end
