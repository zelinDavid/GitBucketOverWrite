//
//  AppDelegate.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/10.
//  Copyright © 2017年 David. All rights reserved.
//

#import "AppDelegate.h"
#import <Appirater/Appirater.h>
#import "DVViewModelServiceImp.h"
#import "DVLoginViewModel.h"

@interface AppDelegate ()
@property(nonatomic, strong) DVViewModelServiceImp *service;
@property(nonatomic, strong) Reachability *reachability;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureFMDB];
    [self configureReachability];
    [self configureAppirater];
    [self configureAppearance];
    [self configureUmengSocial];
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    
    _service = [[DVViewModelServiceImp alloc]init];
    _stack = [[DVNavigationStack alloc]initWithService:_service];
   
    [self.service resetRootViewModel:[self getTheOriganViewModel]];
    [self.window makeKeyAndVisible];
    
    
    // Save the application version info.
    [[NSUserDefaults standardUserDefaults] setValue:MRC_APP_VERSION forKey:MRCApplicationVersionKey];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    
    
    return YES;
}



- (DVViewModel *)getTheOriganViewModel {
//    if ([SSKeychain rawLogin].isExist && [SSKeychain accessToken].isExist) {
//        // Some OctoKit APIs will use the `login` property of `OCTUser`.
//        OCTUser *user = [OCTUser mrc_userWithRawLogin:[SSKeychain rawLogin] server:OCTServer.dotComServer];
//        
//        OCTClient *authenticatedClient = [OCTClient authenticatedClientWithUser:user token:[SSKeychain accessToken]];
//        self.service.client = authenticatedClient;
//        
//        return  [[DVViewModel alloc]init];
////        return [[MRCHomepageViewModel alloc] initWithServices:self.services params:nil];
//    } else {
//        return (DVViewModel *)[[DVLoginViewModel alloc] initWithServices:self.service params:nil];
//
//    }

    return (DVViewModel *)[[DVLoginViewModel alloc] initWithServices:self.service params:nil];

}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([url.scheme isEqual:MRC_URL_SCHEME]) {
        [OCTClient completeSignInWithCallbackURL:url];
        return YES;
    }
    return [UMSocialSnsService handleOpenURL:url];
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
    
    RAC(self, networkStatus) = [[[[[NSNotificationCenter defaultCenter]
                                   rac_addObserverForName:kReachabilityChangedNotification object:nil]
                                  map:^(NSNotification *notification) {
                                      return @([notification.object currentReachabilityStatus]);
                                  }]
                                 startWith:@(self.reachability.currentReachabilityStatus)]
                                distinctUntilChanged];
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
