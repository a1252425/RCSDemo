//
//  AppDelegate.m
//  RCSDemo
//
//  Created by shuai shao on 2022/12/26.
//

#import <UserNotifications/UserNotifications.h>

#import "AppDelegate.h"
#import "RCCoreClient+keepalive.h"

#define AppKey @"pvxdm17jpw9ur"

@interface AppDelegate () <RCIMUserInfoDataSource, RCIMReceiveMessageDelegate, RCIMConnectionStatusDelegate, UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [RCIM.sharedRCIM initWithAppKey:AppKey];
    RCIM.sharedRCIM.userInfoDataSource = self;
    RCCoreClient.sharedCoreClient.logLevel = RC_Log_Level_Debug;
    RCCoreClient.sharedCoreClient.forceKeepAlive = YES;
    
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                [self addNotificationCategory];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [application registerForRemoteNotifications];
                });
            }
        }];
        center.delegate = self;
    }
    
    [RCIM.sharedRCIM setReceiveMessageDelegate:self];
    [RCIM.sharedRCIM setConnectionStatusDelegate:self];
    
    [[NSUserDefaults standardUserDefaults] setObject:@(84) forKey:@"DemoCellHeight"];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[RCCoreClient sharedCoreClient] setDeviceTokenData:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"didFailToRegisterForRemoteNotificationsWithError %@", error.localizedDescription);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"applicationWillTerminate");
}

#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

#pragma mark - RCIMUserInfoDataSource -

- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion {
    completion([[RCUserInfo alloc] initWithUserId:userId name:userId portrait:nil]);
}

#pragma mark - RCIMReceiveMessageDelegate -

- (void)onRCIMReceiveMessage:(RCMessage *)message left:(int)left {
    NSLog(@"onRCIMReceiveMessage");
}

#pragma mark - RCIMConnectionStatusDelegate -

- (void)onRCIMConnectionStatusChanged:(RCConnectionStatus)status {
    switch (status) {
        case ConnectionStatus_Connecting:
            break;
        case ConnectionStatus_Connected:
            NSLog(@"IM status did connected");
            break;
            
        case ConnectionStatus_Suspend:
            NSLog(@"IM status did suspend");
            break;
            
        case ConnectionStatus_Unconnected:
            NSLog(@"IM status did unconnected");
            break;
            
        case ConnectionStatus_SignOut:
            NSLog(@"IM status did sign out");
            break;
            
        default:
            NSLog(@"IM status did changed: %@", @(status));
            break;
    }
}

- (void)addNotificationCategory {
    UNNotificationAction *ignoreAction = [UNNotificationAction actionWithIdentifier:@"ignore"
                                                                              title:@"忽略"
                                                                            options:UNNotificationActionOptionNone];
    UNNotificationAction *replayAction = [UNTextInputNotificationAction actionWithIdentifier:@"reply"
                                                                                       title:@"回复"
                                                                                     options:UNNotificationActionOptionNone
                                                                        textInputButtonTitle:@"发送"
                                                                        textInputPlaceholder:@"请输入回复信息"];
    UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"message"
                                                                              actions:@[ignoreAction, replayAction]
                                                                    intentIdentifiers:@[]
                                                                              options:UNNotificationCategoryOptionNone];
    [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:[NSSet setWithObject:category]];
}

#pragma mark - UNUserNotificationCenterDelegate -

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    if (@available(iOS 14.0, *)) {
        completionHandler(UNNotificationPresentationOptionList|UNNotificationPresentationOptionBanner);
    } else {
        completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert);
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    NSString *categoryIdentifier = response.notification.request.content.categoryIdentifier;
    UNNotificationContent *content = response.notification.request.content;
    if ([categoryIdentifier isEqualToString:@"message"]) {
        if ([response.actionIdentifier isEqualToString:@"reply"]) {
            NSDictionary *userInfo = content.userInfo;
            NSString *userId = [self getUserIdFromRemotePushInfo:userInfo];
            
            UNTextInputNotificationResponse *tResponse = (UNTextInputNotificationResponse *)response;
            NSString *userText = tResponse.userText;
            
            [self replyMessage:userId content:userText completion:^(BOOL success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionHandler();
                });
            }];
            return;
        }
    }
    completionHandler();
}

// https://doc.rongcloud.cn/im/IOS/5.X/noui/push/apns#pushData
- (nullable NSString *)getUserIdFromRemotePushInfo:(NSDictionary *)info {
    NSDictionary *rc = info[@"rc"];
    if (![rc isKindOfClass:[NSDictionary class]]) return nil;
    NSString *userId = rc[@"tId"];
    if (![userId isKindOfClass:[NSString class]]) return nil;
    return userId;
}

- (void)replyMessage:(NSString *)userId content:(NSString *)content completion:(void(^)(BOOL))completion {
    NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:@"IM_Token"];
    if (!token.length || !userId || !content) return !completion?:completion(NO);
    [RCIM.sharedRCIM initWithAppKey:AppKey option:nil];
    [[RCIM sharedRCIM] connectWithToken:token dbOpened:^(RCDBErrorCode code) {
    } success:^(NSString *userId) {
        RCTextMessage *message = [RCTextMessage messageWithContent:content];
        [[RCIM sharedRCIM] sendMessage:ConversationType_PRIVATE targetId:userId content:message pushContent:nil pushData:nil success:^(long messageId) {
            !completion?:completion(YES);
        } error:^(RCErrorCode nErrorCode, long messageId) {
            !completion?:completion(NO);
        }];
    } error:^(RCConnectErrorCode errorCode) {
        !completion?:completion(NO);
    }];
}

@end
