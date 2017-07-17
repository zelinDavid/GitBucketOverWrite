//
//  DVViewController.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/12.
//  Copyright © 2017年 David. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  DVViewModelService;

@interface DVViewController : UIViewController
@property(nonatomic, strong,readonly) DVViewModel *viewModel;


-(instancetype)initWithModel:(DVViewModel *)viewModel ;

-(void)customInit ;
-(void)bindViewModel ;


@end
