//
//  DVNavigationStack.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/12.
//  Copyright © 2017年 David. All rights reserved.
//
#import "DVNavigationStack.h"
#import "DVRouter.h"
#import "DVViewModelService.h"
#import "DVNavigationController.h"

 @interface DVNavigationStack()
@property (nonatomic, strong) id<DVViewModelService> services;
@property(nonatomic, strong) NSMutableArray *navigationArr;

@end

@implementation DVNavigationStack

-(instancetype)initWithService:(id<DVViewModelService>)modelService {
    if (self = [super init]) {
        _navigationArr = @[].mutableCopy;
        _services = modelService;
      
        [self registerNavigationHooks];

    }
    return self;
}




-(void)registerNavigationHooks {
    
    WS(weakSelf)
     [[(NSObject *)self.services rac_signalForSelector:@selector(pushViewModel:animated:)]subscribeNext:^(RACTuple *tuple) {
       UIViewController *viewcontroller = (UIViewController *)[[DVRouter shareInstance]getViewControllerWithModel:tuple.first];
         NSAssert(weakSelf.navigationArr.lastObject, @"navigationArr不能为空");
         [(UINavigationController *)weakSelf.navigationArr.lastObject pushViewController:viewcontroller animated:[tuple.second boolValue]];
    }];
    
    [[(NSObject *)self.services rac_signalForSelector:@selector(popViewModelAnimated:)]subscribeNext:^(RACTuple *tuple) {
        [(UINavigationController *)weakSelf.navigationArr.lastObject popViewControllerAnimated:[tuple.first boolValue]];
    }];
    
    [[(NSObject *)self.services rac_signalForSelector:@selector(presentViewModel:animated:completion:)]
    subscribeNext:^(RACTuple *tuple) {
        UIViewController *viewcontroller = (UIViewController *)[[DVRouter shareInstance]getViewControllerWithModel:tuple.first];
        if (![viewcontroller isKindOfClass:[UINavigationController class]]) {
            viewcontroller = [[DVNavigationController alloc]initWithRootViewController:viewcontroller];
         }
        [weakSelf.navigationArr.lastObject presentViewController:viewcontroller animated:[tuple.second isBold] completion:tuple.third];
        [weakSelf.navigationArr addObject:viewcontroller];
        
    }];
    
    [[(NSObject *)self.services rac_signalForSelector:@selector(popToRootViewModelAnimated:)]
        subscribeNext:^(RACTuple *tuple) {
            [(UINavigationController *)weakSelf.navigationArr.lastObject popToRootViewControllerAnimated:tuple.first];
        }];
    
    [[(NSObject *)self.services rac_signalForSelector:@selector(dismissViewModelAnimated:completion:)]
     subscribeNext:^(RACTuple *tuple) {
         [(UINavigationController *)weakSelf.navigationArr.lastObject dismissViewControllerAnimated:[tuple.first boolValue] completion:tuple.second];
         [weakSelf.navigationArr removeLastObject];
     }];

    [[(NSObject *)self.services rac_signalForSelector:@selector(resetRootViewModel:)]
     subscribeNext:^(RACTuple *tuple) {
         UIViewController *viewcontroller = (UIViewController *)[[DVRouter shareInstance]getViewControllerWithModel:tuple.first];
         [weakSelf.navigationArr removeAllObjects];
         
         if (![viewcontroller isKindOfClass:[UINavigationController class]]) {
             viewcontroller = [[DVNavigationController alloc]initWithRootViewController:viewcontroller];
         }
          [weakSelf.navigationArr addObject:viewcontroller];
          MRCSharedAppDelegate.window.rootViewController = viewcontroller;
      }];
 
}


- (void)pushNavigationController:(UINavigationController *)navigationController {
    if ([self.navigationArr containsObject:navigationController]) return;
     [self.navigationArr addObject:navigationController];
}




- (UINavigationController *)popNavigationController {
    UINavigationController *navigationController = self.navigationArr.lastObject;
    [self.navigationArr removeLastObject];
    return navigationController;
}


-(UINavigationController *)topNavigationController {
    
    return self.navigationArr.lastObject;
}



@end
