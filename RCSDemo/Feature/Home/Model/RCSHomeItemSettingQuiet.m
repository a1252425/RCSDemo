//
//  RCSHomeItemSettingQuiet.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "RCSHomeItemSettingQuiet.h"

#import "RCSHomeItem.h"

@interface RCSHomeItemSettingQuiet () <RCSHomeItem>

@property (nonatomic, copy, nullable) NSString *storageKey;

@end

@implementation RCSHomeItemSettingQuiet

+ (void)load {
    [[RCSHomeItem shared] registerClass:[self class]];
}

- (instancetype)init {
    if (self = [super init]) {
        _storageKey = @"RCSQuietEnable";
        BOOL enable = [[NSUserDefaults standardUserDefaults] boolForKey:_storageKey];
        [self updateNotificationQuiet:enable];
    }
    return self;
}

+ (NSInteger)index {
    return 10101;
}

- (NSString *)title {
    return @"免打扰";
}

- (NSString *)identifier {
    return kSwitchCellIdentifier;
}

- (NSString *)storageKey {
    return _storageKey;
}

- (NSValue *)storageValue {
    return [[NSUserDefaults standardUserDefaults] valueForKey:_storageKey];
}

- (void)performActionWithSender:(nullable id)sender {
    if (![sender isKindOfClass:[UISwitch class]]) return;
    BOOL enable = [(UISwitch *)sender isOn];
    [[NSUserDefaults standardUserDefaults] setBool:enable forKey:_storageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self updateNotificationQuiet:enable];
}

- (void)updateNotificationQuiet:(BOOL)enable {
    if (enable) {
        [self enableNotificationQuiet];
    } else {
        [self disableNotificationQuiet];
    }
}

- (void)enableNotificationQuiet {
    [[RCCoreClient sharedCoreClient] setNotificationQuietHours:@"10:00:00"
                                                    spanMins:600
                                                     success:^{
        NSLog(@"setNotificationQuietHours success");
    }
                                                       error:^(RCErrorCode status) {
        NSLog(@"setNotificationQuietHours failed %@", @(status));
    }];
}

- (void)disableNotificationQuiet {
    [[RCCoreClient sharedCoreClient] removeNotificationQuietHours:^{
        NSLog(@"removeNotificationQuietHours success");
    }
                                                          error:^(RCErrorCode status) {
        NSLog(@"removeNotificationQuietHours failed %@", @(status));
    }];
}

@end
