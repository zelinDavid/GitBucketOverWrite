//
//  DVRouter.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/12.
//  Copyright © 2017年 David. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DVViewModel;
@class DVViewController;


@interface DVRouter : NSObject

+(instancetype)shareInstance;

-(DVViewController *)getViewControllerWithModel:(DVViewModel *)viewModel;


@end
