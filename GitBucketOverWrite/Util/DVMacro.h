//
//  Macro.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/11.
//  Copyright © 2017年 David. All rights reserved.
//

#ifndef DVMacro_h
#define DVMacro_h

///------
/// NSLog
///------

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

///------
/// Block
///------

typedef void (^VoidBlock)();
typedef BOOL (^BoolBlock)();
typedef int  (^IntBlock) ();
typedef id   (^IDBlock)  ();

typedef void (^VoidBlock_int)(int);
typedef BOOL (^BoolBlock_int)(int);
typedef int  (^IntBlock_int) (int);
typedef id   (^IDBlock_int)  (int);

typedef void (^VoidBlock_string)(NSString *);
typedef BOOL (^BoolBlock_string)(NSString *);
typedef int  (^IntBlock_string) (NSString *);
typedef id   (^IDBlock_string)  (NSString *);

typedef void (^VoidBlock_id)(id);
typedef BOOL (^BoolBlock_id)(id);
typedef int  (^IntBlock_id) (id);
typedef id   (^IDBlock_id)  (id);


///------
/// color
///------
#define DefaultTintColor                     RGBFromHex(0x18baf2)
#define DefaultBackGroundColor               RGBFromHex(0x00c6f6)
#define DefaultTextColor                     RGBFromHex(0x333333)
#define DefaultTableViewColor                RGBFromHex(0xefeff4)
#define      ColorFromRGB(R,G,B,A)    [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A/1.0]


/**<   iphone */
#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640.0f, 1136.0f), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750.0f, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242.0f, 2208.0f), [[UIScreen mainScreen] currentMode].size) : NO)

/**<   尺寸 */
#define IPHONE_WIDTH         [UIScreen mainScreen].bounds.size.width
#define IPHONE_HEIGHT        [UIScreen mainScreen].bounds.size.height

#define LEFTMENU_WIDTH       FitFloat(265)

#define UI_WINDOW            [UIApplication sharedApplication].keyWindow

#define UI_WIDTH             [UIScreen mainScreen].bounds.size.width
#define UI_HEIGHT            ([UIScreen mainScreen].bounds.size.height - kNavBarHeight)
#define TRUE_HEIGHT          ([UIScreen mainScreen].bounds.size.height - kNavBarHeight - kTabbarHeight)
#define UI_CenterX             [UIScreen mainScreen].bounds.size.width*0.5
#define UI_CenterY             UI_HEIGHT*0.5

#define kNavBarHeight        64
#define kStatusHeight        20
#define kTabbarHeight        49


///------------
/// AppDelegate
///------------

#define DVSharedAppDelegate ((MRCAppDelegate *)[UIApplication sharedApplication].delegate)

///----------------------
/// Persistence Directory
///----------------------
#define MRC_DOCUMENT_DIRECTORY NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject















#endif /* DVMacro_h */
