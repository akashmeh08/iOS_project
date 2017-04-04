//
//  NSObject+NSString.m
//  myFirstProject
//
//  Created by Sarvada Chauhan on 06/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import "NSObject+NSString.h"

@implementation NSObject (NSString)
-(BOOL)inUser:(NSString *)user
{
    NSString *emailRegex = @"[a-z0-9@\b]*";
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [regex evaluateWithObject:user];
}
-(BOOL)isValidPassword:(NSString *)password
{
    NSString *filterString = @"[0-9A-Za-z@#\b]*";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", filterString];
    return [passwordTest evaluateWithObject:password];
    
}

@end
