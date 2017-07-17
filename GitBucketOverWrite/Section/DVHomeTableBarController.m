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
#import "DVAViewModel.h"


@interface DVHomeTableBarController ()

@end

@implementation DVHomeTableBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    DVAViewModel *aViewModel = [[DVAViewModel alloc]initWithServices:DVSharedAppDelegate.service params:@{@"title":@"dddd"}];
     DVAViewcontroller *aViewController = [[DVAViewcontroller alloc]initWithModel:aViewModel];
    aViewController.navigationItem.title = @"News";
    aViewController.tabBarItem.image  = [[UIImage imageNamed:@"icon-info"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    aViewController.tabBarItem.selectedImage  = [[UIImage imageNamed:@"icon-erro"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     DVNavigationController *navA = [[DVNavigationController alloc]initWithRootViewController:aViewController];
    
    DVBViewController *bViewController = [[DVBViewController alloc]init];
    bViewController.navigationItem.title = @"sssssss";
    bViewController.tabBarItem.image  = [[UIImage imageNamed:@"icon-info"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    bViewController.tabBarItem.selectedImage  = [[UIImage imageNamed:@"icon-erro"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    bViewController.tabBarItem.title = @"Repo";
     DVNavigationController *navB = [[DVNavigationController alloc]initWithRootViewController:bViewController];

    DVCViewController * cViewController = [[DVCViewController alloc]init];
    cViewController.navigationItem.title = @"Find";
    cViewController.tabBarItem.image  = [[UIImage imageNamed:@"icon-info"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    cViewController.tabBarItem.selectedImage  = [[UIImage imageNamed:@"icon-erro"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    cViewController.tabBarItem.title = @"Find";
    DVNavigationController *navC = [[DVNavigationController alloc]initWithRootViewController:cViewController];
    
    DVDViewController * dViewController = [[DVDViewController alloc]init];
    dViewController.navigationItem.title = @"Mine";
    dViewController.tabBarItem.image  = [[UIImage imageNamed:@"icon-info"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    dViewController.tabBarItem.selectedImage  = [[UIImage imageNamed:@"icon-erro"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    dViewController.tabBarItem.title = @"Mine";
    DVNavigationController *navD = [[DVNavigationController alloc]initWithRootViewController:dViewController];
     self.tabBarController.viewControllers = [NSArray arrayWithObjects:navA, navB, navC, navD, nil];

    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
}




@end
