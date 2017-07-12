//
//  DVViewModelService.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/12.
//  Copyright © 2017年 David. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVNavigationProtocol.h"
#import "MRCRepositoryService.h"

@protocol DVViewModelService <NSObject,DVNavigationProtocol>

@property(nonatomic, strong) OCTClient *client;
@property(nonatomic, strong,readonly) id<MRCRepositoryService>repositoryService ;

@end
