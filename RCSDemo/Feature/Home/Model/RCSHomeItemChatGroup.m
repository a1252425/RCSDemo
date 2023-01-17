//
//  RCSHomeItemChatGroup.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "RCSHomeItem.h"
#import "RCSHomeItemChatGroup.h"
#import "RCSConversationViewController.h"

@interface RCSHomeItemChatGroup () <RCSHomeItemProtocol>

@end

@implementation RCSHomeItemChatGroup

+ (void)load {
//    [[RCSHomeItem shared] registerClass:[self class]];
}

+ (NSInteger)index {
    return 10002;
}

- (NSString *)title {
    return @"群聊";
}

- (NSString *)identifier {
    return kNormalCellIdentifier;
}

- (void)performActionWithSender:(nullable id)sender {
    if (![sender isKindOfClass:[UIViewController class]]) return;
    UIViewController *controller = (UIViewController *)sender;
    RCSConversationViewController *list = [[RCSConversationViewController alloc] initWithDisplayConversationTypes:@[@(ConversationType_GROUP)] collectionConversationType:@[]];
    [controller.navigationController pushViewController:list animated:YES];
    dispatch_async(dispatch_get_main_queue(), ^{ list.title = [self title]; });
}

@end
