//
//  DVLoginViewModel.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/13.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVViewModel.h"

@interface DVLoginViewModel : DVViewModel
@property(nonatomic, copy) NSString*user;
@property(nonatomic, copy) NSString *password;

@property(nonatomic, strong) RACCommand *loginCommand;
@property(nonatomic, strong) RACSignal *signInBtnEnabledSiganl;
 

@end
