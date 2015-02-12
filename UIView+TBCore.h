//
//  UIView+TBCore.h
//  ktv516
//
//  Created by thuydd on 2/9/15.
//  Copyright (c) 2015 QsoftVietNam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIView (TBCore)

- (void)borderWithBorderWidth:(CGFloat )borderWidth withBoderColor:(UIColor *)color withCornerRadius:(CGFloat )cornerRadius andWithMasksToBounds:(BOOL )isMasksToBounds;

@end

//////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Event

typedef void (^UITapGestureRecognizerBlock) (UITapGestureRecognizer *sender);

@interface UIView (Event)

@property (copy, nonatomic) UITapGestureRecognizerBlock tapGestureRecognizerBlock;

- (void)addHandleTapBlock:(UITapGestureRecognizerBlock)block;

@end