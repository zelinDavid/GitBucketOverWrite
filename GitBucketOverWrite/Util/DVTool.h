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

#pragma mark - BOOL判断
+(BOOL)isPhoneNumber:(NSString *)str;
+ (BOOL) validateEmail:(NSString *)email;
//  字符串中是否含有特殊字符
//+(BOOL)containSpecialCharaterWith:(NSString *)str ;
+(BOOL)isEmailStr:(NSString *)str ;


#pragma mark - UserDefaultsStore
+(id)standardUserDefaultsObjectForKey:(NSString *)key ;
+(void)standardUserDefaultsSetObject:(id)object forKey:(NSString *)key ;
+(void)synchronize;













@end
