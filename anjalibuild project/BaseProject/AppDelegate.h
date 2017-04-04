//
//  AppDelegate.h
//  BaseProject
//

#import <UIKit/UIKit.h>
#import "Macro.h"
#import <UserNotifications/UserNotifications.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate,UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign) BOOL       isReachable;

@end

