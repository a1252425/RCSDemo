//
//  RCSHomeItemChat.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "RCSHomeItem.h"
#import "RCSHomeItemChat.h"
#import "RCSConversationViewController.h"

@interface RCSHomeItemChat () <RCSHomeItem>

@end

@implementation RCSHomeItemChat

+ (void)load {
    [[RCSHomeItem shared] registerClass:[self class]];
}

+ (NSInteger)index {
    return 10000;
}

- (NSString *)title {
    return @"会话";
}

- (NSString *)identifier {
    return kNormalCellIdentifier;
}

- (void)performActionWithSender:(nullable id)sender {
    if (![sender isKindOfClass:[UIViewController class]]) return;
    UIViewController *controller = (UIViewController *)sender;
    NSArray *types = @[@(ConversationType_PRIVATE), @(ConversationType_GROUP), @(ConversationType_CHATROOM)];
    RCSConversationViewController *list = [[RCSConversationViewController alloc] initWithDisplayConversationTypes:types collectionConversationType:@[]];
    [controller.navigationController pushViewController:list animated:YES];
    dispatch_async(dispatch_get_main_queue(), ^{ list.title = [self title]; });
}

@end
