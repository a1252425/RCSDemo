//
//  RCSHomeItemPrivateUser.m
//  RCSDemo
//
//  Created by shuai shao on 2023/4/18.
//

#import "RCSHomeItem.h"
#import "RCSChatViewController.h"
#import "RCSHomeItemPrivateUser.h"

@interface RCSHomeItemPrivateUser () <RCSHomeItem>

@end

@implementation RCSHomeItemPrivateUser

+ (void)load {
    [[RCSHomeItem shared] registerClass:[self class]];
}

+ (NSInteger)index {
    return 10007;
}

- (NSString *)title {
    return @"tree";
}

- (NSString *)identifier {
    return kNormalCellIdentifier;
}

- (void)performActionWithSender:(nullable id)sender {
    if (![sender isKindOfClass:[UIViewController class]]) return;
    UIViewController *controller = (UIViewController *)sender;
    RCSChatViewController *chat = [[RCSChatViewController alloc] initWithConversationType:ConversationType_PRIVATE targetId:@"tree"];
    [controller.navigationController pushViewController:chat animated:YES];
    dispatch_async(dispatch_get_main_queue(), ^{ chat.title = [self title]; });
}

@end
