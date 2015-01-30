//
//  NSArray+TBCore.h
//  TBUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 Qsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSArray (TBCore)

@end

#pragma mark - alloc
@interface NSArray (alloc)

/**
 *  tb_withArary
 *
 *  @param anArray NSArray
 *
 *  @return NSArray
 */
+ (NSArray *)tb_withArary:(NSArray *)anArray;

@end

#pragma mark - Validate

@interface NSArray (Validate)

/**
 *  tb_isEmpty
 *
 *  @return BOOL
 */
- (BOOL)tb_isEmpty;

/**
 *  tb_containClass
 *
 *  @param aClass Class
 *
 *  @return BOOL
 */
- (BOOL)tb_containClass:(Class)aClass;

/**
 *  tb_containObject
 *
 *  @param anObject id
 *
 *  @return BOOL
 */
- (BOOL)tb_containObject:(id)anObject;

@end

#pragma mark - Accessors

@interface NSArray (Accessors)


/**
 *  tb_objectAtIndex
 *
 *  @param index NSUInteger
 *
 *  @return id
 */
- (id)tb_objectAtIndex:(NSUInteger)index;

/**
 *  tb_firstObject
 *
 *  @return id
 */
- (id)tb_firstObject;

/**
 *  tb_lastObject
 *
 *  @return id
 */
- (id)tb_lastObject;

/**
 *  tb_indexOfObject
 *
 *  @param anObject id
 *
 *  @return NSInteger
 */
- (NSInteger)tb_indexOfObject:(id)anObject;

/**
 *  tb_objectOfClass
 *
 *  @param aClass Class
 *
 *  @return id
 */
- (id)tb_objectOfClass:(Class)aClass;


@end