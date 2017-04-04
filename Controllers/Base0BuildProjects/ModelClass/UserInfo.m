//
//  UserInfo.m
//  BaseProject
//

#import "UserInfo.h"

@implementation UserInfo

+ (id)sharedManager
{
    static id sharedManager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

@end
