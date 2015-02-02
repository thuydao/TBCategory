//
//  UIImageView+TBCore.m
//  ktv516
//
//  Created by thuydd on 2/2/15.
//  Copyright (c) 2015 QsoftVietNam. All rights reserved.
//

#import "UIImageView+TBCore.h"

@implementation UIImageView (TBCore)

@end

@implementation UIImageView (avatar)

/**
 *  setCircle
 */
- (void)setCircle
{
    CGFloat x = MIN(self.frame.size.height, self.frame.size.width);
    CGRect frame = self.frame;
    frame.size.width = x;
    frame.size.height = x;
    [self setFrame:frame];
    
    //set circle
    self.clipsToBounds=YES;
    self.layer.cornerRadius = x/2;
}

@end
