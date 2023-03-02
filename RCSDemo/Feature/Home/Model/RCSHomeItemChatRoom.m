//
//  RCSHomeItemChatRoom.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "RCSHomeItem.h"
#import "RCSHomeItemChatRoom.h"
#import "RCSChatViewController.h"

@interface RCSHomeItemChatRoom () <RCSHomeItem>

@end

@implementation RCSHomeItemChatRoom

+ (void)load {
    [[RCSHomeItem shared] registerClass:[self class]];
}

+ (NSInteger)index {
    return 10003;
}

- (NSString *)title {
    return @"聊天室";
}

- (NSString *)identifier {
    return kNormalCellIdentifier;
}

- (void)performActionWithSender:(nullable id)sender {
    if (![sender isKindOfClass:[UIViewController class]]) return;
    UIViewController *controller = (UIViewController *)sender;
    RCSChatViewController *chat = [[RCSChatViewController alloc] initWithConversationType:ConversationType_CHATROOM targetId:@"6"];
    [controller.navigationController pushViewController:chat animated:YES];
    dispatch_async(dispatch_get_main_queue(), ^{ chat.title = [self title]; });
}

@end
