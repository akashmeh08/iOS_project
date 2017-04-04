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

+ (id)sharedManager;

@end
