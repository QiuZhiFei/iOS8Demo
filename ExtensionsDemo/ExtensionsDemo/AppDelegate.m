//
//  AppDelegate.m
//  ExtensionsDemo
//
//  Created by clee on 14-7-8.
//  Copyright (c) 2014年 clee. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@", [launchOptions description]);
    // Override point for customization after application launch.
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    category.identifier = @"111";
    UIMutableUserNotificationAction *action1 = [UIMutableUserNotificationAction new];
    action1.title = @"接受";
    action1.identifier = @"aa";
    
    UIMutableUserNotificationAction *action2 = [UIMutableUserNotificationAction new];
    action2.title = @"取消";
    action2.identifier = @"bb";
    
    UIMutableUserNotificationAction *action3 = [UIMutableUserNotificationAction new];
    action3.title = @"取消2";
    action3.identifier = @"cc";
    
    UIMutableUserNotificationAction *action4 = [UIMutableUserNotificationAction new];
    action4.title = @"取消3";
    action4.identifier = @"dd";
    
    [category setActions:@[action1, action2, action3, action4] forContext:UIUserNotificationActionContextDefault];
    UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                            settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert
                                                 categories:[NSSet setWithObject:category]];
    [application registerUserNotificationSettings:settings];
//    [application registerForRemoteNotifications];
    
//    [application unregisterForRemoteNotifications];

    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    localNotification.alertBody = @"this is local notification";
    localNotification.category = @"111";
    [application scheduleLocalNotification:localNotification];
    
    NSLog(@"++++++++++++++++++++++++didFinishLaunchingWithOptions");

    return YES;
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{

}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"FailToRegister error: %@",error);
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token = [deviceToken description];

}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler {
    
    ViewController *vc = (ViewController *)self.window.rootViewController;
    if ([identifier isEqualToString:@"aa"]) {
        vc.tfContent.text = @"你选择了接受";
    } else {
        vc.tfContent.text = @"你选择了取消";
    }
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    NSLog(@"++++++++++++++++++++++++sourceApplication");

    NSString *ss = [[url absoluteString] stringByReplacingOccurrencesOfString:@"demo123://"
                                                                   withString:@""];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"change" object:ss];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
