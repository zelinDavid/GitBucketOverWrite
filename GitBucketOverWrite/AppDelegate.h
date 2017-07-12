//
//  AppDelegate.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/10.
//  Copyright © 2017年 David. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Reachability/Reachability.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) Reachability *reachability;


@end

