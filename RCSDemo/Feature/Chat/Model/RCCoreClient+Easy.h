//
//  RCCoreClient+Easy.h
//  RCSDemo
//
//  Created by shuai shao on 2023/1/28.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RCMessageSendOption, RCMessageLocalOption;

@interface RCCoreClient (Easy)

- (void)sendMessage:(void(^)(id<RCMessageSendOption> option))optionBlock
         completion:(void(^)(RCErrorCode code, long mId))completion;

- (NSArray *)getHistoryMessages:(void(^)(id<RCMessageLocalOption> option))optionBlock;

@end

@protocol RCMessageSendOption <NSObject>

- (id<RCMessageSendOption>(^)(RCMessageContent *))mContent;

- (id<RCMessageSendOption>(^)(RCConversationType))mType;

- (id<RCMessageSendOption>(^)(NSString *))mTargetId;

- (id<RCMessageSendOption>(^)(NSString *))mChannelId;

- (id<RCMessageSendOption>(^)(NSString *))mPushContent;

- (id<RCMessageSendOption>(^)(NSString *))mPushData;

- (id<RCMessageSendOption>(^)(void(^)(RCMessage *message)))mAttached;

- (id<RCMessageSendOption>(^)(BOOL))mIsVoIPPush;

@end

@protocol RCMessageLocalOption <NSObject>

- (id<RCMessageLocalOption>(^)(RCConversationType))mType;

- (id<RCMessageLocalOption>(^)(NSString *))mTargetId;

- (id<RCMessageLocalOption>(^)(NSString *))mChannelId;

- (id<RCMessageLocalOption>(^)(NSString *))mObjectName;

- (id<RCMessageLocalOption>(^)(long))mBaseMessageId;

- (id<RCMessageLocalOption>(^)(BOOL))mIsForward;

- (id<RCMessageLocalOption>(^)(int))mCount;

@end

NS_ASSUME_NONNULL_END
