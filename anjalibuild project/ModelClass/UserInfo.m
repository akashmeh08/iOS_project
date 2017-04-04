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
    
    objLocal.userFirstName = [tempDict objectForKey:@"firstname"];
    objLocal.userLastName = [tempDict objectForKey:@"lastname"];
    objLocal.userEmail = [tempDict objectForKey:@"email"];
    objLocal.password = [tempDict objectForKey:@"password"];
    objLocal.userMobileNumber = [tempDict objectForKey:@"phonenumber"];
    objLocal.userGender = [tempDict objectForKey:@"gender"];

    
    
    return objLocal;
}

@end
