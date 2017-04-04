//
//  ServiceHelper.h
//  ProjectTemplate
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    GET = 0,
    POST = 1,
    DELETE = 2,
    PUT = 3,
    PATCH = 4
    
} Method;

@interface ServiceHelper : NSObject

+ (ServiceHelper *)helper;

- (void)request:(NSMutableDictionary *)parameterDict apiName:(NSString *)name withToken:(BOOL)isToken method:(Method)methodType onViewController:(UIViewController *)controller completionBlock:(void (^)(id result, NSError *error))handler;

// Need to test

- (void)multiPartRequest:(NSMutableDictionary *)parameterDict images:(NSArray *)images apiName:(NSString *)name withToken:(BOOL)isToken onViewController:(UIViewController *)controller completionBlock:(void (^)(id result, NSError *error))handler;

@end
