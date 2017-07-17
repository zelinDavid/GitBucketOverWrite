//
//  DVTableViewModel.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/17.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVViewModel.h"

@interface DVTableViewModel : DVViewModel

@property(nonatomic, strong,readonly) NSArray *dataSource;
@property(nonatomic, strong) RACCommand *clickLinkCommand;

@end
