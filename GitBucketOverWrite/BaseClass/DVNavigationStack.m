//
//  DVNavigationStack.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/12.
//  Copyright © 2017年 David. All rights reserved.
//
#import "DVNavigationStack.h"
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
    
    
}

-(void)pushNavigationController:(UINavigationController *)navigationController {
    
    
}

-(UINavigationController *)popNavigationController {
    
    return nil;
}

-(UINavigationController *)topNavigationController {
    
    return nil;
}



@end
