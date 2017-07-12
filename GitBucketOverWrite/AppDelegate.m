//
//  AppDelegate.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/10.
//  Copyright © 2017年 David. All rights reserved.
//

#import "AppDelegate.h"
#import <Appirater/Appirater.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureFMDB];
    [self configureReachability];
    [self configureAppirater];
    [self configureAppearance];
    [self configureUmengSocial];
    [self configureUmengSocial];
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    
    
    
    
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



#pragma mark  - configuration
-(void)configureFMDB {
    [[FMDatabaseQueue sharedInstance]inDatabase:^(FMDatabase *db) {
        NSString *version = [DVTool standardUserDefaultsObjectForKey:MRCApplicationVersionKey];
        if (![version isEqualToString:MRC_APP_VERSION] && version == nil) {
            [SSKeychain deleteAccessToken];
            
            NSString *path = [[NSBundle mainBundle] pathForResource:@"update_v1_2_0" ofType:@"sql"];
            NSString *sql  = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            
            if (![db executeStatements:sql]) {
                MRCLogLastError(db);
            }
         }
        
     }];
}

-(void)configureAppearance {
    self.window.backgroundColor = [UIColor whiteColor];
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:(48 - 40) / 215.0 green:(67 - 40) / 215.0 blue:(78 - 40) / 215.0 alpha:1];
    [UINavigationBar appearance].barStyle  = UIBarStyleBlack;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    [UISegmentedControl appearance].tintColor = [UIColor whiteColor];
    
    [UITabBar appearance].tintColor = HexRGB(colorI3);
}

- (void)configureKeyboardManager {
    IQKeyboardManager.sharedManager.enableAutoToolbar = NO;
    IQKeyboardManager.sharedManager.shouldResignOnTouchOutside = YES;
}


-(void)configureReachability {
    _reachability = [Reachability reachabilityForInternetConnection];
    RAC(self,reachability) = [[[[NSNotificationCenter defaultCenter]rac_addObserverForName:kReachabilityChangedNotification object:nil] map:^id(NSNotification *notification) {
        
        return @([notification.object currentReachabilityStatus]);
    }]  distinctUntilChanged];
}

-(void)configureUmengSocial {
    [UMSocialData setAppKey:MRC_UM_APP_KEY];
    [UMSocialWechatHandler setWXAppId:MRC_WX_APP_ID appSecret:MRC_WX_APP_SECRET url:MRC_UM_SHARE_URL];
    [UMSocialSinaHandler openSSOWithRedirectURL:MRC_WEIBO_REDIRECT_URL];
    [UMSocialQQHandler setQQWithAppId:MRC_QQ_APP_ID appKey:MRC_QQ_APP_KEY url:MRC_UM_SHARE_URL];
    
    [UMSocialConfig hiddenNotInstallPlatforms:@[ UMShareToQQ, UMShareToQzone, UMShareToWechatSession, UMShareToWechatTimeline ]];


}


- (void)configureAppirater {
    [Appirater setAppId:MRC_APP_ID];
    [Appirater setDaysUntilPrompt:7];
    [Appirater setUsesUntilPrompt:5];
    [Appirater setSignificantEventsUntilPrompt:-1];
    [Appirater setTimeBeforeReminding:2];
    [Appirater setDebug:NO];
    [Appirater appLaunched:YES];
}



@end
