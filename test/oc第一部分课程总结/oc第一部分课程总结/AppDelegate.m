//
//  AppDelegate.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/18.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewC1.h"
#import "TableView.h"
#import "ViewController.h"
#import "TableViewTest2FormHierarch_Lee.h"
#import "ocToJs.h"
#import "TableViewController.h"

//属性tableview
#import "LHY_HomeViewController.h"
#import "HomeViewController.h"
#import "Home2ViewController.h"


#import "TestDataViewController.h"
#import "footerTestViewController.h"

#import "DelegateSViewController.h"

#import "GiftSettingViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //self.window.rootViewController = [[TableViewController alloc]initWithNibName:nil bundle:nil];
    
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:[[GiftSettingViewController alloc]init]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    //分栏控制器

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
