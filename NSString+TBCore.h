//
//  NSString+TBCore.h
//  TBUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 Qsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TBCore)

@end

#pragma mark - Document

@interface NSString (Document)

@end

#pragma mark - Validate
@interface NSString (Validate)

/**
 *  tb_isEmpty
 *
 *  @return BOOL
 */
- (BOOL)tb_isEmpty;

/**
 *  tb_isValidEmail
 *
 *  @return BOOL
 */
- (BOOL)tb_isValidEmail;

/**
 *  tb_isValidPassword
 *
 *  @return BOOL
 */
- (BOOL)tb_isValidPassword;

/**
 *  tb_isValidTelephone
 *
 *  @return BOOL
 */
- (BOOL)tb_isValidTelephone;

/**
 *  tb_validateUrl
 *
 *  @return BOOL
 */
- (BOOL)tb_validateUrl;

@end

#pragma mark - URL
@interface NSString (URL)

/**
 *  stringByUrlEncoded
 *
 *  @return NSString
 */
- (NSString *)tb_stringByUrlEncoded;

@end

#pragma mark - Utilities
@interface NSString (Utilities)

/**
 *  tb_removeWhitespace
 *
 *  @return NSString
 */
- (NSString *)tb_removeWhitespace;

/**
 *  tb_stringFromInteger
 *
 *  @param anInteger NSInteger
 *
 *  @return NSString
 */
+ (NSString *)tb_stringFromInteger:(NSInteger)anInteger;

/**
 *  tb_stringFromFloat
 *
 *  @param aFloat float
 *
 *  @return NSString
 */
+ (NSString *)tb_stringFromFloat:(float)aFloat;

/**
 *  tb_stringFromDouble
 *
 *  @param aDouble double
 *
 *  @return NSString
 */
+ (NSString*)tb_stringFromDouble:(double)aDouble;


/**
 *  tb_stringWithUUID
 *
 *  @return NSString
 */
+ (NSString *)tb_stringWithUUID;

/**
 *  tb_isEqualString
 *
 *  Default: compare uppercase
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_isEqualString:(NSString *)aString;


/**
 *  tb_containsString
 *
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_containsString:(NSString *)aString;


/**
 *  tb_containsCaseInsensitiveString
 *
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_containsCaseInsensitiveString:(NSString *)aString;

/**
 *  tb_caseInsensitiveHasPrefix
 *
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_caseInsensitiveHasPrefix:(NSString *)aString;

/**
 *  tb_caseInsensitiveHasSuffix
 *
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_caseInsensitiveHasSuffix:(NSString *)aString;

/**
 *  tb_isCaseInsensitiveEqual
 *
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_isCaseInsensitiveEqual:(NSString *)aString;

/**
 *  tb_isEqualToStringInsensitive
 *
 *  @param strNeedEqual NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_isEqualToStringInsensitive:(NSString *)strNeedEqual;

@end