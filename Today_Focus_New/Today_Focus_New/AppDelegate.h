//
//  AppDelegate.h
//  Today_Focus_New
//
//  Created by Derek on 2017/4/24.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

