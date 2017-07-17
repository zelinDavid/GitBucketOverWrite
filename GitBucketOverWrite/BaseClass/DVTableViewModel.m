//
//  DVTableViewModel.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/17.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVTableViewModel.h"

@interface DVTableViewModel  ()
@property(nonatomic, strong) NSArray *dataSource;
@property(nonatomic, strong) RACCommand *clickLinkCommand;

@end

@implementation DVTableViewModel

-(void)customInitialize {
    [super customInitialize];
    [self.remoteRequestCommand.executionSignals subscribeNext:^(NSArray *dataSource) {
        self.dataSource = dataSource;
    }];
    
//    _clickLinkCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(NSURL *url) {
//        
//    }];
    
}






@end
