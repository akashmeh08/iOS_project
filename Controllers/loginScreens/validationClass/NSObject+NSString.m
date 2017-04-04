//
//  NSObject+NSString.m
//  loginScreens
//
//  Created by Sarvada Chauhan on 16/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import "NSObject+NSString.h"

@implementation NSObject (NSString)

    -(BOOL) isValidEmail:(NSString *)user
    {
        NSString *emailRegex =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        return [regex evaluateWithObject:user];
    }
    
    -(BOOL)isValidPassword:(NSString *)password
    {
        NSString *filterString =@"[0-9A-Za-z@#\b]*";
        NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", filterString];
        return [passwordTest evaluateWithObject:password];
    }

@end
