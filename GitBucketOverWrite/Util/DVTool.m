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























@end
