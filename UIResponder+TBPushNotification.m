//
//  UIResponder+TBPushNotification.m
//  ktv516
//
//  Created by thuydd on 2/24/15.
//  Copyright (c) 2015 QsoftVietNam. All rights reserved.
//

#import "UIResponder+TBPushNotification.h"

@implementation UIResponder (TBPushNotification)

/**
 *  tb_registerPushNotification
 */
- (void)tb_registerPushNotification
{
    TDLOG(@"registerForPushNotification");
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0 //__IPHONE_8_0 is not defined in old xcode (==0). Then use 80000
        
        TDLOG(@"registerForPushNotification: For iOS >= 8.0");
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:
         [UIUserNotificationSettings settingsForTypes:
          (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
                                           categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
#endif
    } else {
        TDLOG(@"registerForPushNotification: For iOS < 8.0");
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    }

}

/**
 *  tb_getDeviceToken
 *
 *  @return NSString
 */
+ (NSString *)tb_getDeviceToken
{
    NSString *tb_TokenDevice = [[NSUserDefaults standardUserDefaults] objectForKey:@"token_Device"];
    if (!tb_TokenDevice) {
        return @"";
    }
    else return tb_TokenDevice;
}


#pragma mark - overwrite
/**
 *  application
 *
 *  @param app         UIApplication
 *  @param deviceToken NSData
 */
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    // Prepare the Device Token for Registration (remove spaces and < >)
    NSString *devToken = [[[[deviceToken description]
                            stringByReplacingOccurrencesOfString:@"<"withString:@""]
                           stringByReplacingOccurrencesOfString:@">" withString:@""]
                          stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    TDLOG(@"device token - %@",devToken);
    [[NSUserDefaults standardUserDefaults] setValue:deviceToken forKey:@"token_Device"];
}

/**
 *  application
 *
 *  @param app   UIApplication
 *  @param error NSError
 */
- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    TDLOG(@"Failed to get token, error: %@", error);
}


/**
 *  application
 *
 *  @param application UIApplication
 *  @param userInfo    NSDictionary
 */
- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo
{

    TDLOG(@"Received notification: %@", userInfo);
    
    // TODO: post when have notification
    if ( [application applicationState] == UIApplicationStateActive )
    {
//        [BaseViewController postNotificationCenterHavePushNotificationActive:userInfo];
    }
    else
    {
//        [BaseViewController postNotificationCenterHavePushNotification];
    }
}


@end
