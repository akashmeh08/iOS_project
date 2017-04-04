//
//  PasteOnlyUITextField.m
//  Mobiloitte
//
//  Created by Rahul Maithani on 22/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "PasteOnlyUITextField.h"

@implementation PasteOnlyUITextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:))
    {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        NSString *string = pasteboard.string;
       
        if (string) {
            //NSLog(@"%li",string.length);
            if(string.length>64)
            {
                NSString *mystr1=[string substringToIndex:64];
             //NSLog(@"%@",mystr1);
                pasteboard.string=mystr1;
            }
        }
        return true;
    }
    return false;
}


@end
