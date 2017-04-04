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

+(UserInfo *)ParseUserInfo:(id)tempDict{
    
    UserInfo  *objLocal = [[UserInfo alloc] init];
    
    objLocal.userName = [tempDict objectForKey:@"username"];
    objLocal.fullName = [tempDict objectForKey:@"fullname"];
    objLocal.email = [tempDict objectForKey:@"email"];
    objLocal.password = [tempDict objectForKey:@"password"];
    objLocal.phone = [tempDict objectForKey:@"phone"];

    
    
    return objLocal;
}

@end
