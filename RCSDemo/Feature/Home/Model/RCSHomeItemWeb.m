//
//  RCSHomeItemWeb.m
//  RCSDemo
//
//  Created by shuai shao on 2023/6/7.
//

#import "RCSHomeItem.h"
#import "RCSHomeItemWeb.h"

#import "RCSWebViewController.h"

@interface RCSHomeItemWeb () <RCSHomeItem>

@end

@implementation RCSHomeItemWeb

+ (void)load {
    [[RCSHomeItem shared] registerClass:[self class]];
}

//http://webqa.rongcloud.net/static/websdk-demo/api-test-next-origin/develop/

#pragma mark - HomeItem -

+ (NSInteger)index {
    return 10018;
}

- (NSString *)title {
    return @"Web 测试";
}

- (NSString *)identifier {
    return kNormalCellIdentifier;
}

- (void)performActionWithSender:(nullable id)sender {
    NSString *path = @"http://webqa.rongcloud.net/static/websdk-demo/api-test-next-origin/develop/";
    RCSWebViewController *web = [[RCSWebViewController alloc] initWithURL:[NSURL URLWithString:path]];
    [((UIViewController *)sender).navigationController pushViewController:web animated:YES];
}

@end
