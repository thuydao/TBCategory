//
//  UIResponder+TBPushNotification.h
//  ktv516
//
//  Created by thuydd on 2/24/15.
//  Copyright (c) 2015 QsoftVietNam. All rights reserved.
//

#import <UIKit/UIKit.h>


#define tokenDevice [UIResponder tb_getDeviceToken]

@interface UIResponder (TBPushNotification)

/**
 *  tb_registerPushNotification
 */
- (void)tb_registerPushNotification;

/**
 *  tb_getDeviceToken
 *
 *  @return NSString
 */
+ (NSString *)tb_getDeviceToken;

@end
