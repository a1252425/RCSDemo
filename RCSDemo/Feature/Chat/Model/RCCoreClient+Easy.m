//
//  RCCoreClient+Easy.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/28.
//

#import "RCCoreClient+Easy.h"

@interface RCMessageSendOption : NSObject <RCMessageSendOption>

@property (nonatomic, strong) RCMessageContent *content;

@property (nonatomic, assign) RCConversationType type;

@property (nonatomic, copy) NSString *targetId;

@property (nonatomic, copy) NSString *channelId;

@property (nonatomic, copy) NSString *pushContent;

@property (nonatomic, copy) NSString *pushData;

@property (nonatomic, copy) void(^attached)(RCMessage *message);

@property (nonatomic, assign) BOOL isVoIPPush;

@end

@interface RCMessageLocalOption : NSObject <RCMessageLocalOption>

@property (nonatomic, assign) RCConversationType type;

@property (nonatomic, copy) NSString *targetId;

@property (nonatomic, copy) NSString *channelId;

@property (nonatomic, copy) NSString *objectName;

@property (nonatomic, assign) long baseMessageId;

@property (nonatomic, assign) BOOL isForward;

@property (nonatomic, assign) int count;

@end

@implementation RCCoreClient (Easy)

- (void)sendMessage:(void(^)(id<RCMessageSendOption> option))optionBlock
         completion:(void(^)(RCErrorCode code, long mId))completion {
    RCMessageSendOption *option = [[RCMessageSendOption alloc] init];
    !optionBlock?:optionBlock(option);
    RCSendMessageOption *sendMessageOption = [[RCSendMessageOption alloc] init];
    sendMessageOption.isVoIPPush = option.isVoIPPush;
    [RCCoreClient.sharedCoreClient sendMessage:option.type
                                      targetId:option.targetId
                                       content:option.content
                                   pushContent:option.pushContent
                                      pushData:option.pushData
                                        option:sendMessageOption
                                       success:^(long messageId) {
        dispatch_async(dispatch_get_main_queue(), ^{
            !completion?:completion(RC_SUCCESS, messageId);
        });
    } error:^(RCErrorCode nErrorCode, long messageId) {
        dispatch_async(dispatch_get_main_queue(), ^{
            !completion?:completion(nErrorCode, messageId);
        });
    }];
}

- (NSArray *)getHistoryMessages:(void(^)(id<RCMessageLocalOption>))optionBlock {
    RCMessageLocalOption *option = [[RCMessageLocalOption alloc] init];
    !optionBlock?:optionBlock(option);
    return [RCCoreClient.sharedCoreClient getHistoryMessages:option.type
                                                    targetId:option.targetId
                                                  objectName:option.objectName
                                               baseMessageId:option.baseMessageId
                                                   isForward:option.isForward
                                                       count:option.count];
}

@end

@implementation RCMessageSendOption

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - RCMessageSendOption -

- (id<RCMessageSendOption>(^)(RCMessageContent *))mContent {
    return ^id(RCMessageContent *value) {
        self.content = value;
        return self;
    };
}

- (id<RCMessageSendOption>(^)(RCConversationType))mType {
    return ^id(RCConversationType value) {
        self.type = value;
        return self;
    };
}

- (id<RCMessageSendOption>(^)(NSString *))mTargetId {
    return ^id(NSString *value) {
        self.targetId = value;
        return self;
    };
}

- (id<RCMessageSendOption>(^)(NSString *))mChannelId {
    return ^id(NSString *value) {
        self.channelId = value;
        return self;
    };
}

- (id<RCMessageSendOption>(^)(NSString *))mPushContent {
    return ^id(NSString *value) {
        self.pushContent = value;
        return self;
    };
}

- (id<RCMessageSendOption>(^)(NSString *))mPushData {
    return ^id(NSString *value) {
        self.pushData = value;
        return self;
    };
}

- (id<RCMessageSendOption>(^)(void(^)(RCMessage *message)))mAttached {
    return ^id(void(^value)(RCMessage *)) {
        self.attached = value;
        return self;
    };
}

- (id<RCMessageSendOption>(^)(BOOL))mIsVoIPPush {
    return ^id(BOOL value) {
        self.isVoIPPush = value;
        return self;
    };
}

@end

@implementation RCMessageLocalOption

- (instancetype)init {
    if (self = [super init]) {
        _objectName = @"";
        _channelId = @"";
        _baseMessageId = -1;
        _isForward = YES;
        _count = 0;
    }
    return self;
}

#pragma mark - RCMessageOption -

- (id<RCMessageLocalOption>(^)(RCConversationType))mType {
    return ^id(RCConversationType value) {
        self.type = value;
        return self;
    };
}

- (id<RCMessageLocalOption>(^)(NSString *))mTargetId {
    return ^id(NSString *value) {
        self.targetId = value;
        return self;
    };
}

- (id<RCMessageLocalOption>(^)(NSString *))mChannelId {
    return ^id(NSString *value) {
        self.channelId = value;
        return self;
    };
}

- (id<RCMessageLocalOption>(^)(NSString *))mObjectName {
    return ^id(NSString *value) {
        self.objectName = value;
        return self;
    };
}

- (id<RCMessageLocalOption>(^)(long))mBaseMessageId {
    return ^id(long value) {
        self.baseMessageId = value;
        return self;
    };
}

- (id<RCMessageLocalOption>(^)(BOOL))mIsForward {
    return ^id(BOOL value) {
        self.isForward = value;
        return self;
    };
}

- (id<RCMessageLocalOption> (^)(int))mCount {
    return ^id(int value) {
        self.count = value;
        return self;
    };
}

@end
