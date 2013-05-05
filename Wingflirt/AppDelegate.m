//
//  AppDelegate.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "AppDelegate.h"
#import "Message.h"
#import "Comment.h"

@implementation AppDelegate

@synthesize navController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [Message registerSubclass];
    [Comment registerSubclass];
    [Parse setApplicationId:@"4WwI8h61F4R0MFqgDCqTd4syrkprrnmpXxaGFtL6" clientKey:@"BlW9Lm7GdLDSuSTy1zrMAQ01653hxMBzgIAiEjKt"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];    
    
    ListViewController *listVC = [[ListViewController alloc] init];
    self.navController = [[UINavigationController alloc] initWithRootViewController:listVC];
    [self.navController.view setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight];
    [self.navController.navigationBar setTintColor:[WFStyle tintColor]];
    [self.navController.navigationBar setBackgroundImage:[UIImage imageNamed: @"header.png"] forBarMetrics:UIBarMetricsDefault];
    [self.window setRootViewController:self.navController];
    [self.window makeKeyAndVisible];
    
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:newDeviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

#pragma mark - Application's Documents directory

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
