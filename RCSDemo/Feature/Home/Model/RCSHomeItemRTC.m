//
//  RCSHomeItemRTC.m
//  RCSDemo
//
//  Created by shuai shao on 2023/3/14.
//

#import "RCSHomeItem.h"
#import "RCSHomeItemRTC.h"
#import "RCSRTCViewController.h"

@interface RCSHomeItemRTC () <RCSHomeItem>

@end

@implementation RCSHomeItemRTC

+ (void)load {
#if ENABLE_RTC
    [[RCSHomeItem shared] registerClass:[self class]];
#endif
}

+ (NSInteger)index {
    return 10007;
}

- (NSString *)title {
    return @"视频直播";
}

- (NSString *)identifier {
    return kNormalCellIdentifier;
}

- (void)performActionWithSender:(nullable id)sender {
    if (![sender isKindOfClass:[UIViewController class]]) return;
    UIViewController *controller = (UIViewController *)sender;
    RCSRTCViewController *RTC = [[RCSRTCViewController alloc] init];
    [controller.navigationController pushViewController:RTC animated:YES];
    dispatch_async(dispatch_get_main_queue(), ^{ RTC.title = [self title]; });
}

@end
