//
//  RCCoreClient+keepalive.h
//  SealTalk
//
//  Created by chinaspx on 2022/9/14.
//  Copyright © 2022 RongCloud. All rights reserved.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCCoreClient (keepalive)
/**
 keepAlive
 */

@property (nonatomic, assign) BOOL forceKeepAlive;

@end

NS_ASSUME_NONNULL_END
