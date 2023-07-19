//
//  RCSChatsViewController.m
//  TestFramework
//
//  Created by shaoshuai on 2022/12/8.
//

#import "RCSChatsViewController+Test.h"

#import "RCSChatViewController.h"

@interface RCSChatsViewController ()

@end

@implementation RCSChatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self activeActions];
}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath {
    if (self.navigationController) {
        RCSChatViewController *conversationVC = [[RCSChatViewController alloc] initWithConversationType:model.conversationType targetId:model.targetId];
        conversationVC.conversationType = model.conversationType;
        conversationVC.targetId = model.targetId;
        conversationVC.title = model.conversationTitle;
        if (model.conversationModelType == RC_CONVERSATION_MODEL_TYPE_NORMAL) {
            conversationVC.unReadMessage = model.unreadMessageCount;
            conversationVC.enableNewComingMessageIcon = YES; //开启消息提醒
            conversationVC.enableUnreadMessageIcon = YES;
        }
        [self.navigationController pushViewController:conversationVC animated:YES];
    }else{
        RCLogI(@"navigationController is nil , Please Rewrite `onSelectedTableRow:conversationModel:atIndexPath:` method to implement the conversation cell click to push RCConversationViewController vc");
    }
}

//- (NSMutableArray<RCConversationModel *> *)willReloadTableData:(NSMutableArray<RCConversationModel *> *)dataSource {
//    for (int i = 0; i < 10; i++) {
//        RCConversation *conversation = [[RCConversation alloc] init];
//        conversation.conversationType = ConversationType_PRIVATE;
//        conversation.targetId = [NSString stringWithFormat:@"test_%@", @(i)];
//        conversation.sentTime = [[NSDate date] timeIntervalSince1970] * 1000;
//        conversation.blockStatus = NOTIFY;
//        RCConversationModel *model = [[RCConversationModel alloc] initWithConversation:conversation extend:nil];
//        [dataSource addObject:model];
//    }
//    return dataSource;
//}

@end
