//
//  AppDelegate.m
//  NotificationDemo
//
//  Created by clee on 14-7-9.
//  Copyright (c) 2014年 clee. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
            
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@", [launchOptions description]);
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    category.identifier = @"c1";
    UIMutableUserNotificationAction *action1 = [UIMutableUserNotificationAction new];
    action1.title = @"接受";
    action1.identifier = @"id1";
    
    UIMutableUserNotificationAction *action2 = [UIMutableUserNotificationAction new];
    action2.title = @"取消";
    action2.identifier = @"id2";
    
    UIMutableUserNotificationAction *action3 = [UIMutableUserNotificationAction new];
    action3.title = @"其他1";
    action3.identifier = @"id3";
    
    UIMutableUserNotificationAction *action4 = [UIMutableUserNotificationAction new];
    action4.title = @"其他2";
    action4.identifier = @"id4";
    
    [category setActions:@[action1, action2, action3, action4] forContext:UIUserNotificationActionContextDefault];
    UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                            settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert
                                            categories:[NSSet setWithObject:category]];
    [application registerUserNotificationSettings:settings];
    [application registerForRemoteNotifications];
    
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    localNotification.alertBody = @"this is local notification";
    localNotification.category = @"c1";
    [application scheduleLocalNotification:localNotification];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    UIUserNotificationType allowedTypes = notificationSettings.types;
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"FailToRegister error: %@",error);
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token = [deviceToken description];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler {
    
    if ([identifier isEqualToString:@"id1"]) {
        // do something
    } else {
        // do other thing
    }
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
}

@end
