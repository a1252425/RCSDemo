//
//  TMPListViewController.m
//  TestFramework
//
//  Created by shaoshuai on 2022/12/8.
//

#import "RCSConversationViewController+Test.h"

#import "RCSChatViewController.h"

@interface RCSConversationViewController ()

@end

@implementation RCSConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self activeTestAction];
        [self sendFirstMessage];
    });
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

@end
