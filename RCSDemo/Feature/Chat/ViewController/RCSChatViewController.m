//
//  RCTempViewController.m
//  TestFramework
//
//  Created by shaoshuai on 2022/12/5.
//

#import "RCSChatViewController+Test.h"

#import "RCSDemoCell.h"

@interface RCSTMPShared : NSObject

@property (nonatomic, strong) NSURLSession *session;

+ (instancetype)shared;

@end

@implementation RCSTMPShared

+ (instancetype)shared {
    static RCSTMPShared *instance;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [RCSTMPShared new];
    });
    return instance;
}

- (NSURLSession *)session {
    if (_session) return _session;
    _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    return _session;
}

@end

@interface RCSChatViewController ()

@end

@implementation RCSChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self activeActions];
    
    [self addOtherPluginBoard];
    
//    self.needDeleteRemoteMessage = YES;
    
    RCKitConfigCenter.message.enableSendCombineMessage = YES;
    
    Class complexCell = NSClassFromString(@"RCComplexTextMessageCell");
    if (complexCell) { [self registerClass:complexCell forMessageClass:[RCTextMessage class]]; }
    [self registerClass:[RCSDemoCell class] forMessageClass:[RCTextMessage class]];
}

- (void)chatInputBar:(RCChatSessionInputBarControl *)chatInputBar shouldChangeFrame:(CGRect)frame {
    [super chatInputBar:chatInputBar shouldChangeFrame:frame];
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

//- (RCMessageContent *)willSendMessage:(RCMessageContent *)messageContent {
//    RCMessage *message = [[RCMessage alloc] initWithType:self.conversationType targetId:self.targetId direction:MessageDirection_SEND content:messageContent];
//    message.canIncludeExpansion = YES;
//    message.expansionDic = @{@"k": @"v"};
//    [[RCIM sharedRCIM] sendMessage:message pushContent:nil pushData:nil successBlock:^(RCMessage *successMessage) {
//        
//    } errorBlock:^(RCErrorCode nErrorCode, RCMessage *errorMessage) {
//        
//    }];
//    return nil;
//}

- (void)didTapMessageCell:(RCMessageModel *)model {
    [super didTapMessageCell:model];
    if (![model.content isKindOfClass:[RCTextMessage class]]) return;
    [RCSDemoCell updateCellHeight];
    NSInteger index = [self.conversationDataRepository indexOfObject:model];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    UICollectionViewCell *cell = [self.conversationMessageCollectionView cellForItemAtIndexPath:indexPath];
    if ([cell isKindOfClass:[RCSDemoCell class]]) {
        [(RCSDemoCell *)cell setDataModel:model];
    }
}

- (void)onBeginRecordEvent {
    NSLog(@"onBeginRecordEvent");
}

- (void)onEndRecordEvent {
    NSLog(@"onEndRecordEvent");
}

- (void)dealloc {
    NSLog(@"dealloc");
}

@end
