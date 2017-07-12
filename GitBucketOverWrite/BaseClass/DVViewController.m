//
//  DVViewController.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/12.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVViewController.h"

@interface DVViewController ()
@property(nonatomic, strong,readwrite) DVViewModel *viewModel;

@end

@implementation DVViewController

+(instancetype)allocWithZone:(struct _NSZone *)zone{
   DVViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)]subscribeNext:^(id x) {
        @strongify(viewController)
         [viewController bindViewModel];
    }];
 
    return viewController;
}

-(instancetype)initWithModel:(DVViewModel *)viewModel {
    if (self = [super init]) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    
    
}




-(void)bindViewModel {
    RAC(self,title) = RACObserve(self.viewModel, title);
    
    @weakify(self)
    [self.viewModel.errorSignal subscribeNext:^(NSError *error) {
        @strongify(self)
        
        MRCLogError(error);
        
        if ([error.domain isEqual:OCTClientErrorDomain] && error.code == OCTClientErrorAuthenticationFailed) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:MRC_ALERT_TITLE
                                                                                     message:@"Your authorization has expired, please login again"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                @strongify(self)
                [SSKeychain deleteAccessToken];
                
//                MRCLoginViewModel *loginViewModel = [[MRCLoginViewModel alloc] initWithServices:self.viewModel.services params:nil];
//                [self.viewModel.services resetRootViewModel:loginViewModel];
            }]];
            
            [self presentViewController:alertController animated:YES completion:NULL];
        } else if (error.code != OCTClientErrorTwoFactorAuthenticationOneTimePasswordRequired && error.code != OCTClientErrorConnectionFailed) {
            MRCError(error.localizedDescription);
        }
     }];
    
    //navigationTitleView绑定
    
    
 }


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.viewModel.willDisappearSignal sendNext:nil];
    
}


@end
