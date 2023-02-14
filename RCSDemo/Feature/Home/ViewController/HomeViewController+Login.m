//
//  HomeViewController+Login.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "HomeViewController+Login.h"

#import "RCSSUser.h"

@implementation HomeViewController (Login)

- (void)showUserIfNeeded {
    NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:@"IM_Token"];
    if (token) { return [self connectIMWithToken:@"6tBEPnmhjykj6rTwC/8zmXcPgOFlZmX4JLwIfj5ax2NahcPun35yWw==@ou8b.cn.rongnav.com;ou8b.cn.rongcfg.com"]; }
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Users" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *items = dict[@"items"];
    
    NSMutableArray<RCSSUser *> *users = [NSMutableArray array];
    for (NSDictionary *item in items) {
        RCSSUser *user = [[RCSSUser alloc] init];
        [user setValuesForKeysWithDictionary:item];
        [users addObject:user];
    }
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"登录" message:@"选择用户" preferredStyle:UIAlertControllerStyleActionSheet];
    for (RCSSUser *user in users) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:user.name style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[NSUserDefaults standardUserDefaults] setObject:user.identifier forKey:@"userId"];
            [[NSUserDefaults standardUserDefaults] setObject:user.name forKey:@"userName"];
            [[NSUserDefaults standardUserDefaults] setObject:user.portrait?:@"" forKey:@"userPortrait"];
            [[NSUserDefaults standardUserDefaults] setObject:user.token forKey:@"IM_Token"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self connectIMWithToken:user.token];
        }];
        [controller addAction:action];
    }
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        exit(999);
    }];
    [controller addAction:action];
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)connectIMWithToken:(NSString *)token {
    [RCIM.sharedRCIM connectWithToken:token dbOpened:^(RCDBErrorCode code) {
    } success:^(NSString *userId) {
        NSLog(@"userId:%@", userId);
        [self didConnect:userId];
    } error:^(RCConnectErrorCode errorCode) {
        NSLog(@"connect error: %d", (int)errorCode);
    }];
}

- (void)didConnect:(NSString *)userId {
    // TODO
}

@end
