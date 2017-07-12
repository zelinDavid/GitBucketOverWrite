//
//  NSDictionary+existObjectForkey.m
//  Eye4
//
//  Created by David on 17/5/22.
//
//

#import "NSDictionary+existObjectForkey.h"

@implementation NSDictionary (existObjectForkey)

-(id)existObjectForkey:(NSString *)key {
    NSArray *allkeysArr = self.allKeys;
    if ([allkeysArr containsObject:key]) {
        return [self objectForKey:key];
    }
    return nil;
}
@end
