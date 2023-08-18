//
//  RCSHomeItemLogout.m
//  RCSDemo
//
//  Created by shaoshuai on 2023/8/18.
//

#import "RCSHomeItem.h"
#import "RCSHomeItemLogout.h"

@interface RCSHomeItemLogout () <RCSHomeItem>

@end

@implementation RCSHomeItemLogout

+ (void)load {
    [[RCSHomeItem shared] registerClass:[self class]];
}

#pragma mark - HomeItem -

+ (NSInteger)index {
    return NSIntegerMax;
}

- (NSString *)title {
    return @"退出登录";
}

- (NSString *)identifier {
    return kNormalCellIdentifier;
}

- (void)performActionWithSender:(nullable id)sender {
    [[RCCoreClient sharedCoreClient] logout];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"IM_Token"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"IM_Logout" object:nil];
}

@end
