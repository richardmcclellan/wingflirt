//
//  AppDelegate.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize navController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    ListViewController *listVC = [[ListViewController alloc] init];
    self.navController = [[UINavigationController alloc] initWithRootViewController:listVC];
    [self.navController.navigationBar setTintColor:[WFStyle bgColor]];
    [self.navController.view setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight];
    [self.window addSubview:self.navController.view];
    [self.window makeKeyAndVisible];
    
    [Parse setApplicationId:@"4WwI8h61F4R0MFqgDCqTd4syrkprrnmpXxaGFtL6" clientKey:@"BlW9Lm7GdLDSuSTy1zrMAQ01653hxMBzgIAiEjKt"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    return YES;
}


#pragma mark - Application's Documents directory

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
