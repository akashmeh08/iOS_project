//
//  NSString+Addition.h
//  ProjectTemplate
//
//  Created by Raj Kumar Sharma on 19/05/16.
//  Copyright © 2016 Mobiloitte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import "Macro.h"

@interface NSString (Addition)

- (CGFloat)getEstimatedHeightWithFont:(UIFont*)font withWidth:(CGFloat)width withExtraHeight:(CGFloat)ht;

- (BOOL)isBlank;
- (BOOL)isValid;
- (NSString *)removeWhiteSpacesFromString;


- (NSUInteger)countNumberOfWords;
- (BOOL)containsString:(NSString *)subString;
- (BOOL)isBeginsWith:(NSString *)string;
- (BOOL)isEndssWith:(NSString *)string;

- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;
- (NSString *)addString:(NSString *)string;
- (NSString *)removeSubString:(NSString *)subString;

- (BOOL)containsOnlyLetters;
- (BOOL)containsOnlyNumbers;
- (BOOL)containsOnlyNumbersAndLetters;
- (BOOL)isInThisarray:(NSArray*)array;

+ (NSString *)getStringFromArray:(NSArray *)array;
- (NSArray *)getArray;

+ (NSString *)getMyApplicationVersion;
+ (NSString *)getMyApplicationName;

- (NSData *)convertToData;
+ (NSString *)getStringFromData:(NSData *)data;

- (BOOL)isValidEmail;
- (BOOL)isValidPhoneNumber;
- (BOOL)isValidUrl;
- (BOOL)isValidName;


- (NSString *)trimWhitespace;
- (BOOL)matchStringWhileIgnoringCase:(NSString *)string;
+ (NSString*)ordinalNumberFormat:(NSNumber *)numObj;

- (NSAttributedString *)getAttributedString:(NSString *)string withColor:(UIColor *)color withFont:(UIFont *)font;

- (NSAttributedString *)getSimpleMultiAttributedStringWithFirstStr:(NSString *)firstStr withColor :(UIColor *)firstStrColor withFont :(UIFont *)firstStrFont secondStr:(NSString *)secondStr withColor:(UIColor *)secondStrColor withFont :(UIFont *)secondStrFont;

- (NSAttributedString *)getMultiAttributedStringWithCompleteStrColor:(UIColor *)completeStrColor withFont:(UIFont *)completeStrFont firstStr:(NSString *)firstStr withColor :(UIColor *)firstStrColor withFont :(UIFont *)firstStrFont secondStr:(NSString *)secondStr withColor:(UIColor *)secondStrColor withFont :(UIFont *)secondStrFont;
+ (NSMutableAttributedString *)setSuperScriptText:(NSString *)str withFont:(UIFont*)font withBaseLineOffset:(NSString*)baseLine;


/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Getting Attributed String Based on Seperation <<<<<<<<<<<<<<<<<<<<<<<<*/
- (NSAttributedString*)getAttributedStringSeperatedBy:(NSString *)seperationStr firstHalfColor :(UIColor *)color1 firstHalfFont :(UIFont *)font1 secondHalfColor:(UIColor *)color2 secondHalfFont :(UIFont *)font2;


+(NSAttributedString *)customAttributeString:(NSString *)stringText withAlignment:(NSTextAlignment)align withLineSpacing:(int)space withFont:(UIFont*)font;
/*>>>>>>>>>>>>>>>>>>>>> Encryption Method <<<<<<<<<<<<<<<<<*/

- (NSString *)MD5String;

@end
