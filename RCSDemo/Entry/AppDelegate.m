//
//  AppDelegate.m
//  RCSDemo
//
//  Created by shuai shao on 2022/12/26.
//

#import "AppDelegate.h"

#define AppKey @"pvxdm17jpw9ur"

#import <UserNotifications/UserNotifications.h>

@interface AppDelegate () <RCIMUserInfoDataSource, RCIMReceiveMessageDelegate, RCIMConnectionStatusDelegate>
{
    NSInteger _connectTime;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [RCIM.sharedRCIM initWithAppKey:AppKey];
    RCIM.sharedRCIM.userInfoDataSource = self;
    RCCoreClient.sharedCoreClient.logLevel = RC_Log_Level_Debug;
    
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [application registerForRemoteNotifications];
                });
            }
        }];
    }
    
    [RCIM.sharedRCIM setReceiveMessageDelegate:self];
    [RCIM.sharedRCIM setConnectionStatusDelegate:self];
    
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
            _connectTime += 1;
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
    
    if (_connectTime >= 1) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            SEL selector = NSSelectorFromString(@"terminateWithSuccess");
//            [[UIApplication sharedApplication] performSelector:selector];
//        });
    }
}

@end
