//
//  DVHomeTableBarController.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/14.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVHomeTableBarController.h"
#import "DVAViewcontroller.h"
#import "DVBViewController.h"
#import "DVCViewController.h"
#import "DVDViewController.h"
#import "DVNavigationController.h"


@interface DVHomeTableBarController ()

@end

@implementation DVHomeTableBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    DVAViewcontroller *aViewController = [[DVAViewcontroller alloc]initWithModel:nil];
    aViewController.navigationItem.title = @"News";
    aViewController.tabBarItem.image  = [[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    DVNavigationController *navA = [[DVNavigationController alloc]initWithRootViewController:aViewController];
    
    DVBViewController *bViewController = [[DVBViewController alloc]init];
    bViewController.navigationItem.title = @"b";
    bViewController.tabBarItem.image  = [[UIImage imageNamed:@"UMS_douban_on.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    DVNavigationController *navB = [[DVNavigationController alloc]initWithRootViewController:bViewController];

    DVCViewController * cViewController = [[DVCViewController alloc]init];
    cViewController.navigationItem.title = @"C";
    cViewController.tabBarItem.image  = [[UIImage imageNamed:@"UMS_douban_on.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    DVNavigationController *navC = [[DVNavigationController alloc]initWithRootViewController:cViewController];

    
    DVDViewController * dViewController = [[DVDViewController alloc]init];
    dViewController.navigationItem.title = @"D";
    dViewController.tabBarItem.image  = [[UIImage imageNamed:@"UMS_douban_on.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    DVNavigationController *navD = [[DVNavigationController alloc]initWithRootViewController:dViewController];

    self.viewControllers = [NSArray arrayWithObjects:navA, navB, navC, navD, nil];

}




@end
