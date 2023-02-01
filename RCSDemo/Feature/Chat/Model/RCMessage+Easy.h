//
//  RCMessage+Easy.h
//  RCSDemo
//
//  Created by shuai shao on 2023/1/28.
//

#import <RongIMLibCore/RongIMLibCore.h>

typedef void(^RCMessageCompletion)(RCErrorCode code, long mId);

NS_ASSUME_NONNULL_BEGIN

@protocol RCMessage <NSObject>

/*!
 会话类型
 */
- (id<RCMessage>(^)(RCConversationType value))mConversationType;

/*!
 消息的方向
 */
- (id<RCMessage>(^)(RCMessageDirection value))mMessageDirection;

/*!
 会话 ID
 */
- (id<RCMessage>(^)(NSString *value))mTargetId;

/*!
 所属会话的业务标识，长度限制 20 字符
 */
- (id<RCMessage>(^)(NSString *value))mChannelId;

/*!
 消息的 ID

 @discussion 本地存储的消息的唯一值（数据库索引唯一值）
 */
- (id<RCMessage>(^)(long value))mMessageId;

/*!
 消息的发送者 ID
 */
- (id<RCMessage>(^)(NSString *value))mSenderUserId;

/*!
 消息的发送状态
 */
- (id<RCMessage>(^)(RCSentStatus value))mSentStatus;

/*!
 消息的发送时间（Unix 时间戳、毫秒）
 */
- (id<RCMessage>(^)(long long value))mSentTime;

/*!
 消息的附加字段
 */
- (id<RCMessage>(^)(NSString *value))mExtra;

/*!
 消息是否可以包含扩展信息
 
 @discussion 该属性在消息发送时确定，发送之后不能再做修改
 @discussion 扩展信息只支持单聊和群组，其它会话类型不能设置扩展信息
*/
- (id<RCMessage>(^)(BOOL value))mCanIncludeExpansion;

/*!
 消息扩展信息列表
 
 @discussion 扩展信息只支持单聊和群组，其它会话类型不能设置扩展信息
 @discussion 默认消息扩展字典 key 长度不超过 32 ，value 长度不超过 4096 ，单次设置扩展数量最大为 20，消息的扩展总数不能超过 300
*/
- (id<RCMessage>(^)(NSDictionary<NSString *, NSString *> *value))mExpansionDic;

/*!
 所属会话的业务标识，长度限制 20 字符
 */
- (id<RCMessage>(^)(NSString *value))mPushContent;

/*!
 所属会话的业务标识，长度限制 20 字符
 */
- (id<RCMessage>(^)(NSString *value))mPushData;

/*!
 消息推送配置
 */
- (id<RCMessage>(^)(RCMessagePushConfig *value))mMessagePushConfig;

/*!
 是否关闭通知
 YES: 关闭通知（不发送通知）
 NO: 不关闭通知（发送通知）
 默认 NO
 */
- (id<RCMessage>(^)(BOOL value))mDisableNotification;

/*!
 消息的内容
 */
- (id<RCMessage>(^)(RCMessageContent *value))mContent;

/// 发送消息
- (id<RCMessage>(^)(RCMessageCompletion))send;

@end

@interface RCMessage (Easy) <RCMessage>

@end

NS_ASSUME_NONNULL_END
