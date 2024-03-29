//
//  RCSChatsViewController+Test.m
//  RCSDemo
//
//  Created by shuai shao on 2023/2/7.
//

#import "RCSChatsViewController+Test.h"

@implementation RCSChatsViewController (Test)

+ (void)load {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        void(^block)(id<AspectInfo>) = ^(id<AspectInfo> info){
            NSLog(@"did hook view did load");
            [(RCSChatsViewController *)info.instance activeActions];
        };
        NSError *error;
        [RCSChatsViewController aspect_hookSelector:@selector(viewDidLoad)
                                    withOptions:AspectPositionAfter
                                     usingBlock:block
                                          error:&error];
        if (error) {
            NSLog(@"Hook view did load failed %@", error.localizedDescription);
        }
    });
}

- (void)activeActions {
    [self addGesture];
    [self sendFirstMessage];
}

- (void)addGesture {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapActionHandler:)];
    gesture.numberOfTapsRequired = 2;
    [self.navigationController.navigationBar addGestureRecognizer:gesture];
}

- (void)tapActionHandler:(UITapGestureRecognizer *)gesture {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示" message:@"发送文本消息" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:NULL];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *userID = controller.textFields.firstObject.text;
        NSString *content = controller.textFields.lastObject.text;
        if (userID.length == 0 || content.length == 0) return;
        RCTextMessage *message = [RCTextMessage messageWithContent:content];
        [[RCIM sharedRCIM] sendMessage:ConversationType_PRIVATE targetId:userID content:message pushContent:@"test" pushData:nil success:^(long messageId) {
        } error:^(RCErrorCode nErrorCode, long messageId) {
        }];
    }];
    [controller addAction:cancelAction];
    [controller addAction:sureAction];
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入目标用户 ID";
    }];
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入发送的文本内容";
    }];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)sendFirstMessage {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"SendFirstMessage"]) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"SendFirstMessage"];
    RCTextMessage *message = [RCTextMessage messageWithContent:@"test"];
    [[RCIM sharedRCIM] sendMessage:ConversationType_PRIVATE targetId:@"tree" content:message pushContent:nil pushData:nil success:^(long messageId) {
    } error:^(RCErrorCode nErrorCode, long messageId) {
    }];
}

@end
