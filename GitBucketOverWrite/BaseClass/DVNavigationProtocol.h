//
//  DVNavigationProtocol.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/12.
//  Copyright © 2017年 David. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DVViewModel;

@protocol DVNavigationProtocol <NSObject>

- (void)pushViewModel:(DVViewModel *)viewModel animated:(BOOL)animated;
- (void)popViewModelAnimated:(BOOL)animated;
- (void)popToRootViewModelAnimated:(BOOL)animated;
- (void)presentViewModel:(DVViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion;
- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion ;

- (void)resetRootViewModel:(DVViewModel *)viewModel ;

@end
