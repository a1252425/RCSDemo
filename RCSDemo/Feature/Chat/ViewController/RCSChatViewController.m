//
//  RCTempViewController.m
//  TestFramework
//
//  Created by shaoshuai on 2022/12/5.
//

#import "RCSChatViewController.h"

@interface RCSChatViewController ()

@end

@implementation RCSChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addOtherPluginBoard];
    
    RCKitConfigCenter.message.enableSendCombineMessage = YES;
    
    Class complexCell = NSClassFromString(@"RCComplexTextMessageCell");
    if (complexCell) { [self registerClass:complexCell forMessageClass:[RCTextMessage class]]; }
}

- (void)addOtherPluginBoard {
    if (self.conversationType != ConversationType_APPSERVICE &&
        self.conversationType != ConversationType_PUBLICSERVICE) {
        //加号区域增加发送文件功能，Kit中已经默认实现了该功能，但是为了SDK向后兼容性，目前SDK默认不开启该入口，可以参考以下代码在加号区域中增加发送文件功能。
        RCPluginBoardView *pluginBoardView = self.chatSessionInputBarControl.pluginBoardView;
        [pluginBoardView insertItem:RCResourceImage(@"plugin_item_file")
                   highlightedImage:RCResourceImage(@"plugin_item_file_highlighted")
                              title:RCLocalizedString(@"File")
                            atIndex:3
                                tag:PLUGIN_BOARD_ITEM_FILE_TAG];
    }
}

- (void)didSendMessageModel:(NSInteger)status model:(RCMessageModel *)messageModel {
    NSLog(@"did send message uid: %@, sentTime %@", messageModel.messageUId, @(messageModel.sentTime));
}
//
//- (RCMessageContent *)willSendMessage:(RCMessageContent *)messageContent {
//    if ([messageContent isKindOfClass:[RCImageMessage class]]) {
//        [[RCCoreClient sharedCoreClient] sendMediaMessage:self.conversationType targetId:self.targetId content:messageContent pushContent:nil pushData:nil attached:^(RCMessage * _Nullable message) {
//            
//        } progress:^(int progress, long messageId) {
//            
//        } success:^(long messageId) {
//            
//        } error:^(RCErrorCode errorCode, long messageId) {
//            
//        } cancel:^(long messageId) {
//            
//        }];
//        return nil;
//    }
//    return messageContent;
//}

@end
