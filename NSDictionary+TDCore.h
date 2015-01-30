//
//  NSDictionary+TDCore.h
//  TBUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 Qsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (TDCore)

@end

#pragma mark - Accessors
@interface NSDictionary (Accessors)

/**
 *  tb_objectForKey
 *
 *  @param key NSString
 *
 *  @return id
 */
- (id)tb_objectForKey:(NSString *)key;

/**
 *  tb_dictionaryForKey
 *
 *  @param key NSString
 *
 *  @return NSDictionary
 */
- (NSDictionary *)tb_dictionaryForKey:(NSString *)key;

/**
 *  tb_mutableDictionaryForKey
 *
 *  @param key NSString
 *
 *  @return NSMutableDictionary
 */
- (NSMutableDictionary *)tb_mutableDictionaryForKey:(NSString *)key;

/**
 *  tb_arrayForKey
 *
 *  @param key NSString
 *
 *  @return NSArray
 */
- (NSArray *)tb_arrayForKey:(NSString *)key;

/**
 *  tb_mutableArrayForKey
 *
 *  @param key NSString
 *
 *  @return NSMutableArray
 */
- (NSMutableArray *)tb_mutableArrayForKey:(NSString *)key;

/**
 *  tb_stringForKey
 *
 *  @param key NSString
 *
 *  @return NSString
 */
- (NSString *)tb_stringForKey:(NSString *)key;


/**
 *  tb_intForKey
 *
 *  @param key NSString
 *
 *  @return NSInteger
 */
- (NSInteger)tb_intForKey:(NSString *)key;

/**
 *  tb_floatForKey
 *
 *  @param key NSString
 *
 *  @return float
 */
- (float)tb_floatForKey:(NSString *)key;

/**
 *  boolForKey
 *
 *  @param key NSString
 *
 *  @return BOOL
 */
- (BOOL)boolForKey:(NSString *)key;

@end
