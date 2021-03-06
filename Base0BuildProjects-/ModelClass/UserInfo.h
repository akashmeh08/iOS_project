//
//  UserInfo.h
//  BaseProject
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (strong, nonatomic) NSString      * userName;
@property (strong, nonatomic) NSString      * fullName;
@property (strong, nonatomic) NSString      * email;
@property (strong, nonatomic) NSString      * phone;
@property (strong, nonatomic) NSString      * password;
@property (strong, nonatomic) NSString  *userFirstName;
@property (strong, nonatomic) NSString  *userLastName;
@property (strong, nonatomic) NSString  *userEmail;
@property (strong, nonatomic) NSString  *userMobileNumber;
@property (strong, nonatomic) NSString  *userPassword;
@property (strong, nonatomic) NSString  *userConfirmPassword;
@property (strong, nonatomic) NSString  *userGender;
@property (strong, nonatomic) NSString  *tickTerms;
@property (strong, nonatomic) NSString  *Gender;
@property (nonatomic) BOOL isCheck;


+ (id)sharedManager;
+(UserInfo *)ParseUserInfo:(id)tempDict;

@end
