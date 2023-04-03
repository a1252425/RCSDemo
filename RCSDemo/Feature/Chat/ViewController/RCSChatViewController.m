//
//  RCTempViewController.m
//  TestFramework
//
//  Created by shaoshuai on 2022/12/5.
//

#import "RCSChatViewController.h"

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
    
    [self addOtherPluginBoard];
    
    RCKitConfigCenter.message.enableSendCombineMessage = YES;
    
    Class complexCell = NSClassFromString(@"RCComplexTextMessageCell");
    if (complexCell) { [self registerClass:complexCell forMessageClass:[RCTextMessage class]]; }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.chatSessionInputBarControl.pluginBoardView removeAllItems];
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

- (void)dealloc {
    NSLog(@"dealloc");
}

@end
