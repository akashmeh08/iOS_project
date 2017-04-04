//
//  NSObject+categoryFile.h
//  screens
//
//  Created by Sarvada Chauhan on 06/03/17.
//  Copyright © 2017 Sarvada Chauhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (categoryFile)
-(BOOL)inUser:(NSString *)user;
-(BOOL)isValidPassword:(NSString *)password;
@end
