//
//  AppDelegate.m
//  TigerFinace
//
//  Created by mooner on 16/7/21.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "AppDelegate.h"
#import "CommonNavigationController.h"
#import "FeatureViewController.h"
#import "ItemViewController.h"
#import "MineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [self createRootViewController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UITabBarController *)createRootViewController {
    
    FeatureViewController *featureViewController = [[FeatureViewController alloc] init];
    featureViewController.title = @"精选";
    featureViewController.tabBarItem.image = [UIImage imageNamed:@"feature"];
    CommonNavigationController *navFeature = [[CommonNavigationController alloc] initWithRootViewController:featureViewController];
    
    ItemViewController *itemViewController = [[ItemViewController alloc] init];
    itemViewController.title = @"项目";
    itemViewController.tabBarItem.image = [UIImage imageNamed:@"item"];
    CommonNavigationController *navItem = [[CommonNavigationController alloc] initWithRootViewController:itemViewController];
    
    MineViewController *mineViewController = [[MineViewController alloc] init];
    mineViewController.title = @"我的";
    mineViewController.tabBarItem.image = [UIImage imageNamed:@"mine"];
    CommonNavigationController *navMine = [[CommonNavigationController alloc] initWithRootViewController:mineViewController];
    
    UITabBarController *tabBarViewController = [[UITabBarController alloc] init];
    tabBarViewController.viewControllers = @[navFeature,navItem,navMine];
    tabBarViewController.tabBar.tintColor = [UIColor redColor];
    return tabBarViewController;
    
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
