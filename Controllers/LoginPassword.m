//
//  LoginPassword.m
//  Mobiloitte
//
//  Created by Akash sharma on 22/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "LoginPassword.h"

@implementation LoginPassword

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:))
    {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        NSString *string = pasteboard.string;
        if (string) {
            NSLog(@"%li",string.length);
            NSString *mystr1=[string substringToIndex:16];
            NSLog(@"%@",mystr1);
            pasteboard.string=mystr1;
        }
        return true;
    }
    return false;
}
@end
