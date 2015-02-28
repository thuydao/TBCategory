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
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *devToken = [UIResponder getFromUserDefaultWithKey:@"DEVICE_TOKEN"];
    if (!devToken) {
        return @"";
    }
    else return devToken;
}

#pragma mark - Origin
- (void)saveToUserDefaultWithData:(id )data withKey:(NSString *)key
{
    // P D
    NSData *dtSave = [NSKeyedArchiver archivedDataWithRootObject:data];
    
    // Save
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:dtSave forKey:key];
    [userDefault synchronize];
}

+ (id)getFromUserDefaultWithKey:(NSString *)key
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    if ( [[userDefault dictionaryRepresentation].allKeys containsObject:key] )
    {
        NSData *dtGet = [NSKeyedUnarchiver unarchiveObjectWithData:[userDefault objectForKey:key]];
        
        return dtGet;
    }
    
    return nil;
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
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    [ud setObject:deviceToken forKey:@"DEVICE_TOKEN"];
//    [ud synchronize];
    
    [self saveToUserDefaultWithData:devToken withKey:@"DEVICE_TOKEN"];
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
