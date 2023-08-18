//
//  RCSHomeItemContent.m
//  RCSDemo
//
//  Created by shaoshuai on 2023/7/27.
//

#import "RCSHomeItem.h"
#import "RCSHomeItemContent.h"
#import "RCSTextViewController.h"

@interface RCSHomeItemContent () <RCSHomeItem>

@end

@implementation RCSHomeItemContent

+ (void)load {
    [[RCSHomeItem shared] registerClass:[self class]];
}

//http://webqa.rongcloud.net/static/websdk-demo/api-test-next-origin/develop/

#pragma mark - HomeItem -

+ (NSInteger)index {
    return 10028;
}

- (NSString *)title {
    return @"长文本测试";
}

- (NSString *)identifier {
    return kNormalCellIdentifier;
}

- (void)performActionWithSender:(nullable id)sender {
    RCSTextViewController *controller = [[RCSTextViewController alloc] init];
    [((UIViewController *)sender).navigationController pushViewController:controller animated:YES];
}

@end
