//
//  DVAViewModel.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/17.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVAViewModel.h"

@interface DVAViewModel ()
@property (nonatomic, assign, readwrite) BOOL isCurrentUser;


@end

@implementation DVAViewModel


-(void)customInitialize {
    [super customInitialize];
    self.isCurrentUser =  YES;

    self.clickLinkCommand =  [[RACCommand alloc]initWithSignalBlock:^RACSignal *(NSURL *URL) {
        
//        NSString *title = [[[[URL.absoluteString componentsSeparatedByString:@"?"].lastObject componentsSeparatedByString:@"="].lastObject stringByReplacingOccurrencesOfString:@"-" withString:@" "] stringByReplacingOccurrencesOfString:@"@" withString:@"#"];
//        NSLog(@"didClickLinkCommand: %@, title: %@", URL, title);
        
//        if (URL.type == MRCLinkTypeUser) {
//            MRCUserDetailViewModel *viewModel = [[MRCUserDetailViewModel alloc] initWithServices:self.services params:URL.mrc_dictionary];
//            [self.service pushViewModel:viewModel animated:YES];
//        } else if (URL.type == MRCLinkTypeRepository) {
//            MRCRepoDetailViewModel *viewModel = [[MRCRepoDetailViewModel alloc] initWithServices:self.services params:URL.mrc_dictionary];
//            [self.services pushViewModel:viewModel animated:YES];
//        } else {
//            NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//            
//            MRCWebViewModel *viewModel = [[MRCWebViewModel alloc] initWithServices:self.services
//                                                                            params:@{ @"title": title ?: @"",
//                                                                                      @"request": request ?: @"" }];
//            [self.services pushViewModel:viewModel animated:YES];
//        }
        
        NSLog(@"跳转到下一个界面");
        
        return [RACSignal empty];
    }];
}



-(RACSignal *)remoteRequestLoading:(NSNumber *)page {
    
    
    return nil;
 
}




@end
