//
//  AppDelegate.m
//  RCSDemo
//
//  Created by shuai shao on 2022/12/26.
//

#import "AppDelegate.h"

#define AppKey @"pvxdm17jpw9ur"

#import <UserNotifications/UserNotifications.h>
#import "RCCoreClient+keepalive.h"

@interface AppDelegate () <RCIMUserInfoDataSource, RCIMReceiveMessageDelegate>

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
        }];
    }
    
    [RCIM.sharedRCIM setReceiveMessageDelegate:self];
    
    RCCoreClient.sharedCoreClient.forceKeepAlive = YES;
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
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

@end
