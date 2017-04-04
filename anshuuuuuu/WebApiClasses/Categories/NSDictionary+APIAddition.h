//
//  NSDictionary+APIAddition.h
//  ProjectTemplate
//

#import <Foundation/Foundation.h>

@interface NSDictionary (APIAddition)

- (id)objectForKeyNotNull:(id)key expectedObj:(id)obj;

+ (id)dictionaryWithContentsOfJSONURLData:(NSData *)JSONData;

- (NSData*)toNSData;
- (NSString *)toJsonString;

@end
