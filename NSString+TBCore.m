//
//  NSString+TBCore.m
//  TBUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 Qsoft. All rights reserved.
//

#import "NSString+TBCore.h"

@implementation NSString (TBCore)

@end


#pragma mark - Document

@implementation NSString (Document)

@end

#pragma mark - Validate
@implementation NSString (Validate)

/**
 *  tb_isEmpty
 *
 *  @return BOOL
 */
- (BOOL)tb_isEmpty
{
    return [[self tb_removeWhitespace] isEqualToString:@""];
}

/**
 *  tb_isValidEmail
 *
 *  @return BOOL
 */
- (BOOL)tb_isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
}

/**
 *  tb_isValidPassword
 *
 *  @return BOOL
 */
- (BOOL)tb_isValidPassword
{
    
    return [self length] >= 6;
}

/**
 *  tb_isValidTelephone
 *
 *  @return BOOL
 */
- (BOOL)tb_isValidTelephone
{
    NSString *phoneRegex = @"[235689][0-9]{6}([0-9]{3})?";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [test evaluateWithObject:self];
}

/**
 *  tb_validateUrl
 *
 *  @return BOOL
 */
- (BOOL)tb_validateUrl
{
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:self];
}


@end

#pragma mark - URL
@implementation NSString (URL)

/**
 *  stringByUrlEncoded
 *
 *  @return NSString
 */
- (NSString *)tb_stringByUrlEncoded
{
    CFStringRef urlString = CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                    (CFStringRef)self,
                                                                    NULL,
                                                                    (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                    kCFStringEncodingUTF8);
    return (__bridge NSString *)urlString;
}

@end

#pragma mark - Utilities
@implementation NSString (Utilities)

/**
 *  tb_stringFromInteger
 *
 *  @param anInteger NSInteger
 *
 *  @return NSString
 */
+ (NSString *)tb_stringFromInteger:(NSInteger)anInteger
{
    return [NSString stringWithFormat:@"%ld", (long)anInteger];
}

/**
 *  tb_stringFromFloat
 *
 *  @param aFloat float
 *
 *  @return NSString
 */
+ (NSString *)tb_stringFromFloat:(float)aFloat
{
    return [NSNumber numberWithFloat:aFloat].stringValue;
}

/**
 *  tb_stringFromDouble
 *
 *  @param aDouble double
 *
 *  @return NSString
 */
+ (NSString*)tb_stringFromDouble:(double)aDouble
{
    return [NSNumber numberWithDouble:aDouble].stringValue;
}

/**
 *  tb_stringWithUUID
 *
 *  @return NSString
 */
+ (NSString *)tb_stringWithUUID
{
    NSString* uuidString = nil;
    CFUUIDRef newUUID = CFUUIDCreate(kCFAllocatorDefault);
    
    if (newUUID)
    {
        uuidString = (__bridge NSString *)CFUUIDCreateString(kCFAllocatorDefault, newUUID);
        CFRelease(newUUID);
    }
    
    return uuidString;
}


/**
 *  tb_removeWhitespace
 *
 *  @return NSString
 */
- (NSString *)tb_removeWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


/**
 *  tb_isEqualString
 *
 *  Default: compare uppercase
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_isEqualString:(NSString *)aString
{
    return [[self uppercaseString] isEqualToString:[aString uppercaseString]];
}

/**
 *  tb_containsString
 *
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_containsString:(NSString *)aString
{
    NSRange range = [self rangeOfString:aString];
    
    return range.location != NSNotFound;
}


/**
 *  tb_containsCaseInsensitiveString
 *
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_containsCaseInsensitiveString:(NSString *)aString
{
    NSRange range = [self rangeOfString:aString options:NSCaseInsensitiveSearch];
    
    return range.location != NSNotFound;
}

/**
 *  tb_caseInsensitiveHasPrefix
 *
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_caseInsensitiveHasPrefix:(NSString *)aString
{
    return [[self lowercaseString] hasPrefix:[aString lowercaseString]];
}

/**
 *  tb_caseInsensitiveHasSuffix
 *
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_caseInsensitiveHasSuffix:(NSString *)aString
{
    return [[self lowercaseString] hasSuffix:[aString lowercaseString]];
}

/**
 *  tb_isCaseInsensitiveEqual
 *
 *  @param aString NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_isCaseInsensitiveEqual:(NSString *)aString
{
    return [self compare:aString options:NSCaseInsensitiveSearch] == NSOrderedSame;
}


/**
 *  tb_isEqualToStringInsensitive
 *
 *  @param strNeedEqual NSString
 *
 *  @return BOOL
 */
- (BOOL)tb_isEqualToStringInsensitive:(NSString *)strNeedEqual
{
    return [[self lowercaseString] isEqualToString:[strNeedEqual lowercaseString]];
}

@end
