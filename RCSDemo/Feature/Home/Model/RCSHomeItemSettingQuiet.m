//
//  RCSHomeItemSettingQuiet.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "RCSHomeItemSettingQuiet.h"

#import "RCSHomeItem.h"

@interface RCSHomeItemSettingQuiet () <RCSHomeItemProtocol>

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
    [[RCIMClient sharedRCIMClient] setNotificationQuietHours:@"12:00:00"
                                                    spanMins:1440
                                                     success:^{}
                                                       error:^(RCErrorCode status) {}];
}

- (void)disableNotificationQuiet {
    [[RCIMClient sharedRCIMClient] removeNotificationQuietHours:^{}
                                                          error:^(RCErrorCode status) {}];
}

@end