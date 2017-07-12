//
//  DVTool.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/11.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVTool.h"


inline CGFloat FitFloat(CGFloat f){
    if (IPHONE5) {
        f = f /375 * 320;
    }
    if (iPhone6Plus) {
        f = f /375 * 414;
    }
    return f;
}

inline CGFloat FitArray(NSArray *plist)
{
    CGFloat f = 0.0f;
    
    if (plist.count) {
        switch (plist.count) {
                case 1:
            {
                f = [[plist firstObject] floatValue];
            }
                break;
                case 2:
            {
                f = [[plist firstObject] floatValue];
                f = iPhone6Plus? [plist[1] floatValue]:f;
            }
                break;
                case 3:
            {
                f = iPhone6 ? [plist[1] floatValue]:[plist[0] floatValue];
                f = iPhone6Plus? [plist[2] floatValue]:f;
            }
                break;
            default:
                break;
        }
    }
    
    return f;
}

inline UIFont *FitFont(CGFloat font)
{
    CGFloat f = font - 1;
    
    if (iPhone6) {
        f = font;
    }
    
    if (iPhone6Plus) {
        f = font + 1;
    }
    
    return [UIFont systemFontOfSize:f];
}


#pragma mark -@implementation

@implementation DVTool

#pragma mark - BOOL判断

+(BOOL)isPhoneNumber:(NSString *)str {
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (str.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:str];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:str];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:str];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}

+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}



#pragma mark - UserDefaultsStore
+(id)standardUserDefaultsObjectForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults]objectForKey:key];
}

+(void)standardUserDefaultsSetObject:(id)object forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults]setObject:object forKey: key];
}
+(void)synchronize{
    [[NSUserDefaults standardUserDefaults]synchronize];
}















@end
