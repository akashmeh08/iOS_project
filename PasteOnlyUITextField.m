//
//  PasteOnlyUITextField.m
//  Mobiloitte
//
//  Created by Akash sharma on 22/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "PasteOnlyUITextField.h"

@implementation PasteOnlyUITextField

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:))
    {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        NSString *string = pasteboard.string;
        if (string) {
            if(string.length>64)
            {
            NSLog(@"%li",string.length);
            NSString *mystr1=[string substringToIndex:64];
            NSLog(@"%@",mystr1);
            pasteboard.string=mystr1;
            }
        }
        return true;
    }
    return false;
}

@end
