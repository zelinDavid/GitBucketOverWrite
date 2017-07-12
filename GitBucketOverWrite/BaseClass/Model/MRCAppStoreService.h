//
//  MRCAppStoreService.h
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 15/3/6.
//  Copyright (c) 2015年 leichunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MRCAppStoreService <NSObject>

- (RACSignal *)requestAppInfoFromAppStoreWithAppID:(NSString *)appID;

@end
