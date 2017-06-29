//
//  AppDelegate.m
//  Today_Focus_New
//
//  Created by Derek on 2017/4/24.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "ChatViewController.h"
#import "MyHomeViewController.h"
#import "New_UINavigationController.h"
#import "Video_UINavigationController.h"
#import "Chat_UINavigationController.h"
#import "My_UINavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    MainTabBarController *mainTab=[[MainTabBarController alloc]init];
    

    
    NewsViewController *news=[[NewsViewController alloc]init];
    UINavigationController *news_nav=[[UINavigationController alloc]initWithRootViewController:news];
    
    
    VideoViewController *video=[[VideoViewController alloc]init];
    UINavigationController *video_nav=[[UINavigationController alloc]initWithRootViewController:video];
    
    
    ChatViewController *chat=[[ChatViewController alloc]init];
    UINavigationController *chat_nav=[[UINavigationController alloc]initWithRootViewController:chat];
    
    
    MyHomeViewController *myhome=[[MyHomeViewController alloc]init];
    UINavigationController *my_nav=[[UINavigationController alloc]initWithRootViewController:myhome];
   
    
    UITabBarItem *item0 = [[UITabBarItem alloc]init];
    news.tabBarItem=item0;
    item0.title=@"首页";
    UITabBarItem *item1 = [[UITabBarItem alloc]init];
    video.tabBarItem=item1;
    item1.title=@"视频";
    UITabBarItem *item2 = [[UITabBarItem alloc]init];
    chat.tabBarItem=item2;
    item2.title=@"微讯";
    UITabBarItem *item3 = [[UITabBarItem alloc]init];
    myhome.tabBarItem=item3;
    item3.title=@"我的";
    
    
    // 对item设置相应地图片
    item0.selectedImage = [[UIImage imageNamed:@"news_click.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item0.image = [[UIImage imageNamed:@"news.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item1.selectedImage = [[UIImage imageNamed:@"video_click.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item1.image = [[UIImage imageNamed:@"video.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item2.selectedImage = [[UIImage imageNamed:@"chat_click.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item2.image = [[UIImage imageNamed:@"chat.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item3.selectedImage = [[UIImage imageNamed:@"my_click.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item3.image = [[UIImage imageNamed:@"my.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    mainTab.viewControllers=@[news_nav,video_nav,chat_nav,my_nav];
    self.window.rootViewController=mainTab;
    
    
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Today_Focus_New"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
