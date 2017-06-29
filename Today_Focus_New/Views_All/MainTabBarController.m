//
//  MainTabBarController.m
//  Today_Focus_New
//
//  Created by Derek on 2017/4/26.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import "MainTabBarController.h"
//#import "NewsViewController.h"
//#import "VideoViewController.h"
//#import "ChatViewController.h"
//#import "MyHomeViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //tabbar默认颜色
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:41/255.0 green:160/255.0 blue:42/255.0 alpha:1],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    //tabbar选择后的颜色
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
