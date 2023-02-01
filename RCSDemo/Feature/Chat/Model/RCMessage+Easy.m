//
//  RCMessage+Easy.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/28.
//

#import <objc/runtime.h>

#import "RCMessage+Easy.h"

@implementation RCMessage (Easy)

#pragma mark - RCMessage -

- (id<RCMessage>(^)(RCConversationType value))mConversationType {
    return ^id<RCMessage>(RCConversationType value) {
        self.conversationType = value;
        return self;
    };
}

- (id<RCMessage>(^)(NSString *value))mTargetId {
    return ^id<RCMessage>(NSString *value) {
        self.targetId = value;
        return self;
    };
}

/*!
 所属会话的业务标识，长度限制 20 字符
 */
- (id<RCMessage>(^)(NSString *value))mChannelId {
    return ^id<RCMessage>(NSString *value) {
        self.channelId = value;
        return self;
    };
}

- (id<RCMessage>(^)(RCMessageDirection value))mMessageDirection {
    return ^id<RCMessage>(RCMessageDirection value) {
        self.messageDirection = value;
        return self;
    };
}

/*!
 消息的 ID

 @discussion 本地存储的消息的唯一值（数据库索引唯一值）
 */
- (id<RCMessage>(^)(long value))mMessageId {
    return ^id<RCMessage>(long value) {
        self.messageId = value;
        return self;
    };
}

/*!
 消息的发送者 ID
 */
- (id<RCMessage>(^)(NSString *value))mSenderUserId {
    return ^id<RCMessage>(NSString *value) {
        self.senderUserId = value;
        return self;
    };
}

/*!
 消息的发送状态
 */
- (id<RCMessage>(^)(RCSentStatus value))mSentStatus {
    return ^id<RCMessage>(RCSentStatus value) {
        self.sentStatus = value;
        return self;
    };
}

/*!
 消息的发送时间（Unix 时间戳、毫秒）
 */
- (id<RCMessage>(^)(long long value))mSentTime {
    return ^id<RCMessage>(long long value) {
        self.sentTime = value;
        return self;
    };
}

/*!
 消息的附加字段
 */
- (id<RCMessage>(^)(NSString *value))mExtra {
    return ^id<RCMessage>(NSString *value) {
        self.extra = value;
        return self;
    };
}

/*!
 消息推送配置
 */
- (id<RCMessage>(^)(RCMessagePushConfig *value))mMessagePushConfig {
    return ^id<RCMessage>(RCMessagePushConfig *value) {
        self.messagePushConfig = value;
        return self;
    };
}

/*!
 消息是否可以包含扩展信息
 
 @discussion 该属性在消息发送时确定，发送之后不能再做修改
 @discussion 扩展信息只支持单聊和群组，其它会话类型不能设置扩展信息
*/
- (id<RCMessage>(^)(BOOL value))mCanIncludeExpansion {
    return ^id<RCMessage>(BOOL value) {
        self.canIncludeExpansion = value;
        return self;
    };
}

/*!
 消息扩展信息列表
 
 @discussion 扩展信息只支持单聊和群组，其它会话类型不能设置扩展信息
 @discussion 默认消息扩展字典 key 长度不超过 32 ，value 长度不超过 4096 ，单次设置扩展数量最大为 20，消息的扩展总数不能超过 300
*/
- (id<RCMessage>(^)(NSDictionary<NSString *, NSString *> *value))mExpansionDic {
    return ^id<RCMessage>(NSDictionary<NSString *, NSString *> *value) {
        self.expansionDic = value;
        return self;
    };
}

/*!
 所属会话的业务标识，长度限制 20 字符
 */
- (id<RCMessage>(^)(NSString *value))mPushContent {
    return ^id<RCMessage>(NSString *value) {
        self.messagePushConfig.pushContent = value;
        return self;
    };
}

/*!
 所属会话的业务标识，长度限制 20 字符
 */
- (id<RCMessage>(^)(NSString *value))mPushData {
    return ^id<RCMessage>(NSString *value) {
        self.messagePushConfig.pushData = value;
        return self;
    };
}

- (id<RCMessage>(^)(BOOL value))mDisableNotification {
    return ^id<RCMessage>(BOOL value) {
        self.messageConfig.disableNotification = value;
        return self;
    };
}

- (id<RCMessage>(^)(RCMessageContent *value))mContent {
    return ^id<RCMessage>(RCMessageContent *value) {
        self.content = value;
        return self;
    };
}

- (id<RCMessage>(^)(RCMessageCompletion))send {
    return ^id(RCMessageCompletion completion) {
        [RCCoreClient.sharedCoreClient sendMessage:self pushContent:self.messagePushConfig.pushContent pushData:self.messagePushConfig.pushData successBlock:^(RCMessage *successMessage) {
            !completion?:completion(RC_SUCCESS, successMessage.messageId);
        } errorBlock:^(RCErrorCode nErrorCode, RCMessage *errorMessage) {
            !completion?:completion(nErrorCode, errorMessage.messageId);
        }];
        return self;
    };
}

@end
