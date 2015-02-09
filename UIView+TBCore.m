//
//  UIView+TBCore.m
//  ktv516
//
//  Created by thuydd on 2/9/15.
//  Copyright (c) 2015 QsoftVietNam. All rights reserved.
//

#import "UIView+TBCore.h"

@implementation UIView (TBCore)

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Event

static const void *UITapGestureRecognizerBlockVoid                   = &UITapGestureRecognizerBlockVoid;

@implementation UIView (Event)

#pragma mark - Setter & Getter

- (UITapGestureRecognizerBlock)tapGestureRecognizerBlock
{
    return objc_getAssociatedObject(self, UITapGestureRecognizerBlockVoid);
}

- (void)setTapGestureRecognizerBlock:(UITapGestureRecognizerBlock)tapGestureRecognizerBlock
{
    objc_setAssociatedObject(self, UITapGestureRecognizerBlockVoid, tapGestureRecognizerBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)addHandleTapBlock:(UITapGestureRecognizerBlock)block
{
    self.tapGestureRecognizerBlock = block;
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:(id)self action:@selector(UITapGestureRecognizerBlockVoid:)]];
}

#pragma mark - handleTap

- (void)UITapGestureRecognizerBlockVoid:(UITapGestureRecognizer *)sender
{
    self.tapGestureRecognizerBlock(sender);
}

@end
