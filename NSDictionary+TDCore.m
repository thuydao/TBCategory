//
//  NSDictionary+TDCore.m
//  TBUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 Qsoft. All rights reserved.
//

#import "NSDictionary+TDCore.h"

@implementation NSDictionary (TDCore)

@end

#pragma mark - Accessors
@implementation NSDictionary (Accessors)

/**
 *  tb_objectForKey
 *
 *  @param key NSString
 *
 *  @return id
 */
- (id)tb_objectForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    
    if ( !object || object == NULL || object == [NSNull null] )
    {
        return nil;
    }
    
    return object;
}

/**
 *  tb_dictionaryForKey
 *
 *  @param key NSString
 *
 *  @return NSDictionary
 */
- (NSDictionary *)tb_dictionaryForKey:(NSString *)key
{
    id object = [self tb_objectForKey:key];
    
    if ( object && [object isKindOfClass:[NSDictionary class]] )
    {
        return object;
    }
    
    return [NSDictionary new];
}

/**
 *  tb_mutableDictionaryForKey
 *
 *  @param key NSString
 *
 *  @return NSMutableDictionary
 */
- (NSMutableDictionary *)tb_mutableDictionaryForKey:(NSString *)key
{
    id object = [self tb_objectForKey:key];
    
    if ( object && [object isKindOfClass:[NSDictionary class]] )
    {
        return [[NSMutableDictionary alloc] initWithDictionary:object];
    }
    
    return [NSMutableDictionary new];
}

/**
 *  tb_arrayForKey
 *
 *  @param key NSString
 *
 *  @return NSArray
 */
- (NSArray *)tb_arrayForKey:(NSString *)key
{
    id object = [self tb_objectForKey:key];
    
    if ( object && [object isKindOfClass:[NSArray class]] )
    {
        return object;
    }
    
    return [NSArray new];
}

/**
 *  tb_mutableArrayForKey
 *
 *  @param key NSString
 *
 *  @return NSMutableArray
 */
- (NSMutableArray *)tb_mutableArrayForKey:(NSString *)key
{
    id object = [self tb_objectForKey:key];
    
    if ( object && [object isKindOfClass:[NSArray class]] )
    {
        return [[NSMutableArray alloc] initWithArray:object];
    }
    
    return [NSMutableArray new];
}

/**
 *  tb_stringForKey
 *
 *  @param key NSString
 *
 *  @return NSString
 */
- (NSString *)tb_stringForKey:(NSString *)key
{
    id object = [self tb_objectForKey:key];
    
    if ( [object isKindOfClass:[NSString class]] )
    {
        return object;
    }
    else if ( object )
    {
        return [NSString stringWithFormat:@"%@", object];
    }
    
    return @"";
}


/**
 *  tb_intForKey
 *
 *  @param key NSString
 *
 *  @return NSInteger
 */
- (NSInteger)tb_intForKey:(NSString *)key
{
    id object = [self tb_objectForKey:key];
    
    if ( !object )
    {
        return 0;
    }
    
    return [object intValue];
}

/**
 *  tb_floatForKey
 *
 *  @param key NSString
 *
 *  @return float
 */
- (float)tb_floatForKey:(NSString *)key
{
    id object = [self tb_objectForKey:key];
    
    if ( !object )
    {
        return 0.0f;
    }
    
    return [object floatValue];
}


/**
 *  boolForKey
 *
 *  @param key NSString
 *
 *  @return BOOL
 */
- (BOOL)boolForKey:(NSString *)key
{
    id object = [self tb_objectForKey:key];
    
    if ( !object )
    {
        return NO;
    }
    
    return [object boolValue];
}

@end
