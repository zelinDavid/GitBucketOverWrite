//
//  DVViewModel.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/12.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVViewModel.h"

@interface DVViewModel()
@property(nonatomic, strong,readwrite) id<DVViewModelService> service;
@property (nonatomic, assign,readwrite)TitleViewType viewType;
 @property(nonatomic, strong,readwrite) RACSubject *errorSignal;
@property(nonatomic, strong,readwrite) RACSubject *willDisappearSignal;
@property (nonatomic, copy, readwrite) NSDictionary *params;

@end

@implementation DVViewModel

+(instancetype)allocWithZone:(struct _NSZone *)zone {
   DVViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel);
    [[viewModel  rac_signalForSelector:@selector(initWithServices:params:)] subscribeNext:^(id x) {
        @strongify(viewModel);
        [viewModel customInitialize];
    }];
    
     return viewModel;
}

-(instancetype)initWithServices:(id<DVViewModelService>)service params:(NSDictionary *)param {
    if (self = [super init]) {
        _shouldFetchLocalDataOnViewModel = YES;
        _shoudldRequestRemoteDataOnViewModel = YES;
        _title    = [param existObjectForkey:@"title"];
        _service = service;
        _params   = param;
    }
    return self;
}

-(void)customInitialize {

}



-(RACCommand *)remoteRequestCommand {
    if (_remoteRequestCommand == nil) {
        _remoteRequestCommand =  [[RACCommand alloc]initWithSignalBlock:^RACSignal *(NSNumber *page) {
            
            return [[self remoteRequestLoading:page]takeUntil:self.rac_willDeallocSignal];
        }];
    }
    return _remoteRequestCommand;
}


-(RACSignal *)remoteRequestLoading:(NSNumber *)page {
    
    return  [RACSignal empty];
}


//-(void)remoteRequestLoding

-(RACSubject *)errorSignal {
    if (!_errorSignal) {
        _errorSignal = [RACSubject subject];
    }
    return _errorSignal;
}


- (RACSubject *)willDisappearSignal {
    if (!_willDisappearSignal) _willDisappearSignal = [RACSubject subject];
    return _willDisappearSignal;
}



@end
