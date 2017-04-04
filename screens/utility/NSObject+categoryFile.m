//
//  NSObject+categoryFile.m
//  screens
//
//  Created by Sarvada Chauhan on 06/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import "NSObject+categoryFile.h"

@implementation NSObject (categoryFile)
-(BOOL)inUser:(NSString *)user
{
    NSString *emailRegex = @"[a-z0-9]";
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [regex evaluateWithObject:user];
}

-(BOOL)isValidPassword:(NSString *)password
{
    NSString *stricterFilterString = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{10,}";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [passwordTest evaluateWithObject:password];
    
}
@end


