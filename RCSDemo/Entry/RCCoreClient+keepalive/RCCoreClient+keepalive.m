//
//  RCCoreClient+keepalive.m
//  SealTalk
//
//  Created by chinaspx on 2022/9/14.
//  Copyright © 2022 RongCloud. All rights reserved.
//

#import "RCCoreClient+keepalive.h"

@interface RCLocalConfiguration : NSObject
+ (instancetype)sharedInstance;
@property (nonatomic, readonly) BOOL forceKeepAlive;
@end

@implementation RCCoreClient (keepalive)

- (void)setForceKeepAlive:(BOOL)forceKeepAlive {
    [[RCLocalConfiguration sharedInstance] setValue:@(forceKeepAlive) forKey:@"forceKeepAlive"];
}

- (BOOL)forceKeepAlive {
    return [RCLocalConfiguration sharedInstance].forceKeepAlive;
}

@end
