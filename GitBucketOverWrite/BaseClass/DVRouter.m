//
//  DVRouter.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/12.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVRouter.h"
#import "DVViewController.h"
@interface DVRouter()
@property(nonatomic, strong) NSDictionary *mapDict;


@end

@implementation DVRouter

+(instancetype)shareInstance {
    static DVRouter *router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[DVRouter alloc]init];
    });
    return router;
}
-(DVViewController *)getViewControllerWithModel:(DVViewModel *)viewModel {
    NSString *viewModelKey = NSStringFromClass([viewModel class]);
   NSString *viewControllerStr =  [self.mapDict existObjectForkey:viewModelKey];
    NSAssert(viewControllerStr.length, @"DVRouter没有映射到匹配的viewcontroller");
    return [(DVViewController*)[NSClassFromString(viewControllerStr) alloc]initWithModel:viewModel];
}


-(NSDictionary *)mapDict {
    if (_mapDict == nil) {
        _mapDict = @{
                     @"DVLoginViewModel"  : @"LoginViewController",
                     @""  : @"",
                     @""  : @"",
                     @""  : @"",
                     @""  : @"",
                     @""  : @"",
                     
                     
                     };
    
    }
    return _mapDict;
}

@end
