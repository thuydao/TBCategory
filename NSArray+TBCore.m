//
//  NSArray+TBCore.m
//  TBUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 Qsoft. All rights reserved.
//

#import "NSArray+TBCore.h"

@implementation NSArray (TBCore)

@end

#pragma mark - alloc
@implementation NSArray (alloc)

/**
 *  tb_withArary
 *
 *  @param anArray NSArray
 *
 *  @return NSArray
 */
+ (NSArray *)tb_withArary:(NSArray *)anArray
{
    return [[NSArray alloc] initWithArray:anArray];
}

@end


#pragma mark - Validate

@implementation NSArray (Validate)

/**
 *  tb_isEmpty
 *
 *  @return BOOL
 */
- (BOOL)tb_isEmpty
{
    return (self.count == 0);
}

/**
 *  tb_containClass
 *
 *  @param aClass Class
 *
 *  @return BOOL
 */
- (BOOL)tb_containClass:(Class)aClass
{
    for (id object in self) {
        if ( [object isKindOfClass:aClass]) {
            return TRUE;
        }
    }
    return NO;
}


/**
 *  tb_containObject
 *
 *  @param anObject id
 *
 *  @return BOOL
 */
- (BOOL)tb_containObject:(id)anObject
{
    for (id object in self) {
        if ( [object isEqual:anObject]) {
            return TRUE;
        }
    }
    return NO;
}

@end

#pragma mark - Accessors

@implementation NSArray (Accessors)

/**
 *  tb_objectAtIndex
 *
 *  @param index NSUInteger
 *
 *  @return id
 */
- (id)tb_objectAtIndex:(NSUInteger)index
{
    if ( ![self tb_isEmpty] && self.count > index )
    {
        return [self objectAtIndex:index];
    }
    
    return nil;
}

/**
 *  tb_firstObject
 *
 *  @return id
 */
- (id)tb_firstObject
{
    if ( ![self tb_isEmpty] )
    {
        return [self objectAtIndex:0];
    }
    
    return nil;
}

/**
 *  tb_lastObject
 *
 *  @return id
 */
- (id)tb_lastObject
{
    if ( ![self tb_isEmpty] )
    {
        return [self objectAtIndex:self.count - 1];
    }
    
    return nil;
}

/**
 *  tb_indexOfObject
 *
 *  @param anObject id
 *
 *  @return NSInteger
 */
- (NSInteger)tb_indexOfObject:(id)anObject
{
    return [self indexOfObject:anObject];
}

/**
 *  tb_objectOfClass
 *
 *  @param aClass Class
 *
 *  @return id
 */
- (id)tb_objectOfClass:(Class)aClass
{
    for (id anObject in self) {
        if ([anObject isKindOfClass:aClass]) {
            return anObject;
        }
    }
    return nil;
}



@end


