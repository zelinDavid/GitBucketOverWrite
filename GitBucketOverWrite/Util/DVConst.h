//
//  DVConst.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/11.
//  Copyright © 2017年 David. All rights reserved.
//

#import <Foundation/Foundation.h>



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


@interface DVConst : NSObject

/**<   个人信息 */
extern NSString const *UserInfoAvatar;
extern NSString const *UserInfoRealname;
extern NSString const *UserInfoBindtel;
extern NSString const *UserInfoEmail;
extern NSString const *UserInfoBinding;
extern NSString const *UserInfoName;
extern NSString const *UserInfoQQ_NickName;
extern NSString const *UserInfoQQ_imageUrl;
extern NSString const *UserInfoWeibo_NickName;
extern NSString const *UserInfoWeibo_imageUrl;
extern NSString const *UserInfoSendEmailVerify;


@end
