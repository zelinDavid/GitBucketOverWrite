//
//  DVTool.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/11.
//  Copyright © 2017年 David. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#pragma mark -适配
FOUNDATION_EXTERN CGFloat FitFloat(CGFloat f);
FOUNDATION_EXTERN CGFloat FitArray(NSArray *plist);
FOUNDATION_EXTERN UIFont *FitFont(CGFloat font);

@interface DVTool : NSObject



+(BOOL)isPhoneNumber:(NSString *)str;





@end
