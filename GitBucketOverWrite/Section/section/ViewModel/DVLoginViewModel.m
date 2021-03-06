//
//  DVLoginViewModel.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/13.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVLoginViewModel.h"
#import "DVHomeTableBarController.h"

@implementation DVLoginViewModel

-(void)customInitialize {
    [super  customInitialize];
    self.shoudldRequestRemoteDataOnViewModel = NO ;
    self.shouldFetchLocalDataOnViewModel = NO ;
 
    
    _signInBtnEnabledSiganl = [[RACSignal combineLatest:@[RACObserve(self, user),RACObserve(self, password)] reduce:^id(NSString *userstr,NSString *passwordstr){
         return @(userstr.length &&passwordstr.length);
    }]distinctUntilChanged];
    
    [OCTClient setClientID:MRC_CLIENT_ID clientSecret:MRC_CLIENT_SECRET];

    
    @weakify(self)
     void(^logSuccessBlock)(OCTClient *) = ^(OCTClient *authenticatedClient){
        @strongify(self)
        [[MRCMemoryCache sharedInstance] setObject:authenticatedClient.user forKey:@"currentUser"];
        
        
        [authenticatedClient.user mrc_saveOrUpdate];
        [authenticatedClient.user mrc_updateRawLogin]; // The only place to update rawLogin, I hate the logic of rawLogin.
        
        SSKeychain.rawLogin = authenticatedClient.user.rawLogin;
        SSKeychain.password = self.password;
        SSKeychain.accessToken = authenticatedClient.token;
         dispatch_async(dispatch_get_main_queue(), ^{
             DVHomeTableBarController *tabBarController = [[DVHomeTableBarController alloc]init];
             DVSharedAppDelegate.window.rootViewController = tabBarController;
        });
        NSLog(@"登录成功");
    };
    
    _loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(NSString *oneTimePassword) {
        OCTUser *user = [OCTUser userWithRawLogin:self.user server:OCTServer.dotComServer];
        NSLog(@"user--%@  password  %@",self.user,self.password);
        
        return [[OCTClient
                 signInAsUser:user password:self.password oneTimePassword:oneTimePassword scopes:OCTClientAuthorizationScopesUser | OCTClientAuthorizationScopesRepository note:nil noteURL:nil fingerprint:nil]
                doNext:logSuccessBlock];
    }];
    
}





@end
