//
//  DVViewModelServiceImp.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/12.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVViewModelServiceImp.h"
#import "MRCRepositoryServiceImpl.h"

@implementation DVViewModelServiceImp

@synthesize client = _client;
@synthesize repositoryService = _repositoryService;


-(instancetype)init {
    if (self = [super init ]) {
        _repositoryService = [[MRCRepositoryServiceImpl alloc]init];
        
    }
    return self;
}

-(void)pushViewModel:(DVViewModel *)viewModel animated:(BOOL)animated{}
-(void)popViewModelAnimated:(BOOL)animated{}
-(void)presentViewModel:(DVViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion{}
-(void)popToRootViewModelAnimated:(BOOL)animated {}


@end
