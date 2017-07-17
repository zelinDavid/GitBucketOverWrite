//
//  DVViewModel.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/12.
//  Copyright © 2017年 David. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DVViewModelService;

typedef NS_ENUM(NSUInteger,TitleViewType) {
    TitleViewTypeDefault,
    TitleViewTypeDoubleTitle,
    TitleViewTypeLoadingTitle
};


@interface DVViewModel : NSObject

@property(nonatomic, strong,readonly) id<DVViewModelService> service;

@property (nonatomic, assign,readonly)TitleViewType viewType;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subTitle;

@property(nonatomic, copy) VoidBlock_id callBack;


@property (nonatomic, assign)BOOL shouldFetchLocalDataOnViewModel;
@property (nonatomic, assign)BOOL shoudldRequestRemoteDataOnViewModel;
@property(nonatomic, strong) RACCommand *remoteRequestCommand;
@property (nonatomic, assign)NSInteger page;
@property (nonatomic, assign)NSInteger perPage;

@property(nonatomic, strong,readonly) RACSubject *errorSignal;
@property(nonatomic, strong,readonly) RACSubject *willDisappearSignal;
@property (nonatomic, copy, readonly) NSDictionary *params;


-(instancetype)initWithServices:(id<DVViewModelService>)service params:(NSDictionary *)param ;

-(void)customInitialize;

-(RACSignal *)remoteRequestLoading:(NSNumber *)page ;



@end
