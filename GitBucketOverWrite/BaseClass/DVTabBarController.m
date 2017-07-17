//
//  DVTabBarController.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/14.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVTabBarController.h"

@interface DVTabBarController ()
@property(nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation DVTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tabBarController = [[UITabBarController alloc]init];
    
    [self addChildViewController:_tabBarController];
    [self.view addSubview:self.tabBarController.view];
    _tabBarController.tabBar.translucent = NO;
    
    _tabBarController.tabBar.backgroundColor = [UIColor grayColor];

}


- (BOOL)shouldAutorotate {
    return self.tabBarController.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.tabBarController.selectedViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.tabBarController.selectedViewController.preferredStatusBarStyle;
}


@end
