//
//  AppDelegate.m
//  TestTableView
//
//  Created by junzhan on 14-6-29.
//  Copyright (c) 2014年 junzhan. All rights reserved.
//

#import "AppDelegate.h"
#import "TBViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    TBViewController *tbViewController = [[TBViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tbViewController];
    self.window.rootViewController = navController;

    return YES;
}


@end
